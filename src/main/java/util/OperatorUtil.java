package util;

import refactoring.ProgramBlockData;
import refactoring.Variable;

import java.util.List;
import java.util.Map;

import static util.CommonUtil.*;

public class OperatorUtil {
    //Добавляет политики столбцов и выражений для операторов insert и update
    public static void appendColumnAndExpressionPolicies(
            StringBuilder operatorRule, List<String> involvedColumnPolicies,
            Map<String, Variable> programBlockVariables, List<String> involvedExpressions, String ending) {
        involvedColumnPolicies.forEach(policy -> operatorRule.append(surroundWithQuotes(policy)).append(",\n "));
        replaceEndOfString(operatorRule, ",\n ", ">>,\n <<\n ");
        programBlockVariables.keySet().stream()
                .filter(involvedExpressions::contains)
                .forEach(key -> loadVariablePolicies(operatorRule, programBlockVariables.get(key), null));
        replaceEndOfString(operatorRule, ",\n ", ending);
    }

    public static void appendNextRuleLabel(StringBuilder operatorRule, ProgramBlockData programBlockData, int numberOfLineInProgramBlock) {
        operatorRule.append(surroundWithQuotes(programBlockData.getProgramBlockName())).append(", ")
                .append(surroundWithQuotes(programBlockData.getOperators().higherEntry(numberOfLineInProgramBlock).getValue().getLabel()));
    }
}