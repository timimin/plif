package refactoring;

import enums.OperatorType;
import enums.ProgramBlockVariableType;

import java.io.File;
import java.util.EnumMap;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProgramBlockData {
    private File sourceFile;
    private String programBlockName;
    private int numberOfColumnsInRecord;
    private String varrayTypeName;
    private String recordTypeName;
    private String returnType;
    private Map<OperatorType, List<Integer>> operatorLines;
    private Map<ProgramBlockVariableType, List<Variable>> variableTypes;

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
        if (this.programBlockName == null)
            this.programBlockName = programBlockName;
    }

    public int getNumberOfColumnsInRecord() {
        return numberOfColumnsInRecord;
    }

    public void setNumberOfColumnsInRecord(int numberOfColumnsInRecord) {
        if (this.numberOfColumnsInRecord == 0)
            this.numberOfColumnsInRecord = numberOfColumnsInRecord;
    }

    public String getVarrayTypeName() {
        return varrayTypeName;
    }

    public void setVarrayTypeName(String varrayTypeName) {
        if (this.varrayTypeName == null)
            this.varrayTypeName = varrayTypeName;
    }

    public String getRecordTypeName() {
        return recordTypeName;
    }

    public void setRecordTypeName(String recordTypeName) {
        if (this.recordTypeName == null)
            this.recordTypeName = recordTypeName;
    }

    public String getReturnType() {
        return returnType;
    }

    public void setReturnType(String returnType) {
        if (this.returnType == null)
            this.returnType = returnType;
    }

    public Map<OperatorType, List<Integer>> getOperatorLines() {
        if (operatorLines == null) {
            operatorLines = new EnumMap<>(OperatorType.class);
        }
        return operatorLines;
    }

    public void setOperatorLines(Map<OperatorType, List<Integer>> operatorLines) {
        if (this.operatorLines == null)
            this.operatorLines = operatorLines;
    }

    public Map<ProgramBlockVariableType, List<Variable>> getVariableTypes() {
        if (variableTypes == null) {
            variableTypes = new EnumMap<>(ProgramBlockVariableType.class);
        }
        return variableTypes;
    }

    public void setVariableTypes(Map<ProgramBlockVariableType, List<Variable>> variableTypes) {
        if (this.variableTypes == null)
            this.variableTypes = variableTypes;
    }

    public File getSourceFile() {
        return sourceFile;
    }

    @Override
    public String toString() {
        return "ProgramBlockData{" +
                "sourceFile=" + sourceFile +
                ", programBlockName='" + programBlockName + '\'' +
                ", numberOfColumnsInRecord=" + numberOfColumnsInRecord +
                ", varrayTypeName='" + varrayTypeName + '\'' +
                ", recordTypeName='" + recordTypeName + '\'' +
                ", returnType='" + returnType + '\'' +
                ", operatorToLinesMap=" + operatorLines +
                ", typeToVariableNamesMap=" + variableTypes +
                '}';
    }
}