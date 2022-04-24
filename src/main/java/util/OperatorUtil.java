package util;

import generation.ProgramBlockData;
import generation.Table;
import generation.Variable;
import generation.enums.OperatorType;
import generation.operator.SqlOperator;

import java.util.*;
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
        Set<String> variableNames = programBlockVariables.keySet().stream().filter(involvedExpressions::contains).collect(Collectors.toCollection(LinkedHashSet::new));
        if (variableNames.size() != 0) {
            variableNames.forEach(key -> loadVariablePolicies(operatorRule, programBlockVariables.get(key), null));
        } else {
            operatorRule.append("min,\n ".repeat(involvedColumnPolicies.size()));
        }
        replaceEndOfString(operatorRule, COMMA_WITH_LINE_BREAK, ending);
    }

    public static void appendNextRuleLabel(StringBuilder operatorRule, ProgramBlockData programBlockData, int numberOfLineInProgramBlock) {
        TreeMap<Integer, SqlOperator> pbdOperators = programBlockData.getOperators();
        SqlOperator nextSqlOperator = pbdOperators.higherEntry(numberOfLineInProgramBlock).getValue();
        operatorRule.append(surroundWithQuotes(programBlockData.getProgramBlockName())).append(", ");
        int numberOfLineOfExceptionKeyWord = programBlockData.getNumberOfLineOfExceptionKeyWord();
        int nextOperatorLine = nextSqlOperator.getNumberOfLineInProgramBlock();
        if (numberOfLineOfExceptionKeyWord < nextOperatorLine && numberOfLineOfExceptionKeyWord > numberOfLineInProgramBlock) {//последний оператор перед exception
            operatorRule.append(pbdOperators.lastEntry().getValue().getLabel());//метка exit
        } else {
            if (nextSqlOperator.hasElseKeyWordInThisLine()) {//если следующий оператор находится в строке с else, то переходим к ближайшему end if
                pbdOperators.keySet().stream().filter(key -> {
                    SqlOperator operator = pbdOperators.get(key);
                    return operator.getOperatorType() == OperatorType.END_IF && operator.getNumberOfLineInProgramBlock() > nextOperatorLine;
                }).findFirst().ifPresent(value -> operatorRule.append(pbdOperators.get(value).getLabel()));
            } else {
                operatorRule.append(nextSqlOperator.getLabel());
            }
        }
    }

    public static void appendConditionalExpressions(StringBuilder operatorRule, Set<String> conditionalExpressions, ProgramBlockData programBlockData, Table involvedTable) {
        Map<String, Variable> variables = programBlockData.getVariables();
        conditionalExpressions.forEach(conditionalExpression ->
        {
            if (conditionalExpression.startsWith("\"col_"))
                operatorRule.append("VPol[").append(conditionalExpression).append("].policy,\n ");
            else {
                String expColumnPolicy = involvedTable != null ? involvedTable.getColumnPolicy(conditionalExpression) : null;
                Variable expVariable = variables.get(conditionalExpression);
                if (expColumnPolicy != null) {
                    operatorRule.append("VPol[").append(surroundWithQuotes(expColumnPolicy)).append("].policy,\n ");
                } else if (expVariable != null) {
                    loadVariablePolicies(operatorRule, expVariable);
                }//TODO может здесь будет поддержка литералов
            }
        });
    }

    public static String getConditionalExpressionsTrace(Set<String> conditionalExpressions, ProgramBlockData programBlockData, Table involvedTable) {
        StringBuilder stringBuilder = new StringBuilder();
        Map<String, Variable> variables = programBlockData.getVariables();
        conditionalExpressions.forEach(conditionalExpression ->
        {
            String expColumnPolicy = involvedTable != null ? involvedTable.getColumnPolicy(conditionalExpression) : null;
            Variable expVariable = variables.get(conditionalExpression);
            if (conditionalExpression.startsWith("\"col_")) {
                stringBuilder.append("VPol.").append(conditionalExpression, 1, conditionalExpression.length() - 1).append(COMMA_WITH_LINE_BREAK);
            } else {
                if (expColumnPolicy != null) {
                    stringBuilder.append("VPol.").append(expColumnPolicy).append(COMMA_WITH_LINE_BREAK);
                } else if (expVariable != null) {
                    //TODO как для каждой политики следует дописывать load в условии?
                    expVariable.getVariablePolicies().forEach(variablePolicy ->
                            stringBuilder.append("[policy |-> load(id, ").append(variablePolicy).append("(id)),\n name |-> ")
                                    .append(variablePolicy).append("(id).name]").append(COMMA_WITH_LINE_BREAK));
                }
            }
        });
        return replaceEndOfString(stringBuilder, COMMA_WITH_LINE_BREAK, "").toString();
    }
}