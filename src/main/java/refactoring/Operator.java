package refactoring;

import enums.OperatorType;

import java.util.ArrayList;
import java.util.List;

public class Operator {
    private OperatorType operatorType;
    private int numberOfLineInProgramBlock;
    private List<String> affectedColumns;
    private List<String> expressions;

    {
        affectedColumns = new ArrayList<>();
        expressions = new ArrayList<>();
    }

    public Operator() {
    }

    public Operator(OperatorType operatorType, int numberOfLineInProgramBlock) {
        this.operatorType = operatorType;
        this.numberOfLineInProgramBlock = numberOfLineInProgramBlock;
    }

    public OperatorType getOperatorType() {
        return operatorType;
    }

    public void setOperatorType(OperatorType operatorType) {
        this.operatorType = operatorType;
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

    public List<String> getAffectedColumns() {
        return affectedColumns;
    }

    public void setAffectedColumns(List<String> affectedColumns) {
        this.affectedColumns = affectedColumns;
    }

    public List<String> getExpressions() {
        return expressions;
    }

    public void setExpressions(List<String> expressions) {
        this.expressions = expressions;
    }
}