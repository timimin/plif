package refactoring.operator;

import refactoring.Table;

import java.util.ArrayList;
import java.util.List;

public class UpdateOperator {
    private List<String> updatingExpressions;
    private int numberOfLineInProgramBlock;
    private List<String> involvedColumns;
    private Table involvedTable;

    {
        involvedColumns = new ArrayList<>();
        updatingExpressions = new ArrayList<>();
    }


    public UpdateOperator(int numberOfLineInProgramBlock) {
        this.numberOfLineInProgramBlock = numberOfLineInProgramBlock;
    }

    public List<String> getUpdatingExpressions() {
        return updatingExpressions;
    }

    public void setUpdatingExpressions(List<String> updatingExpressions) {
        this.updatingExpressions = updatingExpressions;
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

    public void setNumberOfLineInProgramBlock(int numberOfLineInProgramBlock) {
        this.numberOfLineInProgramBlock = numberOfLineInProgramBlock;
    }

    public String getLabel() {
        return "lbl_" + numberOfLineInProgramBlock;
    }

    public List<String> getInvolvedColumns() {
        return involvedColumns;
    }

    public void setInvolvedColumns(List<String> involvedColumns) {
        this.involvedColumns = involvedColumns;
    }
}
