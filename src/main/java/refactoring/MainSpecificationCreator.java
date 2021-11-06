package refactoring;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.List;

import static enums.ProgramBlockVariableType.INPUT_PARAMETER;
import static util.CommonUtil.*;
import static util.Constants.END_OF_MODULE;

public class MainSpecificationCreator implements TlaSpecificationCreator {
    private final DatabaseSchema databaseSchema;
    private final ProgramBlocksDataHolder programBlocksDataHolder;

    public MainSpecificationCreator(DatabaseSchema databaseSchema, ProgramBlocksDataHolder programBlocksDataHolder) {
        this.databaseSchema = databaseSchema;
        this.programBlocksDataHolder = programBlocksDataHolder;
    }

    @Override
    public void createSpecification(File destinationFile) {
        try (BufferedWriter bufferedWriter = new BufferedWriter(new FileWriter(destinationFile))) {
            bufferedWriter.write(getModuleDeclarationLine(destinationFile) + "\n");
            writeProgramBlocksLoadRules(bufferedWriter);
            writeDispatchRule(bufferedWriter);
            writeInitRule(bufferedWriter);
            writeNextRule(bufferedWriter);
            writeSpecFSRule(bufferedWriter);
            bufferedWriter.write(END_OF_MODULE);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void writeProgramBlocksLoadRules(BufferedWriter bufferedWriter) throws IOException {
        for (ProgramBlockData pbd : programBlocksDataHolder.getProgramBlocksData()) {
            bufferedWriter.write(getProgramBlockLoadRule(pbd));
        }
    }

    private String getProgramBlockLoadRule(ProgramBlockData programBlockData) {
        StringBuilder loadRule = new StringBuilder(programBlockData.getProgramBlockName());
        loadRule.append("_load(id) ==\nIF XLocks = Undef\nTHEN\n/\\ XLocks' = id\n/\\ Sessions' =\n[\nSessions EXCEPT ![id][\"SessionM\"] = Sessions[id][\"SessionM\"] \\o\n");
        StringBuilder newVariablePolicies = new StringBuilder("<<");
        List<List<String>> variablePoliciesWithIdAndPolicySuffix = appendSuffixToAllVariablePolicies(programBlockData, "(id).policy,\n");
        programBlockData.getVariables().forEach(
                variable ->
                {
                    if (variable.getProgramBlockVariableType() == INPUT_PARAMETER)
                        newVariablePolicies.append("min,\n");
                    else {
                        List<String> variablePoliciesWithSuffix = appendSuffixToVariablePolicies(variable, "(id).policy,\n");
                        variablePoliciesWithSuffix.forEach(newVariablePolicies::append);
                    }
                }
        );
        newVariablePolicies.replace(newVariablePolicies.lastIndexOf(",\n"), newVariablePolicies.length(), ">>");
        loadRule.append(newVariablePolicies).append("\n]\n/\\ New2Old' =\n<<\n<<");
        variablePoliciesWithIdAndPolicySuffix.forEach(policy -> policy.forEach(loadRule::append));
        loadRule.replace(loadRule.lastIndexOf(",\n"), loadRule.length(), ">>");
        loadRule.append(",\n").append(newVariablePolicies).append("\n>>\n/\\ Ignore' = 0\n/\\ SLocks' = SLocks\n/\\ StateE' = SLocks'[id]\n/\\ UNCHANGED <<VPol>>\nELSE UNCHANGED vars\n\n");
        return loadRule.toString();
    }

    private void writeDispatchRule(BufferedWriter bufferedWriter) throws IOException {
        StringBuilder dispatchRule = new StringBuilder("dispatch(id,st) ==\nCASE\n/\\ ");
        List<ProgramBlockData> programBlocksData = programBlocksDataHolder.getProgramBlocksData();
        for (int i = 0; i < programBlocksData.size(); i++) {
            dispatchRule.append(getDispatcherCaseClauseForProgramBlock(programBlocksData.get(i), i == 0)).append('\n');
        }
        bufferedWriter.write(dispatchRule.toString());
    }

    private String getDispatcherCaseClauseForProgramBlock(ProgramBlockData programBlockData, boolean isFirstClause) {
        StringBuilder stringBuilder = isFirstClause ? new StringBuilder("Head(st).pc[1] = ") : new StringBuilder("[] Head(st).pc[1] = ");
        String programBlockName = programBlockData.getProgramBlockName();
        stringBuilder.append(surroundWithQuotes(programBlockName))
                .append("\n/\\ Sessions[id][\"SessionM\"] = <<>> ->\n")
                .append("   /\\ ").append(programBlockName).append("_load(id)\n")
                .append("   /\\ Trace' = Append(Trace,<<>>)\n")
                .append("[] /\\ Head(st).pc[1] = ").append(surroundWithQuotes(programBlockName))
                .append("\n/\\ Sessions[id][\"SessionM\"] # <<>> -> ").append(programBlockName).append("(id, st)\n");
        return stringBuilder.toString();

    }

    //TODO может сделать методы возвращающие строку, а в самом createSpecification уже писать?
    private void writeInitRule(BufferedWriter bufferedWriter) throws IOException {
        StringBuilder initRule = new StringBuilder("Init ==\nLET pc == [{\"pc\"} ->\n{");
        for (ProgramBlockData pbd : programBlocksDataHolder.getProgramBlocksData()) {
            initRule.append(surroundWithAngleBrackets(
                    surroundWithQuotes(pbd.getProgramBlockName())
                            + ", "
                            + surroundWithQuotes(pbd.getOperators().get(0).getLabel()))).append(",\n");
        }
        initRule.setCharAt(initRule.lastIndexOf(","), '}');
        initRule.append("]\n")
                .append("IN\n" +
                        "/\\ Trace = <<>>\n" +
                        "/\\ StateE = [e1 \\in E0 |-> {}] @@ [e2 \\in E1 |-> {}]\n" +
                        "/\\ Sessions \\in \n" +
                        "     [S -> \n" +
                        "          ReduceSet(LAMBDA x, y: x \\cup \n" +
                        "              {y @@ [SessionM |-> <<>>]\n" +
                        "                 @@ [PCLabel  |-> <<min>>]\n" +
                        "                 @@ [Ret      |-> Undef]},\n" +
                        "                 {}, \n" +
                        "                 [{\"StateRegs\"} -> \n" +
                        "                      ReduceSet (LAMBDA x, y: \n" +
                        "                          x \\cup ({<<y @@ [fp |->1]>>}), {}, pc) ])\n     ]\n" +
                        "/\\ SLocks = \n" +
                        "     [s \\in S |-> [e1 \\in E0 |-> {}] \n" +
                        "      @@ [e2 \\in E1 |-> {}]]\n" +
                        "/\\ New2Old = <<>>\n" +
                        "/\\ Ignore = 0\n" +
                        "/\\ XLocks = Undef\n" +
                        "/\\ VPol =\n[\n");
        for (Table table : databaseSchema.getTables().values()) {
            for (Table.Column column : table.getColumns()) {
                String columnPolicy = column.getColumnPolicy();
                initRule.append(columnPolicy)
                        .append(" |-> [ext|->0, policy |-> min, name |-> ")
                        .append(surroundWithQuotes(columnPolicy))
                        .append("],\n");
            }
            initRule.append("\n");
        }
        initRule.setCharAt(initRule.lastIndexOf(","), '\n');
        initRule.append("]\n");
        bufferedWriter.write(initRule.toString());
    }


    private void writeNextRule(BufferedWriter bufferedWriter) throws IOException {
        bufferedWriter.write("Next(K(_,_)) == \n" +
                "        \\/ \\E  s \\in S :\n" +
                "            /\\ Sessions[s][\"StateRegs\"] # <<>>\n" +
                "            /\\ K(s,Sessions[s][\"StateRegs\"])\n" +
                "        \\/ \\A  s \\in S : \n" +
                "            /\\ Sessions[s][\"StateRegs\"] = <<>>\n" +
                "            /\\ UNCHANGED vars\n");
    }

    //TODO может назвать по-другому? Или добавить вариативность названия правила
    private void writeSpecFSRule(BufferedWriter bufferedWriter) throws IOException {
        bufferedWriter.write("SpecFS == Init /\\ [] [Next(dispatch)]_vars\n");
    }

    public static void main(String[] args) {
        long t = System.currentTimeMillis();
        DatabaseSchema databaseSchema = new DatabaseSchema("D:\\JavaProjects\\AntlrTesting\\src\\main\\resources\\programblocks");
        ProgramBlocksDataHolder programBlocksDataHolder = new ProgramBlocksDataHolder("D:\\JavaProjects\\AntlrTesting\\src\\main\\resources\\programblocks");
        System.out.println(programBlocksDataHolder.getProgramBlocksData().size());
        MainSpecificationCreator mainSpecificationCreator = new MainSpecificationCreator(databaseSchema, programBlocksDataHolder);
        mainSpecificationCreator.createSpecification(new File("D:\\JavaProjects\\AntlrTesting\\src\\main\\resources\\programblocks\\ConferenceProcFs.tla"));
        System.out.println(System.currentTimeMillis() - t);
    }
}