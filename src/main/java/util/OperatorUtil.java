package util;

import refactoring.ProgramBlockData;
import refactoring.Table;
import refactoring.Variable;

import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

import static util.CommonUtil.*;
import static util.Constants.COMMA_WITH_LINE_BREAK;

public class OperatorUtil {
    //Добавляет политики столбцов и выражений для операторов insert и update
    public static void appendColumnAndExpressionPolicies(
            StringBuilder operatorRule, List<String> involvedColumnPolicies,
            Map<String, Variable> programBlockVariables, List<String> involvedExpressions, String ending) {
        involvedColumnPolicies.forEach(policy -> operatorRule.append(surroundWithQuotes(policy)).append(COMMA_WITH_LINE_BREAK));
        replaceEndOfString(operatorRule, COMMA_WITH_LINE_BREAK, ">>,\n <<\n ");
        Set<String> variableNames = programBlockVariables.keySet().stream().filter(involvedExpressions::contains).collect(Collectors.toSet());
        if (variableNames.size() != 0) {
            variableNames.forEach(key -> loadVariablePolicies(operatorRule, programBlockVariables.get(key), null));
        } else {
            operatorRule.append("min,\n ".repeat(involvedColumnPolicies.size()));
        }
        replaceEndOfString(operatorRule, COMMA_WITH_LINE_BREAK, ending);
    }

    public static void appendNextRuleLabel(StringBuilder operatorRule, ProgramBlockData programBlockData, int numberOfLineInProgramBlock) {
        operatorRule.append(surroundWithQuotes(programBlockData.getProgramBlockName())).append(", ")
                .append(programBlockData.getOperators().higherEntry(numberOfLineInProgramBlock).getValue().getLabel());
    }

    public static void appendConditionalExpressions(StringBuilder operatorRule, Set<String> conditionalExpressions, ProgramBlockData programBlockData, Table involvedTable) {
        Map<String, Variable> variables = programBlockData.getVariables();
        conditionalExpressions.forEach(conditionalExpression ->
        {
            if (conditionalExpression.startsWith("\"col_"))
                operatorRule.append("VPol[").append(conditionalExpression).append("].policy,\n ");
            else {
                String expColumnPolicy = involvedTable.getColumnPolicy(conditionalExpression);
                Variable expVariable = variables.get(conditionalExpression);
                if (expColumnPolicy != null) {
                    operatorRule.append("VPol[").append(surroundWithQuotes(expColumnPolicy)).append("].policy,\n ");
                } else if (expVariable != null) {
                    loadVariablePolicies(operatorRule, expVariable);
                }//TODO может здесь будет поддержка литералов
            }
        });
    }
}