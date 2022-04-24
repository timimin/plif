package generation.operator;

import generation.ProgramBlockData;
import generation.Variable;
import generation.enums.OperatorType;

import java.util.List;
import java.util.stream.Collectors;

import static generation.enums.ProgramBlockVariableType.RETURN_VARIABLE;
import static util.CommonUtil.*;
import static util.Constants.COMMA_WITH_LINE_BREAK;
import static util.Constants.UNCHANGED_TRACE;
import static util.OperatorUtil.appendNextRuleLabel;

public class ReturnOperator extends SqlOperator {
    private String returnableVariableName;

    public ReturnOperator(int numberOfLineInProgramBlock, ProgramBlockData programBlockData, OperatorType operatorType) {
        super(numberOfLineInProgramBlock, programBlockData, operatorType);
    }

    @Override
    public String getOperatorRule() {
        StringBuilder operatorRule = new StringBuilder(getOperatorRuleNameWithId()).append(" ==\n/\\ return(id, <<\n ");
        List<Variable> returnVariables = programBlockData.getVariables().values().stream()
                .filter(variable -> variable.getProgramBlockVariableType() == RETURN_VARIABLE).collect(Collectors.toList());
        if (returnVariables.size() != 1) {
            throw new IllegalStateException("У функции более одной возращаемой переменной");
        } else {
            Variable returnVariable = returnVariables.get(0);//переменная с типом в программном блоке - возвращаемое значение
            appendSuffixToVariablePolicies(returnVariable, "(id)" + COMMA_WITH_LINE_BREAK).forEach(operatorRule::append);
            replaceEndOfString(operatorRule, COMMA_WITH_LINE_BREAK, ">>,\n <<\n ");
            Variable returnableVariable = programBlockData.getVariables().get(returnableVariableName);//возвращаемая переменная или литерал
            if (returnableVariable != null) {
                loadVariablePolicies(operatorRule, returnableVariable, ">>,\n <<\n ");
            } else {
                operatorRule.append("min>>,\n <<\n ");
            }
            appendNextRuleLabel(operatorRule, programBlockData, numberOfLineInProgramBlock);
            operatorRule.append("\n >>)\n").append(UNCHANGED_TRACE)
                    .append("/\\ Ignore' = 0\n/\\ SLocks' = SLocks\n/\\ StateE' = SLocks'[id]\n/\\ XLocks' = XLocks\n/\\ VPol' = VPol\n\n");
        }
        return operatorRule.toString();
    }

    public void setReturnableVariableName(String returnableVariableName) {
        this.returnableVariableName = returnableVariableName;
    }
}
