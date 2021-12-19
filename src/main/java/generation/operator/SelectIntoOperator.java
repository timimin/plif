package generation.operator;

import generation.ProgramBlockData;
import generation.Variable;
import generation.enums.OperatorType;

import java.util.*;

import static util.CommonUtil.*;
import static util.Constants.COMMA_WITH_LINE_BREAK;
import static util.Constants.UNCHANGED_TRACE;
import static util.OperatorUtil.appendConditionalExpressions;
import static util.OperatorUtil.appendNextRuleLabel;

public class SelectIntoOperator extends SqlOperator {
    private final List<String> insertedVariables;
    private final List<String> selectedExpressions;
    private final Set<String> conditionalExpressions;

    {
        insertedVariables = new ArrayList<>();
        selectedExpressions = new ArrayList<>();
        conditionalExpressions = new LinkedHashSet<>();
    }

    public SelectIntoOperator(int numberOfLineInProgramBlock, ProgramBlockData programBlockData, OperatorType operatorType) {
        super(numberOfLineInProgramBlock, programBlockData, operatorType);
    }

    public List<String> getInsertedVariables() {
        return insertedVariables;
    }

    public List<String> getSelectedExpressions() {
        return selectedExpressions;
    }

    public Set<String> getConditionalExpressions() {
        return conditionalExpressions;
    }

    @Override
    public String getOperatorRule() {
        StringBuilder operatorRule = new StringBuilder(getOperatorRuleName()).append(" ==\n/\\ select(id, <<\n ");
        Map<String, Variable> variables = programBlockData.getVariables();
        List<String> policies = new ArrayList<>();
        insertedVariables.forEach(variableName -> policies.addAll(variables.get(variableName).getVariablePolicies()));
        policies.forEach(policy -> operatorRule.append(policy).append("(id),\n "));
        replaceEndOfString(operatorRule, COMMA_WITH_LINE_BREAK, ">>,\n <<\n ");
        int expressionCounter = 0;
        outerLoop:
        while (expressionCounter != policies.size()) {
            for (String expression : selectedExpressions) {
                if (expression.startsWith("\"col_"))
                    operatorRule.append("VPol[").append(expression).append("].policy,\n ");
                else {
                    String expColumnPolicy = involvedTable.getColumnPolicy(expression);
                    Variable expVariable = variables.get(expression);
                    if (expColumnPolicy != null) {
                        operatorRule.append("VPol[").append(surroundWithQuotes(expColumnPolicy)).append("].policy,\n ");
                    } else if (expVariable != null) {
                        loadVariablePolicies(operatorRule, expVariable);
                    }//TODO может здесь будет поддержка литералов
                    else {
                        operatorRule.append("min,\n ");
                    }
                }
                expressionCounter++;
                if (expressionCounter == policies.size()) {
                    break outerLoop;
                }
            }
        }
        replaceEndOfString(operatorRule, COMMA_WITH_LINE_BREAK, ">>,\n LUB4Seq(<<\n ");
        appendConditionalExpressions(operatorRule, conditionalExpressions, programBlockData, involvedTable);
        replaceEndOfString(operatorRule, COMMA_WITH_LINE_BREAK, ">>),\n <<\n ");
        appendNextRuleLabel(operatorRule, programBlockData, numberOfLineInProgramBlock);
        operatorRule.append("\n >>)\n").append(UNCHANGED_TRACE).append("/\\ Ignore' = 0\n/\\ SLocks' = SLocks\n/\\ StateE' = SLocks'[id]\n/\\ UNCHANGED <<XLocks, VPol>>\n\n");
        return operatorRule.toString();
    }


}
