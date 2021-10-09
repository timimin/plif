package refactoring;

import enums.VariableType;

//TODO Может сделать вложенным? Разобраться с типом вложенного класса и видимостью
public class Variable {
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
}
