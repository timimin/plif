package generation.operator;

import generation.ProgramBlockData;
import generation.Variable;
import generation.enums.OperatorType;
import generation.enums.ProgramBlockType;

import java.util.List;
import java.util.Optional;

import static util.CommonUtil.*;
import static util.Constants.COMMA_WITH_LINE_BREAK;

public class ExitOperator extends SqlOperator {

    public ExitOperator(int numberOfLineInProgramBlock, ProgramBlockData programBlockData, OperatorType operatorType) {
        super(numberOfLineInProgramBlock, programBlockData, operatorType);
    }

    @Override
    public String getOperatorRule() {
        StringBuilder exitRule = new StringBuilder(getOperatorRuleNameWithId())
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
                .append(")]\n").append(getTrace()).append("/\\ Ignore' = 1\n/\\ SLocks' = SLocks\n/\\ StateE' = SLocks'[id]\n/\\ UNCHANGED <<New2Old, VPol>>\n\n");
        return exitRule.toString();
    }

    @Override
    protected String getTrace() {
        return "/\\ Trace' = Append(Trace, <<id," + (surroundWithQuotes(getOperatorRuleName()) + COMMA_WITH_LINE_BREAK).repeat(2) + "[from |-> << >>, to |-> << >>]>>)\n ";
    }

    @Override
    public String getLabel() {
        return surroundWithQuotes("exit");
    }

    @Override
    public String getOperatorRuleName() {
        return programBlockData.getProgramBlockName() + "_exit";
    }
}