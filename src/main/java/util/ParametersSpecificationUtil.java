package util;

import myImplementation.VariableType;

import java.io.BufferedWriter;
import java.io.IOException;
import java.util.List;

public class ParametersSpecificationUtil {
    public static void appendBasicPolicy(StringBuilder stringBuilder, int offset) {
        stringBuilder.append("[loc|->\"mem\", offs |->").append(offset).append(", policy |-> any_caller(x)]");
    }

    public static String encodePolicyName(String procedureName, String variableName, VariableType variableType) {
        return procedureName + "_" + variableType.getShortName() + "_" +
                variableName;
    }

    public static void writeVariablePolicy(BufferedWriter bufferedWriter, List<String> variables, VariableType variableType, String procedureName, int offset) throws IOException {
        for (int i = 0; i < variables.size(); i++) {
            StringBuilder procedureParameterPolicy = new StringBuilder(encodePolicyName(procedureName, variables.get(i), variableType));
            procedureParameterPolicy.append("(x) == ");
            appendBasicPolicy(procedureParameterPolicy, i+offset);
            procedureParameterPolicy.append("\n");
            bufferedWriter.write(procedureParameterPolicy.toString());
        }
    }
}
