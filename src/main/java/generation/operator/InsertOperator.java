package generation.operator;

import generation.ProgramBlockData;
import generation.Variable;
import generation.enums.OperatorType;

import java.util.*;
import java.util.stream.Collectors;

import static util.CommonUtil.*;
import static util.Constants.COMMA_WITH_LINE_BREAK;
import static util.OperatorUtil.appendColumnAndExpressionPolicies;
import static util.OperatorUtil.appendNextRuleLabel;

/**
 * Инсерт в одну таблицу(insert values), без селекта(insert into a select b from c)
 */
public class InsertOperator extends SqlOperator {
    private final List<String> insertedExpressions;
    private final List<String> involvedColumnsPolicies;

    {
        involvedColumnsPolicies = new ArrayList<>();
        insertedExpressions = new ArrayList<>();
    }

    public InsertOperator(int numberOfLineInProgramBlock, ProgramBlockData programBlockData, OperatorType operatorType) {
        super(numberOfLineInProgramBlock, programBlockData, operatorType);
    }

    public InsertOperator(int numberOfLineInProgramBlock, String queryCode, ProgramBlockData programBlockData, OperatorType operatorType) {
        super(numberOfLineInProgramBlock, queryCode, programBlockData, operatorType);
    }

    public List<String> getInsertedExpressions() {
        return insertedExpressions;
    }

    public List<String> getInvolvedColumnsPolicies() {
        return involvedColumnsPolicies;
    }

    public void addInvolvedColumnPolicy(String columnName) {
        involvedColumnsPolicies.add(involvedTable.getColumnPolicy(columnName));
    }

    @Override
    public String getOperatorRule() {
        StringBuilder operatorRule = new StringBuilder(getOperatorRuleNameWithId()).append(" ==\n/\\ insert(id, <<\n ");
        appendColumnAndExpressionPolicies(operatorRule, involvedColumnsPolicies, programBlockData.getVariables(), insertedExpressions, ">>,\n <<\n ");
        appendNextRuleLabel(operatorRule, programBlockData, numberOfLineInProgramBlock);
        operatorRule.append("\n >>)\n").append(getTrace()).append("/\\ Ignore' = 0\n/\\ SLocks' = SLocks\n/\\ StateE' = SLocks'[id]\n/\\ XLocks' = XLocks\n\n");
        System.out.println(programBlockData.getProgramBlockName() + " " + numberOfLineInProgramBlock + " " + queryCode);
        return operatorRule.toString();
    }

    @Override
    protected String getTrace() {
        StringBuilder trace = new StringBuilder("/\\ Trace' = Append(Trace,<<id,\n ");
        Map<String, Variable> programBlockVariables = programBlockData.getVariables();
        Set<String> variableNames = programBlockVariables.keySet().stream().filter(insertedExpressions::contains).collect(Collectors.toCollection(LinkedHashSet::new));
        trace.append(surroundWithQuotes(getOperatorRuleName())).append(COMMA_WITH_LINE_BREAK)
                .append(surroundWithQuotes(queryCode)).append(COMMA_WITH_LINE_BREAK).append("[from |-> <<\n ");
        if (variableNames.size() != 0) {
            variableNames.forEach(key ->
                    programBlockVariables.get(key).getVariablePolicies().forEach(policy ->
                            trace.append("<<[policy |-> load(id, ").append(policy).append("(id)),\n ")
                                    .append("name |-> ").append(policy).append("(id).name]>>,\n ")));
        } else {
            for (int i = 0; i < involvedColumnsPolicies.size(); i++) {
                trace.append("<<[policy |-> min, name |-> ").append(programBlockData.getNextLiteralLabel()).append(">>,\n ");
            }
        }
        replaceEndOfString(trace, ">>,\n ", ">>\n >>,\n to |-> <<\n ");
        involvedColumnsPolicies.forEach(columnPolicy -> trace.append("VPol.").append(columnPolicy).append(COMMA_WITH_LINE_BREAK));
        return replaceEndOfString(trace, ",", ">>\n ]>>)\n").toString();
    }
}