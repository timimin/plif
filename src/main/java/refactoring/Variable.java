package refactoring;

import enums.ProgramBlockVariableType;
import enums.VariableType;

//TODO Может сделать вложенным? Разобраться с типом вложенного класса и видимостью
public class Variable {
    private VariableType variableType;
    private String variableName;
    private ProgramBlockVariableType programBlockVariableType;

    public Variable(VariableType variableType, String variableName, ProgramBlockVariableType programBlockVariableType) {
        this.variableType = variableType;
        this.variableName = variableName;
        this.programBlockVariableType = programBlockVariableType;
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

    public ProgramBlockVariableType getProgramBlockVariableType() {
        return programBlockVariableType;
    }

    public void setProgramBlockVariableType(ProgramBlockVariableType programBlockVariableType) {
        this.programBlockVariableType = programBlockVariableType;
    }
}
