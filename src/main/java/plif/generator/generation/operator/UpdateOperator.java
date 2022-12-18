package plif.generator.generation.operator;

import plif.generator.generation.ProgramBlockData;
import plif.generator.generation.Variable;
import plif.generator.generation.enums.OperatorType;

import java.util.*;
import java.util.stream.Collectors;

import static plif.generator.util.CommonUtil.replaceEndOfString;
import static plif.generator.util.CommonUtil.surroundWithQuotes;
import static plif.generator.util.Constants.COMMA_WITH_LINE_BREAK;
import static plif.generator.util.OperatorUtil.*;

public class UpdateOperator extends SqlOperator {
    private final List<String> updatableColumnPolicies;
    private final List<String> updatingExpressions;
    private final Set<String> conditionalExpressions;

    {
        updatableColumnPolicies = new ArrayList<>();
        updatingExpressions = new ArrayList<>();
        conditionalExpressions = new LinkedHashSet<>();
    }

    public UpdateOperator(int numberOfLineInProgramBlock, ProgramBlockData programBlockData, OperatorType operatorType) {
        super(numberOfLineInProgramBlock, programBlockData, operatorType);
    }

    public UpdateOperator(int numberOfLineInProgramBlock, String queryCode, ProgramBlockData programBlockData, OperatorType operatorType) {
        super(numberOfLineInProgramBlock, queryCode, programBlockData, operatorType);
    }

    @Override
    public String getOperatorRule() {
        StringBuilder operatorRule = new StringBuilder(getOperatorRuleNameWithId()).append(" ==\n/\\ update(id, <<\n ");
        Map<String, Variable> variables = programBlockData.getVariables();
        appendColumnAndExpressionPolicies(operatorRule, updatableColumnPolicies, variables, updatingExpressions, ">>,\n LUB4Seq(<<\n ");
        appendConditionalExpressions(operatorRule, conditionalExpressions, programBlockData, involvedTable);
        replaceEndOfString(operatorRule, COMMA_WITH_LINE_BREAK, ">>),\n <<\n ");
        appendNextRuleLabel(operatorRule, programBlockData, numberOfLineInProgramBlock);
        operatorRule.append("\n >>)\n").append(getTrace()).append("/\\ Ignore' = 0\n/\\ SLocks' = SLocks\n/\\ StateE' = SLocks'[id]\n/\\ XLocks' = XLocks\n\n");
        System.out.println(programBlockData.getProgramBlockName() + " " + numberOfLineInProgramBlock + " " + queryCode);
        return operatorRule.toString();
    }

    @Override
    protected String getTrace() {
        StringBuilder trace = new StringBuilder("/\\ Trace' = Append(Trace,<<id,\n ");
        Map<String, Variable> programBlockVariables = programBlockData.getVariables();
        Set<String> variableNames = programBlockVariables.keySet().stream().filter(updatingExpressions::contains).collect(Collectors.toCollection(LinkedHashSet::new));
        String conditionalExpressionsTrace = getConditionalExpressionsTrace(conditionalExpressions, programBlockData, involvedTable);
        trace.append(surroundWithQuotes(getOperatorRuleName())).append(COMMA_WITH_LINE_BREAK)
                .append(surroundWithQuotes(queryCode)).append(COMMA_WITH_LINE_BREAK).append("[from |-> <<\n ");
        variableNames.forEach(key ->//TODO если обновляется не переменными, а выражаниями?
                programBlockVariables.get(key).getVariablePolicies().forEach(policy ->
                        trace.append("<<[policy |-> load(id, ").append(policy).append("(id)),\n ")
                                .append("name |-> ").append(policy).append("(id).name],\n ").append(conditionalExpressionsTrace).append(">>,\n ")));
        replaceEndOfString(trace, ">>,\n ", ">>\n >>,\n to |-> <<\n ");
        updatableColumnPolicies.forEach(columnPolicy -> trace.append("VPol.").append(columnPolicy).append(COMMA_WITH_LINE_BREAK));
        return replaceEndOfString(trace, ",", ">>\n ]>>)\n").toString();
    }

    public List<String> getUpdatableColumnPolicies() {
        return updatableColumnPolicies;
    }

    public List<String> getUpdatingExpressions() {
        return updatingExpressions;
    }

    public Set<String> getConditionalExpressions() {
        return conditionalExpressions;
    }
}