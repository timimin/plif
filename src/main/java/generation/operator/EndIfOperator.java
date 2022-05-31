package generation.operator;

import generation.ProgramBlockData;
import generation.enums.OperatorType;

import static util.CommonUtil.surroundWithQuotes;
import static util.Constants.COMMA_WITH_LINE_BREAK;
import static util.OperatorUtil.appendNextRuleLabel;

public class EndIfOperator extends SqlOperator {

    public EndIfOperator(int numberOfLineInProgramBlock, ProgramBlockData programBlockData, OperatorType operatorType) {
        super(numberOfLineInProgramBlock, programBlockData, operatorType);
    }

    @Override
    public String getOperatorRule() {
        StringBuilder operatorRule = new StringBuilder(getOperatorRuleNameWithId()).append(" ==\n/\\ ifend(id, <<");
        String unchangedVariablesInEndIf = "/\\ UNCHANGED <<StateE, New2Old, XLocks, VPol, SLocks, Ignore>>\n\n";
        appendNextRuleLabel(operatorRule, programBlockData, numberOfLineInProgramBlock);
        operatorRule.append(">>)\n").append(getTrace()).append(unchangedVariablesInEndIf);
        return operatorRule.toString();
    }

    @Override
    protected String getTrace() {
        return "/\\ Trace' = Append(Trace,<<id,\n " + surroundWithQuotes(getOperatorRuleName()) + COMMA_WITH_LINE_BREAK
                + "\"endif\"" + COMMA_WITH_LINE_BREAK + "[from |-> <<<<[policy |-> LUB4Seq(Sessions[id][\"PCLabel\"]), name |-> \"PCLabel\"]>>>>,\n"
                + " to |-> <<[policy |-> LUB4Seq(Sessions[id][\"PCLabel\"]), name |-> \"PCLabel\"]>>]>>)\n ";
    }
}