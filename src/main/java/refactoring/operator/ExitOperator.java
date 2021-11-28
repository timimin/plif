package refactoring.operator;

import enums.ProgramBlockType;
import refactoring.ProgramBlockData;
import refactoring.Variable;

import java.util.List;
import java.util.Optional;

import static util.CommonUtil.*;

public class ExitOperator extends AbstractSqlOperator {

    public ExitOperator(int numberOfLineInProgramBlock, ProgramBlockData programBlockData) {
        super(numberOfLineInProgramBlock, programBlockData);
    }

    @Override
    public String getOperatorRule() {
        StringBuilder exitRule = new StringBuilder(getOperatorRuleName())
                .append(" ==\n/\\ IF Len(Sessions[id][\"StateRegs\"]) = 1\n THEN XLocks' = Undef\n ELSE XLocks' = XLocks\n/\\ Sessions' =\n [Sessions EXCEPT\n ![id][\"StateRegs\"] = Tail(Sessions[id][\"StateRegs\"]) \\o <<>>,\n ");
        if (programBlockData.getProgramBlockType() == ProgramBlockType.FUNCTION) {
            Optional<Variable> returnVariable = getReturnVariable(programBlockData);
            if (returnVariable.isEmpty()) {
                throw new IllegalStateException("У функции отсутствует возвращаемое значение");
            } else {
                List<String> policiesWithSuffix = appendSuffixToVariablePolicies(returnVariable.get(), "(id).offs");
                exitRule.append("![id][\"Ret\"] =\n <<\n");
                policiesWithSuffix.forEach(policy -> exitRule.append(" Sessions[id][\"SessionM\"][Head(Sessions[id][\"StateRegs\"]).fp + ").append(policy).append("],\n"));
                replaceEndOfString(exitRule, ",\n", "\n >>,\n ");
            }
        }
        exitRule.append("![id][\"SessionM\"] = SubSeq(Sessions[id][\"SessionM\"], 1, Len(Sessions[id][\"SessionM\"]) - ")
                .append(programBlockData.getVariables().values().stream().mapToInt(variable -> variable.getVariablePolicies().size()).sum())
                .append(")]\n/\\ Trace' = Append(Trace,<<>>)\n/\\ Ignore'= 1\n/\\ SLocks' = SLocks\n/\\ StateE' = SLocks'[id]\n/\\ UNCHANGED <<New2Old, VPol>>\n\n");
        return exitRule.toString();
    }

    @Override
    public String getLabel() {
        return surroundWithQuotes("exit");
    }

    @Override
    public String getOperatorRuleName() {
        return programBlockData.getProgramBlockName() + "_exit(id)";
    }
}