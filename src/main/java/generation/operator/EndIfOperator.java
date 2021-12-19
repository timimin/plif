package generation.operator;

import generation.ProgramBlockData;
import generation.enums.OperatorType;

import static util.Constants.UNCHANGED_TRACE;
import static util.OperatorUtil.appendNextRuleLabel;

public class EndIfOperator extends SqlOperator {

    public EndIfOperator(int numberOfLineInProgramBlock, ProgramBlockData programBlockData, OperatorType operatorType) {
        super(numberOfLineInProgramBlock, programBlockData, operatorType);
    }

    @Override
    public String getOperatorRule() {
        StringBuilder operatorRule = new StringBuilder(getOperatorRuleName()).append(" ==\n/\\ ifend(id, <<");
        String unchangedVariablesInEndIf = "/\\ UNCHANGED <<StateE, New2Old, XLocks, VPol, SLocks, Ignore>>\n\n";
        appendNextRuleLabel(operatorRule, programBlockData, numberOfLineInProgramBlock);
        operatorRule.append(">>)\n").append(UNCHANGED_TRACE).append(unchangedVariablesInEndIf);
        return operatorRule.toString();
    }
}