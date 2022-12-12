package generation.operator;

import generation.ProgramBlockData;
import generation.Table;
import generation.enums.OperatorType;

import static util.CommonUtil.surroundWithQuotes;
import static util.Constants.UNCHANGED_TRACE;

public abstract class SqlOperator {
    protected final int numberOfLineInProgramBlock;
    protected String queryCode;
    protected final ProgramBlockData programBlockData;
    protected Table involvedTable;
    private final OperatorType operatorType;
    private boolean hasElseKeyWordInThisLine;

    public SqlOperator(int numberOfLineInProgramBlock, ProgramBlockData programBlockData, OperatorType operatorType) {
        this.numberOfLineInProgramBlock = numberOfLineInProgramBlock;
        this.programBlockData = programBlockData;
        this.operatorType = operatorType;
    }

    public SqlOperator(int numberOfLineInProgramBlock, String queryCode, ProgramBlockData programBlockData, OperatorType operatorType) {
        this.numberOfLineInProgramBlock = numberOfLineInProgramBlock;
        this.queryCode = queryCode;
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

    public String getOperatorRuleNameWithId() {
        return getOperatorRuleName() + "(id)";
    }

    public String getOperatorRuleName() {
        return programBlockData.getProgramBlockName() + numberOfLineInProgramBlock;
    }

    public String getOperatorDispatcherRule() {
        return "Head(st).pc[2] = " + getLabel() + " -> " + getOperatorRuleNameWithId();
    }

    public boolean hasElseKeyWordInThisLine() {
        return hasElseKeyWordInThisLine;
    }

    public void setHasElseKeyWordInThisLine(boolean hasElseKeyWordInThisLine) {
        this.hasElseKeyWordInThisLine = hasElseKeyWordInThisLine;
    }

    protected abstract String getTrace();

    @Override
    public String toString() {
        return "AbstractSqlOperator{" +
                "numberOfLineInProgramBlock=" + numberOfLineInProgramBlock +
                ", operatorType=" + operatorType +
                ", hasElseKeyWordInThisLine=" + hasElseKeyWordInThisLine +
                '}';
    }
}