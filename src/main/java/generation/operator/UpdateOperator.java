package generation.operator;

import generation.ProgramBlockData;
import generation.Variable;
import generation.enums.OperatorType;

import java.util.*;

import static util.CommonUtil.*;
import static util.Constants.COMMA_WITH_LINE_BREAK;
import static util.Constants.UNCHANGED_TRACE;
import static util.OperatorUtil.*;

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
        operatorRule.append("\n >>)\n").append(UNCHANGED_TRACE).append("/\\ Ignore' = 0\n/\\ SLocks' = SLocks\n/\\ StateE' = SLocks'[id]\n/\\ XLocks' = XLocks\n\n");
        System.out.println(programBlockData.getProgramBlockName() + " " + numberOfLineInProgramBlock + " " + queryCode);
        return operatorRule.toString();
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