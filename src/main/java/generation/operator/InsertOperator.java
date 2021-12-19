package generation.operator;

import generation.ProgramBlockData;
import generation.enums.OperatorType;

import java.util.ArrayList;
import java.util.List;

import static util.Constants.UNCHANGED_TRACE;
import static util.OperatorUtil.appendColumnAndExpressionPolicies;
import static util.OperatorUtil.appendNextRuleLabel;

/**
 * Инсерт в одну таблицу(insert values), без селекта(insert into a select b from c)
 */
//TODO В абстрактный класс Operator добавить общие для скл-операторов методы
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
        StringBuilder operatorRule = new StringBuilder(getOperatorRuleName()).append(" ==\n/\\ insert(id, <<\n ");
        appendColumnAndExpressionPolicies(operatorRule, involvedColumnsPolicies, programBlockData.getVariables(), insertedExpressions, ">>,\n <<\n ");
        appendNextRuleLabel(operatorRule, programBlockData, numberOfLineInProgramBlock);
        operatorRule.append("\n >>)\n").append(UNCHANGED_TRACE).append("/\\ Ignore' = 0\n/\\ SLocks' = SLocks\n/\\ StateE' = SLocks'[id]\n/\\ XLocks' = XLocks\n\n");
        return operatorRule.toString();
    }
}