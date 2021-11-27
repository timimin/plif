package refactoring.operator;

import refactoring.ProgramBlockData;
import refactoring.Variable;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import static util.CommonUtil.*;
import static util.OperatorUtil.appendColumnAndExpressionPolicies;
import static util.OperatorUtil.appendNextRuleLabel;

public class UpdateOperator extends AbstractSqlOperator {
    private final List<String> updatableColumnPolicies;
    private final List<String> updatingExpressions;
    private final List<String> conditionalExpressions;

    {
        updatableColumnPolicies = new ArrayList<>();
        updatingExpressions = new ArrayList<>();
        conditionalExpressions = new ArrayList<>();
    }

    public UpdateOperator(int numberOfLineInProgramBlock, ProgramBlockData programBlockData) {
        super(numberOfLineInProgramBlock, programBlockData);
    }

    @Override
    public String getOperatorRule() {
        StringBuilder operatorRule = new StringBuilder(getOperatorRuleName()).append(" ==\n /\\ update (id, <<\n ");
        Map<String, Variable> variables = programBlockData.getVariables();
        appendColumnAndExpressionPolicies(operatorRule, updatableColumnPolicies, variables, updatingExpressions, ">>,\n LUB4Seq(");
        conditionalExpressions.forEach(conditionalExpression ->
        {
            String expColumnPolicy = involvedTable.getColumnPolicy(conditionalExpression);
            Variable expVariable = variables.get(conditionalExpression);
            if (expColumnPolicy != null) {
                operatorRule.append("VPol[").append(surroundWithQuotes(expColumnPolicy)).append("].policy,");
            } else if (expVariable != null) {
                loadVariablePolicies(operatorRule, expVariable, ")),\n <<\n ");
            }
        });
        appendNextRuleLabel(operatorRule, programBlockData, numberOfLineInProgramBlock);
        operatorRule.append("\n >>)\n /\\ Trace' = Append(Trace,<<>>)\n /\\ Ignore' = 0\n /\\ SLocks' = SLocks\n /\\ StateE' = SLocks'[id]\n /\\ XLocks' = XLocks\n\n");
        return operatorRule.toString();
    }

    public List<String> getUpdatableColumnPolicies() {
        return updatableColumnPolicies;
    }

    public List<String> getUpdatingExpressions() {
        return updatingExpressions;
    }

    public List<String> getConditionalExpressions() {
        return conditionalExpressions;
    }
}