package util;

import enums.VariableType;
import enums.ProgramBlockVariableType;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;

import static enums.VariableType.CUSTOM_RECORD;
import static enums.ProgramBlockVariableType.*;

// М.б. создать доп. утил класс?
public class ParametersSpecificationUtil {
    private static void appendBasicPolicy(StringBuilder stringBuilder, int offset) {
        stringBuilder.append("[loc|->\"mem\", offs |->").append(offset).append(", policy |-> any_caller(x)]");
    }

    private static void appendMinPolicy(StringBuilder stringBuilder, int offset) {
        stringBuilder.append("[loc|->\"mem\", offs |->").append(offset).append(", policy |-> min]");
    }

    private static String encodePolicyName(String programBlockName, String variableName, ProgramBlockVariableType programBlockVariableType) {
        String underscoreSurroundedVariableName = variableName.equals("") ? variableName : "_" + variableName;
        return programBlockName + "_" + programBlockVariableType.getShortName() + underscoreSurroundedVariableName;
    }

    private static String encodePolicyName(String programBlockName, String variableName, ProgramBlockVariableType programBlockVariableType, VariableType customType, int rowNumber, int columnNumber) {
        String underscoreSurroundedVariableName = variableName.equals("") ? "_" + variableName : "_" + variableName + "_";
        if (rowNumber == -1)
            return programBlockName + "_" + programBlockVariableType.getShortName() + underscoreSurroundedVariableName + customType.getShortName() + "_c" + columnNumber;
        else
            return programBlockName + "_" + programBlockVariableType.getShortName() + underscoreSurroundedVariableName + customType.getShortName() + "_e" + rowNumber + "_c" + columnNumber;
    }

    //Политика для базовых типов
    public static void writeVariablePolicy(File parametersSpecification, String variable, ProgramBlockVariableType programBlockVariableType, String programBlockName, int offset) {
        try (BufferedWriter programBlockParametersPolicyWriter = new BufferedWriter(new FileWriter(parametersSpecification, true))) {
            StringBuilder programBlockParameterPolicy = new StringBuilder(encodePolicyName(programBlockName, variable, programBlockVariableType));
            programBlockParameterPolicy.append("(x) == ");
            if (programBlockVariableType == INPUT_PARAMETER || programBlockVariableType == RETURN_VARIABLE) {
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
    public static int writeVariablePolicy(File parametersSpecification, String variableName, ProgramBlockVariableType programBlockVariableType, VariableType customType, String programBlockName, int offset, int numberOfColumnsInRecord) {
        try (BufferedWriter programBlockParametersPolicyWriter = new BufferedWriter(new FileWriter(parametersSpecification, true))) {
            outerLoop:
            for (int i = 1; i < 3; i++) {
                for (int j = 1; j < numberOfColumnsInRecord + 1; j++) {
                    StringBuilder programBlockParameterPolicy = new StringBuilder(encodePolicyName(programBlockName, variableName, programBlockVariableType, customType, i, j));
                    programBlockParameterPolicy.append("(x) == ");
                    if (programBlockVariableType == RETURN_VARIABLE) {
                        appendBasicPolicy(programBlockParameterPolicy, offset);
                    } else {
                        appendMinPolicy(programBlockParameterPolicy, offset);
                    }
                    programBlockParameterPolicy.append("\n");
                    programBlockParametersPolicyWriter.write(programBlockParameterPolicy.toString());
                    offset++;
                    if (customType == CUSTOM_RECORD)
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
