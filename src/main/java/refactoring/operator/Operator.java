package refactoring.operator;

import enums.OperatorType;

import java.util.ArrayList;
import java.util.List;

public class Operator {
    private OperatorType operatorType;
    private int numberOfLineInProgramBlock;
    private List<String> involvedColumns;
    private List<String> involvedExpressions;

    {
        involvedColumns = new ArrayList<>();
        involvedExpressions = new ArrayList<>();
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

    public List<String> getInvolvedColumns() {
        return involvedColumns;
    }

    public void setInvolvedColumns(List<String> involvedColumns) {
        this.involvedColumns = involvedColumns;
    }

    public List<String> getInvolvedExpressions() {
        return involvedExpressions;
    }

    public void setInvolvedExpressions(List<String> involvedExpressions) {
        this.involvedExpressions = involvedExpressions;
    }
}