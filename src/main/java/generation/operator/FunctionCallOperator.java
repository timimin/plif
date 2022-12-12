package generation.operator;

import generation.ProgramBlockData;
import generation.Variable;
import generation.enums.OperatorType;
import generation.enums.ProgramBlockVariableType;
import util.CommonUtil;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import static util.CommonUtil.*;
import static util.Constants.COMMA_WITH_LINE_BREAK;
import static util.Constants.UNCHANGED_TRACE;
import static util.OperatorUtil.appendNextRuleLabel;

public class FunctionCallOperator extends SqlOperator {
    private String functionName;
    private final List<String> functionArguments;
    private String assignableVariable;
    private ProgramBlockData calledFunction;

    {
        functionArguments = new ArrayList<>();
    }

    public FunctionCallOperator(int numberOfLineInProgramBlock, ProgramBlockData programBlockData, OperatorType operatorType) {
        super(numberOfLineInProgramBlock, programBlockData, operatorType);
    }

    @Override
    public String getOperatorRule() {
        StringBuilder operatorRule = new StringBuilder(getOperatorRuleNameWithId()).append(" ==\n/\\ call(id, <<\n ");
        appendNextRuleLabel(operatorRule, calledFunction, 0);
        String lubForSeq = "\n LUB4Seq(Sessions[id][\"PCLabel\"] \\o <<";
        String endOfRule = UNCHANGED_TRACE + "/\\ Ignore' = 0\n/\\ SLocks' = SLocks\n/\\ StateE' = SLocks'[id]\n/\\ UNCHANGED <<XLocks, VPol";
        operatorRule.append(">>,\n ")
                .append(CommonUtil.surroundWithQuotes("lbl_" + numberOfLineInProgramBlock + "r"))
                .append(",\n <<");
        if (functionArguments.size() != 0) {
            operatorRule.append(lubForSeq);
            functionArguments.forEach(argument -> loadVariablePolicies(operatorRule, programBlockData.getVariables().get(argument)));
            Map<String, Variable> calledFunctionVariables = calledFunction.getVariables();
            List<Variable> localVariables = new ArrayList<>();
            List<Variable> exceptionVariables = new ArrayList<>();
            List<Variable> returnVariables = new ArrayList<>();
            calledFunctionVariables.forEach((variableName, variable) -> {
                        ProgramBlockVariableType programBlockVariableType = variable.getProgramBlockVariableType();
                        switch (programBlockVariableType) {
                            case LOCAL_VARIABLE:
                                localVariables.add(variable);
                                break;
                            case EXCEPTION:
                                exceptionVariables.add(variable);
                                break;
                            case RETURN_VARIABLE:
                                returnVariables.add(variable);
                                break;
                            default:
                                break;
                        }
                    }
            );
            replaceEndOfString(operatorRule, COMMA_WITH_LINE_BREAK, ">>),");
            List.of(localVariables, exceptionVariables, returnVariables).forEach(variables -> lubVariables(variables, operatorRule));
            replaceEndOfString(operatorRule, ",", ">>)\n").append(endOfRule).append(", New2Old>>\n\n");
            operatorRule.append(programBlockData.getProgramBlockName()).append(numberOfLineInProgramBlock).append("r(id) ==\n/\\ exit_call(id, <<\n ");
            appendSuffixToVariablePolicies(programBlockData.getVariables().get(assignableVariable), "(id)" + COMMA_WITH_LINE_BREAK).forEach(operatorRule::append);
            replaceEndOfString(operatorRule, COMMA_WITH_LINE_BREAK, ">>,\n <<\n ");
            appendNextRuleLabel(operatorRule, programBlockData, numberOfLineInProgramBlock);
            operatorRule.append(">>)\n").append(endOfRule).append(">>\n\n");
        }
        return operatorRule.toString();
    }

    private void lubVariables(List<Variable> variables, StringBuilder stringBuilder) {
        if (variables.size() != 0) {
            String lubForSeq = "\n LUB4Seq(Sessions[id][\"PCLabel\"] \\o <<";
            stringBuilder.append(lubForSeq);
            variables.forEach(variable -> appendSuffixToVariablePolicies(variable, "(id).policy" + COMMA_WITH_LINE_BREAK).forEach(stringBuilder::append));
            replaceEndOfString(stringBuilder, COMMA_WITH_LINE_BREAK, ">>),");
        }
    }

    @Override
    protected String getTrace() {
        return null;
    }

    @Override
    public String getOperatorDispatcherRule() {
        return "Head(st).pc[2] = " + getLabel() + " -> " + getOperatorRuleNameWithId() + "\n" +
                "[] Head(st).pc[2] = " + surroundWithQuotes("lbl_" + numberOfLineInProgramBlock + "r") + " -> "
                + programBlockData.getProgramBlockName() + numberOfLineInProgramBlock + "r(id)";
    }

    public String getFunctionName() {
        return functionName;
    }

    public void setFunctionName(String functionName) {
        this.functionName = functionName;
    }

    public List<String> getFunctionArguments() {
        return functionArguments;
    }

    public String getAssignableVariable() {
        return assignableVariable;
    }

    public void setAssignableVariable(String assignableVariable) {
        this.assignableVariable = assignableVariable;
    }

    public void setCalledFunction(ProgramBlockData calledFunction) {
        this.calledFunction = calledFunction;
    }
}
