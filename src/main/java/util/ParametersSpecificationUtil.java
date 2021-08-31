package util;

import myImplementation.VariableType;

import java.io.BufferedWriter;
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
            if (variableType == LOCAL_VARIABLE || variableType == EXCEPTION) {
                appendMinPolicy(procedureParameterPolicy, i + offset);
            } else {
                appendBasicPolicy(procedureParameterPolicy, i + offset);
            }
            procedureParameterPolicy.append("\n");
            bufferedWriter.write(procedureParameterPolicy.toString());
        }
    }
}
