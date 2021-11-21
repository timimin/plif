package refactoring;

import enums.ProgramBlockType;
import enums.ProgramBlockVariableType;

import java.io.File;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.TreeMap;

import static enums.ProgramBlockVariableType.RETURN_VARIABLE;
import static enums.VariableType.CUSTOM_RECORD;
import static enums.VariableType.CUSTOM_VARRAY;

public class ProgramBlockData {
    private File sourceFile;
    private String programBlockName;
    private int numberOfColumnsInRecord;
    private String varrayTypeName;
    private String recordTypeName;
    private String returnType;
    private TreeMap<Integer, SqlOperator> operators;
    private Map<String, Variable> variables;
    private ProgramBlockType programBlockType;


    {
        variables = new LinkedHashMap<>();
        operators = new TreeMap<>();
    }

    public ProgramBlockData(File sourceFile) {
        this.sourceFile = sourceFile;
    }

    public ProgramBlockData() {
    }

    /*//TODO разобраться с типом вложенного класса и видимостью
    static class Variable {
        private VariableType variableType;
        private String variableName;

        public Variable(VariableType variableType, String variableName) {
            this.variableType = variableType;
            this.variableName = variableName;
        }

        public VariableType getVariableType() {
            return variableType;
        }

        public void setVariableType(VariableType variableType) {
            this.variableType = variableType;
        }

        public String getVariableName() {
            return variableName;
        }

        public void setVariableName(String variableName) {
            this.variableName = variableName;
        }
    }*/

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


    public ProgramBlockType getProgramBlockType() {
        return programBlockType;
    }

    public void setProgramBlockType(ProgramBlockType programBlockType) {
        this.programBlockType = programBlockType;
    }

    public File getSourceFile() {
        return sourceFile;
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