package plif.generator.generation.operator;

import plif.generator.generation.ProgramBlockData;
import plif.generator.generation.Variable;
import plif.generator.generation.enums.OperatorType;
import plif.generator.generation.enums.VariableType;

import java.util.*;

import static plif.generator.util.CommonUtil.*;
import static plif.generator.util.Constants.COMMA_WITH_LINE_BREAK;
import static plif.generator.util.OperatorUtil.*;

public class SelectIntoOperator extends SqlOperator {
    private final List<String> insertedVariables;
    private final List<String> selectedExpressions;
    private final Set<String> conditionalExpressions;

    {
        insertedVariables = new ArrayList<>();
        selectedExpressions = new ArrayList<>();
        conditionalExpressions = new LinkedHashSet<>();
    }

    public SelectIntoOperator(int numberOfLineInProgramBlock, ProgramBlockData programBlockData, OperatorType operatorType) {
        super(numberOfLineInProgramBlock, programBlockData, operatorType);
    }

    public SelectIntoOperator(int numberOfLineInProgramBlock, String queryCode, ProgramBlockData programBlockData, OperatorType operatorType) {
        super(numberOfLineInProgramBlock, queryCode, programBlockData, operatorType);
    }

    public List<String> getInsertedVariables() {
        return insertedVariables;
    }

    public List<String> getSelectedExpressions() {
        return selectedExpressions;
    }

    public Set<String> getConditionalExpressions() {
        return conditionalExpressions;
    }

    @Override
    public String getOperatorRule() {
        StringBuilder operatorRule = new StringBuilder(getOperatorRuleNameWithId()).append(" ==\n/\\ select(id, <<\n ");
        Map<String, Variable> variables = programBlockData.getVariables();
        List<String> policies = new ArrayList<>();
        insertedVariables.forEach(variableName -> policies.addAll(variables.get(variableName).getVariablePolicies()));
        policies.forEach(policy -> operatorRule.append(policy).append("(id),\n "));
        replaceEndOfString(operatorRule, COMMA_WITH_LINE_BREAK, ">>,\n <<\n ");
        int expressionCounter = 0;
        outerLoop:
        while (expressionCounter != policies.size()) {
            for (String expression : selectedExpressions) {
                if (expression.startsWith("\"col_"))//TODO проверить условие. Похоже, что не используется
                    operatorRule.append("VPol[").append(expression).append("].policy,\n ");
                else {
                    String expColumnPolicy = involvedTable.getColumnPolicy(expression);//TODO очень похоже на утильную функцию appendConditionalExpressions
                    Variable expVariable = variables.get(expression);
                    if (expColumnPolicy != null) {
                        operatorRule.append("VPol[").append(surroundWithQuotes(expColumnPolicy)).append("].policy,\n ");
                    } else if (expVariable != null) {//TODO похоже, что тоже никогда не выполняется
                        loadVariablePolicies(operatorRule, expVariable);
                    }//TODO может здесь будет поддержка литералов
                    else {
                        operatorRule.append("min,\n ");
                    }
                }
                expressionCounter++;
                if (expressionCounter == policies.size()) {
                    break outerLoop;
                }
            }
        }
        replaceEndOfString(operatorRule, COMMA_WITH_LINE_BREAK, ">>,\n LUB4Seq(<<\n ");
        appendConditionalExpressions(operatorRule, conditionalExpressions, programBlockData, involvedTable);
        replaceEndOfString(operatorRule, COMMA_WITH_LINE_BREAK, ">>),\n <<\n ");
        appendNextRuleLabel(operatorRule, programBlockData, numberOfLineInProgramBlock);
        operatorRule.append("\n >>)\n").append(getTrace()).append("/\\ Ignore' = 0\n/\\ SLocks' = SLocks\n/\\ StateE' = SLocks'[id]\n/\\ UNCHANGED <<XLocks, VPol>>\n\n");
        System.out.println(programBlockData.getProgramBlockName() + " " + numberOfLineInProgramBlock + " " + queryCode);
        return operatorRule.toString();
    }

    @Override
    protected String getTrace() {
        StringBuilder trace = new StringBuilder("/\\ Trace' = Append(Trace,<<id,\n ");
        Map<String, Variable> programBlockVariables = programBlockData.getVariables();
        trace.append(surroundWithQuotes(getOperatorRuleName())).append(COMMA_WITH_LINE_BREAK)
                .append(surroundWithQuotes(queryCode)).append(COMMA_WITH_LINE_BREAK).append("[from |-> <<\n ");
        String conditionalExpressionsTrace = getConditionalExpressionsTrace(conditionalExpressions, programBlockData, involvedTable);//TODO как будет работать без условий?
        insertedVariables.forEach(variableName -> {//TODO для каждой вставляемой переменной стоит писать блок из выбираемых выражений? (select a, a1, a2 into b, c). Мб придется переделать
            int timesToRepeat = programBlockData.getVariables().get(variableName).getVariableType() == VariableType.CUSTOM_VARRAY ? 2 : 1;
            for (int i = 0; i < timesToRepeat; i++) {
                selectedExpressions.forEach(expression -> {
                    String columnPolicy = involvedTable.getColumnPolicy(expression);
                    String appendedPolicy = columnPolicy == null ? "[policy |-> min, name |-> "+ programBlockData.getNextLiteralLabel()+ "]" : "VPol." + columnPolicy;
                    trace.append("<<\n ").append(appendedPolicy).append(",\n ").append(conditionalExpressionsTrace).append("\n >>,\n ");
                });
            }
        });
        replaceEndOfString(trace, ">>,\n ", ">>\n >>,\n to |-> <<\n ");
        insertedVariables.forEach(variableName -> programBlockVariables.get(variableName).getVariablePolicies().
                forEach(policy -> trace.append("policy |-> load(id, ").append(policy).append("(id)),\n name |-> ").append(policy).append("(id).name],\n ")));
        return replaceEndOfString(trace, ",\n ", ">>\n ]>>)\n").toString();
    }
}
