package util;

import refactoring.ProgramBlockData;
import refactoring.Variable;

import java.io.File;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import static enums.ProgramBlockVariableType.RETURN_VARIABLE;
import static util.Constants.END_OF_MODULE_DECLARATION;
import static util.Constants.START_OF_MODULE_DECLARATION;

public class CommonUtil {
    public static String getColumnPolicyName(String tableProperty, String columnName) {
        String tableName = tableProperty.substring(0, tableProperty.lastIndexOf("_"));
        return "col_" + tableName + "_" + columnName;
    }

    public static String getFileNameWithoutExtension(File file) {
        String fileName = file.getName();
        return fileName.substring(0, fileName.indexOf('.'));
    }

    public static String getModuleDeclarationLine(File file) {
        return START_OF_MODULE_DECLARATION + getFileNameWithoutExtension(file) + END_OF_MODULE_DECLARATION + "\n";
    }

    public static String surroundWithAngleBrackets(String stringToSurround) {
        return "<<" + stringToSurround + ">>";
    }

    public static String surroundWithQuotes(String stringToSurround) {
        return "\"" + stringToSurround + "\"";
    }

    public static List<String> appendSuffixToVariablePolicies(Variable variable, String suffix) {
        return variable.getVariablePolicies().stream().map(policy -> policy + suffix).collect(Collectors.toList());
    }

    public static List<List<String>> appendSuffixToAllVariablePolicies(ProgramBlockData programBlockData, String suffix) {
        return programBlockData.getVariables().values().stream().map(variable -> appendSuffixToVariablePolicies(variable, suffix)).collect(Collectors.toList());
    }

    public static Optional<Variable> getReturnVariable(ProgramBlockData programBlockData) {
        return programBlockData.getVariables().values().stream().filter(variable -> variable.getProgramBlockVariableType() == RETURN_VARIABLE).findFirst();
    }

    public static StringBuilder replaceEndOfString(StringBuilder alterableStringBuilder, String replacedString, String newString) {
        return alterableStringBuilder.replace(alterableStringBuilder.lastIndexOf(replacedString), alterableStringBuilder.length(), newString);
    }

    public static void loadVariablePolicies(StringBuilder stringBuilder, Variable variable, String ending) {
        variable.getVariablePolicies().forEach(policy -> stringBuilder.append("load(id, ").append(policy).append("(id)),\n "));
        if (ending != null) {
            replaceEndOfString(stringBuilder, ",\n ", ending);
        }
    }
}