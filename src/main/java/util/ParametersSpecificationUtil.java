package util;

import enums.DeclaredTypes;
import enums.VariableType;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;

import static enums.DeclaredTypes.RECORD;
import static enums.VariableType.*;

// М.б. создать доп. утил класс?
public class ParametersSpecificationUtil {
    private static void appendBasicPolicy(StringBuilder stringBuilder, int offset) {
        stringBuilder.append("[loc|->\"mem\", offs |->").append(offset).append(", policy |-> any_caller(x)]");
    }

    private static void appendMinPolicy(StringBuilder stringBuilder, int offset) {
        stringBuilder.append("[loc|->\"mem\", offs |->").append(offset).append(", policy |-> min]");
    }

    private static String encodePolicyName(String programBlockName, String variableName, VariableType variableType) {
        String underscoreSurroundedVariableName = variableName.equals("") ? variableName : "_" + variableName;
        return programBlockName + "_" + variableType.getShortName() + underscoreSurroundedVariableName;
    }

    private static String encodePolicyName(String programBlockName, String variableName, VariableType variableType, DeclaredTypes customType, int rowNumber, int columnNumber) {
        String underscoreSurroundedVariableName = variableName.equals("") ? "_" + variableName : "_" + variableName + "_";
        if (rowNumber == -1)
            return programBlockName + "_" + variableType.getShortName() + underscoreSurroundedVariableName + customType.getShortName() + "_c" + columnNumber;
        else
            return programBlockName + "_" + variableType.getShortName() + underscoreSurroundedVariableName + customType.getShortName() + "_e" + rowNumber + "_c" + columnNumber;
    }

    //Политика для базовых типов
    public static void writeVariablePolicy(File parametersSpecification, String variable, VariableType variableType, String programBlockName, int offset) {
        try (BufferedWriter programBlockParametersPolicyWriter = new BufferedWriter(new FileWriter(parametersSpecification, true))) {
            StringBuilder programBlockParameterPolicy = new StringBuilder(encodePolicyName(programBlockName, variable, variableType));
            programBlockParameterPolicy.append("(x) == ");
            if (variableType == INPUT_PARAMETER || variableType == RETURN_VARIABLE) {
                appendBasicPolicy(programBlockParameterPolicy, offset);
            } else {
                appendMinPolicy(programBlockParameterPolicy, offset);
            }
            programBlockParameterPolicy.append("\n");
            programBlockParametersPolicyWriter.write(programBlockParameterPolicy.toString());
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    //Политика для кастомных типов
    //Входной параметр не может быть кастомного типа
    public static int writeVariablePolicy(File parametersSpecification, String variableName, VariableType variableType, DeclaredTypes customType, String programBlockName, int offset, int numberOfColumnsInRecord) {
        try (BufferedWriter programBlockParametersPolicyWriter = new BufferedWriter(new FileWriter(parametersSpecification, true))) {
            outerLoop:
            for (int i = 1; i < 3; i++) {
                for (int j = 1; j < numberOfColumnsInRecord + 1; j++) {
                    StringBuilder programBlockParameterPolicy = new StringBuilder(encodePolicyName(programBlockName, variableName, variableType, customType, i, j));
                    programBlockParameterPolicy.append("(x) == ");
                    if (variableType == RETURN_VARIABLE) {
                        appendBasicPolicy(programBlockParameterPolicy, offset);
                    } else {
                        appendMinPolicy(programBlockParameterPolicy, offset);
                    }
                    programBlockParameterPolicy.append("\n");
                    programBlockParametersPolicyWriter.write(programBlockParameterPolicy.toString());
                    offset++;
                    if (customType == RECORD)
                        break outerLoop;
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return offset;
    }

    public static void writeLineBreak(File file) {
        try (BufferedWriter bufferedWriter = new BufferedWriter(new FileWriter(file, true))) {
            bufferedWriter.write('\n');
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
