package util;

import myImplementation.VariableType;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.List;

import static myImplementation.VariableType.*;

public class ParametersSpecificationUtil {
    private static void appendBasicPolicy(StringBuilder stringBuilder, int offset) {
        stringBuilder.append("[loc|->\"mem\", offs |->").append(offset).append(", policy |-> any_caller(x)]");
    }

    private static void appendMinPolicy(StringBuilder stringBuilder, int offset) {
        stringBuilder.append("[loc|->\"mem\", offs |->").append(offset).append(", policy |-> min]");
    }

    private static String encodePolicyName(String procedureName, String variableName, VariableType variableType) {
        return procedureName + "_" + variableType.getShortName() + "_" +
                variableName;
    }

    public static void writeVariablePolicy(BufferedWriter bufferedWriter, List<String> variables, VariableType variableType, String procedureName, int offset) throws IOException {
        for (int i = 0; i < variables.size(); i++) {
            StringBuilder procedureParameterPolicy = new StringBuilder(encodePolicyName(procedureName, variables.get(i), variableType));
            procedureParameterPolicy.append("(x) == ");
            if (variableType == PROCEDURE_PARAMETER || variableType == RETURN_VARIABLE) {
                appendBasicPolicy(procedureParameterPolicy, i + offset);
            } else {
                appendMinPolicy(procedureParameterPolicy, i + offset);
            }
            procedureParameterPolicy.append("\n");
            bufferedWriter.write(procedureParameterPolicy.toString());
        }
    }

    // Возвращает смещение в файле
    public static int writePolicies(File parametersSpecification, String programBlockName, List<String> parameters, List<String> localVariables, List<String> exceptions, boolean emptyLineFlag) {
        int offset = 0;
        try (BufferedWriter functionParametersPolicyWriter = new BufferedWriter(new FileWriter(parametersSpecification, true))) {
            writeVariablePolicy(functionParametersPolicyWriter, parameters, PROCEDURE_PARAMETER, programBlockName, offset);
            writeVariablePolicy(functionParametersPolicyWriter, localVariables, LOCAL_VARIABLE, programBlockName, offset += parameters.size());
            writeVariablePolicy(functionParametersPolicyWriter, exceptions, EXCEPTION, programBlockName, offset += localVariables.size());
            if (emptyLineFlag)
                functionParametersPolicyWriter.write('\n');
        } catch (IOException e) {
            e.printStackTrace();
        }
        return offset;
    }
}
