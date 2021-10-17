package refactoring;

import enums.VariableType;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;

import static enums.ProgramBlockVariableType.INPUT_PARAMETER;
import static enums.ProgramBlockVariableType.RETURN_VARIABLE;
import static enums.VariableType.CUSTOM_RECORD;
import static enums.VariableType.CUSTOM_VARRAY;

public class ParametersSpecificationCreator implements TlaSpecificationCreator {
    private final DatabaseSchema databaseSchema;
    private final ProgramBlocksDataHolder programBlocksDataHolder;
    private static final String defaultColumnPolicy = "[loc|->\"persistence\", policy |-> min]";

    public ParametersSpecificationCreator(DatabaseSchema databaseSchema, ProgramBlocksDataHolder programBlocksDataHolder) {
        this.databaseSchema = databaseSchema;
        this.programBlocksDataHolder = programBlocksDataHolder;
    }

    @Override
    public void createSpecification(File destinationFile) {
        try (BufferedWriter bufferedWriter = new BufferedWriter(new FileWriter(destinationFile))) {
            writeParametersHeader(bufferedWriter);
            writeColumnPolicies(bufferedWriter);
            writeCalls(bufferedWriter);
            writeVariablePolicies(bufferedWriter);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void writeParametersHeader(BufferedWriter bufferedWriter) throws IOException {
        bufferedWriter.write(
                "EXTENDS Naturals, Sequences\n" +
                        "CONSTANT U, UU, NONE, ALL, E0, E1, Undef, GPol, Session_number\n" +
                        "VARIABLES Sessions, XLocks, VPol, Trace, SLocks, Ignore, StateE, New2Old\n" +
                        "vars == <<Sessions, SLocks, StateE, New2Old, XLocks, VPol, Trace, Ignore>>\n" +
                        "INSTANCE Paralocks WITH U <- U, UU <- UU, NONE <- NONE, E0 <- E0, E1 <- E1, Undef <- Undef, GPol <- GPol\n" +
                        "min == {<<CHOOSE x \\in UU: TRUE, <<[e1 \\in E0 |-> {NONE}],  [e2 \\in E1 |-> {NONE}]>> >>}\n" +
                        "any_caller(x) == {<<x, <<[e1 \\in E0 |-> {NONE}], [e2 \\in E1 |-> {NONE}]>> >>}\n" +
                        "max == {}\n" +
                        "u1 == CHOOSE i \\in UU: TRUE\n" +
                        "u2 == CHOOSE j \\in UU: j#u1\n" +
                        "S ==  CHOOSE s \\in SUBSET(U) : Cardinality(s) = Session_number\n\n");
    }

    private void writeColumnPolicies(BufferedWriter bufferedWriter) throws IOException {
        for (Table table : databaseSchema.getTables().values()) {
            for (Table.Column column : table.getColumns()) {
                bufferedWriter.write(column.getColumnPolicy() + " == " + defaultColumnPolicy + "\n");
            }
            bufferedWriter.write("\n");
        }
    }

    private void writeCalls(BufferedWriter bufferedWriter) throws IOException {
        StringBuilder stringBuilder = new StringBuilder("Calls == {");
        for (ProgramBlockData programBlockData : programBlocksDataHolder.getProgramBlocksData()) {
            stringBuilder.append('\"').append(programBlockData.getProgramBlockName()).append("\",");
        }
        stringBuilder.replace(stringBuilder.lastIndexOf(","), stringBuilder.length(), "}\n");
        bufferedWriter.write(stringBuilder + "\n");
    }

    private void writeVariablePolicies(BufferedWriter bufferedWriter) throws IOException {
        for (ProgramBlockData programBlockData : programBlocksDataHolder.getProgramBlocksData()) {
            int offset = 0;
            int numberOfColumnsInRecord = programBlockData.getNumberOfColumnsInRecord();
            for (Variable variable : programBlockData.getVariables()) {
                VariableType variableType = variable.getVariableType();
                StringBuilder policyName = new StringBuilder(variable.getVariablePolicyName());
                if (variableType == CUSTOM_RECORD) {
                    policyName.append("_").append(CUSTOM_RECORD.getShortName()).append("_c");
                    for (int i = 1; i < numberOfColumnsInRecord + 1; i++) {
                        StringBuilder recordPolicyName = new StringBuilder(policyName.toString() + i);
                        bufferedWriter.write(recordPolicyName + "(x) == " + getPolicy(variable, offset++, recordPolicyName.toString()) + "\n");
                    }
                } else if (variableType == CUSTOM_VARRAY) {
                    policyName.append("_").append(CUSTOM_VARRAY.getShortName()).append("_e");
                    for (int i = 1; i < 3; i++) {
                        for (int j = 1; j < numberOfColumnsInRecord + 1; j++) {
                            StringBuilder varrayPolicyName = new StringBuilder(policyName.toString() + i + "_c" + j);
                            bufferedWriter.write(varrayPolicyName + "(x) == " + getPolicy(variable, offset++, varrayPolicyName.toString()) + "\n");
                        }
                    }
                } else {
                    bufferedWriter.write(policyName + "(x) == " + getPolicy(variable, offset++, policyName.toString()) + "\n");
                }
            }
            bufferedWriter.write("\n");
        }
    }

    private String getPolicy(Variable variable, int offset, String policyName) {
        if (variable.getProgramBlockVariableType() == RETURN_VARIABLE || variable.getProgramBlockVariableType() == INPUT_PARAMETER) {
            return "[loc|->\"mem\", offs |-> " + offset + ", policy |-> any_caller(x), name |-> " + "\"" + policyName + "\"" + "]";
        } else {
            return "[loc|->\"mem\", offs |-> " + offset + ", policy |-> min, name |-> " + "\"" + policyName + "\"" + "]";
        }
    }

    public static void main(String[] args) {
        long t = System.currentTimeMillis();
        DatabaseSchema databaseSchema = new DatabaseSchema("D:\\JavaProjects\\AntlrTesting\\src\\main\\resources\\programblocks");
        ProgramBlocksDataHolder programBlocksDataHolder = new ProgramBlocksDataHolder("D:\\JavaProjects\\AntlrTesting\\src\\main\\resources\\programblocks");
        System.out.println(programBlocksDataHolder.getProgramBlocksData().size());
        ParametersSpecificationCreator parametersSpecificationCreator = new ParametersSpecificationCreator(databaseSchema, programBlocksDataHolder);
        parametersSpecificationCreator.createSpecification(new File("D:\\JavaProjects\\AntlrTesting\\src\\main\\resources\\programblocks\\param.tla"));
        System.out.println(System.currentTimeMillis() - t);
    }
}