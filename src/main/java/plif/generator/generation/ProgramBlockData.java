package plif.generator.generation;

import plif.generator.generation.enums.ProgramBlockType;
import plif.generator.generation.enums.ProgramBlockVariableType;
import plif.generator.generation.operator.SqlOperator;
import plif.generator.util.CommonUtil;

import java.util.LinkedHashMap;
import java.util.Map;
import java.util.TreeMap;

import static plif.generator.generation.enums.ProgramBlockVariableType.RETURN_VARIABLE;
import static plif.generator.generation.enums.VariableType.CUSTOM_RECORD;
import static plif.generator.generation.enums.VariableType.CUSTOM_VARRAY;

public class ProgramBlockData {
    private String programBlockName;
    private int numberOfColumnsInRecord;
    private String varrayTypeName;
    private String recordTypeName;
    private String returnType;
    private final TreeMap<Integer, SqlOperator> operators;//несколько операторов в одной строке не поддерживаются
    private final Map<String, Variable> variables;
    private ProgramBlockType programBlockType;
    private int numberOfLineOfExceptionKeyWord;
    private ProgramBlocksDataHolder programBlocksDataHolder;

    {
        variables = new LinkedHashMap<>();
        operators = new TreeMap<>();
    }

    public ProgramBlockData(ProgramBlocksDataHolder programBlocksDataHolder) {
        this.programBlocksDataHolder = programBlocksDataHolder;
    }

    public ProgramBlockData() {
    }

    public String getProgramBlockName() {
        return programBlockName;
    }

    public void setProgramBlockName(String programBlockName) {
        this.programBlockName = programBlockName;
    }

    public int getNumberOfColumnsInRecord() {
        return numberOfColumnsInRecord;
    }

    public void setNumberOfColumnsInRecord(int numberOfColumnsInRecord) {
        this.numberOfColumnsInRecord = numberOfColumnsInRecord;
    }

    public String getVarrayTypeName() {
        return varrayTypeName;
    }

    public void setVarrayTypeName(String varrayTypeName) {
        this.varrayTypeName = varrayTypeName;
    }

    public String getRecordTypeName() {
        return recordTypeName;
    }

    public void setRecordTypeName(String recordTypeName) {
        this.recordTypeName = recordTypeName;
    }

    public String getReturnType() {
        return returnType;
    }

    //TODO здесь вряд ли более 1-го раза вызов будет
    public void setReturnType(String returnType) {
        this.returnType = returnType;
    }

    public TreeMap<Integer, SqlOperator> getOperators() {
        return operators;
    }

    public Map<String, Variable> getVariables() {
        return variables;
    }

    public int getNumberOfLineOfExceptionKeyWord() {
        return numberOfLineOfExceptionKeyWord;
    }

    public void setNumberOfLineOfExceptionKeyWord(int numberOfLineOfExceptionKeyWord) {
        this.numberOfLineOfExceptionKeyWord = numberOfLineOfExceptionKeyWord;
    }

    public ProgramBlockType getProgramBlockType() {
        return programBlockType;
    }

    public void setProgramBlockType(ProgramBlockType programBlockType) {
        this.programBlockType = programBlockType;
    }

    public void addVariable(Variable variable) {
        ProgramBlockVariableType programBlockVariableType = variable.getProgramBlockVariableType();
        String policy = programBlockName + "_" + programBlockVariableType.getShortName()
                + (programBlockVariableType != RETURN_VARIABLE ? "_" : "") + variable.getVariableName();
        if (variable.getVariableType() == CUSTOM_RECORD) {
            String recordPolicy = policy + "_" + CUSTOM_RECORD.getShortName() + "_c";
            for (int i = 1; i < numberOfColumnsInRecord + 1; i++) {
                variable.addVariablePolicy(recordPolicy + i);
            }
        } else if (variable.getVariableType() == CUSTOM_VARRAY) {
            String varrayPolicy = policy + "_" + CUSTOM_VARRAY.getShortName() + "_e";
            for (int i = 1; i < 3; i++) {
                for (int j = 1; j < numberOfColumnsInRecord + 1; j++) {
                    variable.addVariablePolicy(varrayPolicy + i + "_c" + j);
                }
            }
        } else {
            variable.addVariablePolicy(policy);
        }
        variables.put(variable.getVariableName(), variable);
    }

    public void addOperator(int numberOfLine, SqlOperator operator) {
        operators.put(numberOfLine, operator);
    }

    public String getProgramBlockDispatcher() {
        StringBuilder programBlockDispatcher = new StringBuilder(programBlockName).append("(id,st) ==\n CASE ");
        operators.values().forEach(
                operator -> programBlockDispatcher.append(operator.getOperatorDispatcherRule()).append("\n[] "));
        programBlockDispatcher.append("OTHER -> UNCHANGED vars\n\n");
        return programBlockDispatcher.toString();
    }

    public String getNextLiteralLabel() {
        return CommonUtil.surroundWithQuotes("literal_" + programBlocksDataHolder.getLiteralCounter().incrementAndGet());
    }

    @Override
    public String toString() {
        return "ProgramBlockData{" +
                "programBlockName='" + programBlockName + '\'' +
                ", numberOfColumnsInRecord=" + numberOfColumnsInRecord +
                ", varrayTypeName='" + varrayTypeName + '\'' +
                ", recordTypeName='" + recordTypeName + '\'' +
                ", returnType='" + returnType + '\'' +
                ", operators=" + operators +
                ", variables=" + variables +
                '}';
    }
}