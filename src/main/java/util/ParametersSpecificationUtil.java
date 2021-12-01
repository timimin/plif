package util;

import refactoring.enums.VariableType;
import refactoring.enums.ProgramBlockVariableType;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;

import static refactoring.enums.VariableType.CUSTOM_RECORD;
import static refactoring.enums.ProgramBlockVariableType.*;

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

    public static void writeParametersHeader(BufferedWriter bufferedWriter) throws IOException {
        bufferedWriter.write(
                "EXTENDS Naturals, Sequences\n" +
                        "CONSTANT U, UU, NONE, ALL, E0, E1, Undef, GPol, Session_number\n" +
                        "VARIABLES StateE, Sessions, New2Old, XLocks, XLocks, Trace, SLocks, Ignore\n" +
                        "vars == <<Sessions, SLocks, StateE, New2Old, XLocks, VPol, Trace, Ignore>>\n" +
                        "min == {<<CHOOSE x \\in UU: TRUE,<<[e1 \\in E0 |-> {NONE}],  [e2 \\in E1 |-> {NONE}]>> >>}\n" +
                        "any_caller(x) == {<<x, <<[e1 \\in E0 |-> {NONE}], [e2 \\in E1 |-> {NONE}]>> >>}\n" +
                        "max == {}\n" +
                        "u1 == CHOOSE i \\in UU: TRUE\n" +
                        "u2 == CHOOSE j \\in UU: j#u1\n" +
                        "S ==  CHOOSE s \\in SUBSET(U) : Cardinality(s) = Session_number\n");
    }
}
