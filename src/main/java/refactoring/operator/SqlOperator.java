package refactoring.operator;

import refactoring.ProgramBlockData;
import refactoring.Table;
import refactoring.enums.OperatorType;

import static util.CommonUtil.surroundWithQuotes;

public abstract class SqlOperator {
    protected final int numberOfLineInProgramBlock;
    protected final ProgramBlockData programBlockData;
    protected Table involvedTable;
    private final OperatorType operatorType;
    private boolean hasElseKeyWordInThisLine;

    public SqlOperator(int numberOfLineInProgramBlock, ProgramBlockData programBlockData, OperatorType operatorType) {
        this.numberOfLineInProgramBlock = numberOfLineInProgramBlock;
        this.programBlockData = programBlockData;
        this.operatorType = operatorType;
    }

    public abstract String getOperatorRule();

    public int getNumberOfLineInProgramBlock() {
        return numberOfLineInProgramBlock;
    }

    public OperatorType getOperatorType() {
        return operatorType;
    }

    public ProgramBlockData getProgramBlockData() {
        return programBlockData;
    }

    public Table getInvolvedTable() {
        return involvedTable;
    }

    public void setInvolvedTable(Table involvedTable) {
        this.involvedTable = involvedTable;
    }


    public String getLabel() {
        return surroundWithQuotes("lbl_" + numberOfLineInProgramBlock);
    }

    public String getOperatorRuleName() {
        return programBlockData.getProgramBlockName() + numberOfLineInProgramBlock + "(id)";
    }

    public String getOperatorDispatcherRule() {
        return "Head(st).pc[2] = " + getLabel() + " -> " + getOperatorRuleName();
    }

    public boolean hasElseKeyWordInThisLine() {
        return hasElseKeyWordInThisLine;
    }

    public void setHasElseKeyWordInThisLine(boolean hasElseKeyWordInThisLine) {
        this.hasElseKeyWordInThisLine = hasElseKeyWordInThisLine;
    }

    @Override
    public String toString() {
        return "AbstractSqlOperator{" +
                "numberOfLineInProgramBlock=" + numberOfLineInProgramBlock +
                ", operatorType=" + operatorType +
                ", hasElseKeyWordInThisLine=" + hasElseKeyWordInThisLine +
                '}';
    }
}