package refactoring.operator;

import refactoring.ProgramBlockData;
import refactoring.SqlOperator;
import refactoring.Table;
import refactoring.Variable;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import static util.CommonUtil.replaceEndOfString;
import static util.CommonUtil.surroundWithQuotes;

/**
 * Инсерт в одну таблицу(insert values), без селекта(insert into a select b from c)
 */
//TODO В абстрактный класс Operator добавить общие для скл-операторов методы
public class InsertOperator implements SqlOperator {
    private List<String> insertedExpressions;
    private final int numberOfLineInProgramBlock;
    private final List<String> involvedColumnsPolicies;
    private Table involvedTable;
    private final ProgramBlockData programBlockData;

    {
        involvedColumnsPolicies = new ArrayList<>();
        insertedExpressions = new ArrayList<>();
    }


    public InsertOperator(int numberOfLineInProgramBlock, ProgramBlockData programBlockData) {
        this.numberOfLineInProgramBlock = numberOfLineInProgramBlock;
        this.programBlockData = programBlockData;
    }

    public List<String> getInsertedExpressions() {
        return insertedExpressions;
    }

    public void setInsertedExpressions(List<String> insertedExpressions) {
        this.insertedExpressions = insertedExpressions;
    }

    public Table getInvolvedTable() {
        return involvedTable;
    }

    public void setInvolvedTable(Table involvedTable) {
        this.involvedTable = involvedTable;
    }

    public int getNumberOfLineInProgramBlock() {
        return numberOfLineInProgramBlock;
    }

    public String getLabel() {
        return "lbl_" + numberOfLineInProgramBlock;
    }

    public List<String> getInvolvedColumnsPolicies() {
        return involvedColumnsPolicies;
    }

    public void addInvolvedColumnPolicy(String columnName) {
        involvedColumnsPolicies.add(involvedTable.getColumnPolicy(columnName));
    }

    @Override
    public String getOperatorRule() {
        StringBuilder operatorRule = new StringBuilder(getOperatorRuleName());
        operatorRule.append(" ==\n /\\ insert (id, <<\n ");
        involvedColumnsPolicies.forEach(policy -> operatorRule.append(surroundWithQuotes(policy)).append(",\n "));
        replaceEndOfString(operatorRule, ",\n ", ">>,\n <<\n ");
        Map<String, Variable> variables = programBlockData.getVariables();
        variables.keySet().stream().filter(key -> insertedExpressions.contains(key)).forEach(
                key -> variables.get(key).getVariablePolicies().forEach(policy -> operatorRule.append("load(id, ").append(policy).append("(id)),\n ")));
        replaceEndOfString(operatorRule, ",\n ", ">>,\n <<\n ");
        operatorRule.append(surroundWithQuotes(programBlockData.getProgramBlockName()))
                .append(", ")
                .append(surroundWithQuotes(programBlockData.getOperators().higherEntry(numberOfLineInProgramBlock).getValue().getLabel()))
                .append("\n >>)\n /\\ Trace' = Append(Trace,<<>>)\n /\\ Ignore' = 0\n /\\ SLocks' = SLocks\n /\\ StateE' = SLocks'[id]\n /\\ XLocks' = XLocks\n\n");
        return operatorRule.toString();
    }

    @Override
    public String getOperatorRuleName() {
        return programBlockData.getProgramBlockName() + numberOfLineInProgramBlock + "(id)";
    }
}