package refactoring.operator;

import refactoring.ProgramBlockData;
import refactoring.SqlOperator;
import refactoring.Table;
import refactoring.enums.OperatorType;

import static util.CommonUtil.surroundWithQuotes;

public abstract class AbstractSqlOperator implements SqlOperator {
    protected final int numberOfLineInProgramBlock;
    protected final ProgramBlockData programBlockData;
    protected final OperatorType operatorType;
    protected Table involvedTable;

    public AbstractSqlOperator(int numberOfLineInProgramBlock, ProgramBlockData programBlockData, OperatorType operatorType) {
        this.numberOfLineInProgramBlock = numberOfLineInProgramBlock;
        this.programBlockData = programBlockData;
        this.operatorType = operatorType;
    }

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

    @Override
    public String getLabel() {
        return surroundWithQuotes("lbl_" + numberOfLineInProgramBlock);
    }

    @Override
    public String getOperatorRuleName() {
        return programBlockData.getProgramBlockName() + numberOfLineInProgramBlock + "(id)";
    }

    @Override
    public String getOperatorDispatcherRule() {
        return "Head(st).pc[2] = " + getLabel() + " -> " + getOperatorRuleName();
    }

    @Override
    public String toString() {
        return "AbstractSqlOperator{" +
                "numberOfLineInProgramBlock=" + numberOfLineInProgramBlock +
                ", operatorType=" + operatorType +
                '}';
    }
}