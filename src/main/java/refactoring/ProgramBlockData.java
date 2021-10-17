package refactoring;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

public class ProgramBlockData {
    private File sourceFile;
    private String programBlockName;
    private int numberOfColumnsInRecord;
    private String varrayTypeName;
    private String recordTypeName;
    private String returnType;
    private List<Operator> operators;
    private List<Variable> variables;

    {
        variables = new ArrayList<>();
        operators = new ArrayList<>();
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

    public List<Operator> getOperators() {
        return operators;
    }

    public void setOperators(List<Operator> operators) {
        this.operators = operators;
    }

    public List<Variable> getVariables() {
        return variables;
    }

    public void setVariables(List<Variable> variables) {
        if (this.variables == null)
            this.variables = variables;
    }

    public File getSourceFile() {
        return sourceFile;
    }

    public void addVariable(Variable variable) {
        variables.add(variable);
    }

    public void addOperator(Operator operator) {
        operators.add(operator);
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
                ", operatorToLinesMap=" + operators +
                ", typeToVariableNamesMap=" + variables +
                '}';
    }
}