package generation;

import generation.enums.ProgramBlockVariableType;
import generation.enums.VariableType;

import java.util.ArrayList;
import java.util.List;

//TODO Может сделать вложенным? Разобраться с типом вложенного класса и видимостью
public class Variable {
    private VariableType variableType;
    private String variableName;
    private ProgramBlockVariableType programBlockVariableType;
    private final List<String> variablePolicies;

    public Variable(VariableType variableType, String variableName, ProgramBlockVariableType programBlockVariableType) {
        this.variableType = variableType;
        this.variableName = variableName;
        this.programBlockVariableType = programBlockVariableType;
        this.variablePolicies = new ArrayList<>();
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

    public List<String> getVariablePolicies() {
        return variablePolicies;
    }

    public void addVariablePolicy(String variablePolicy) {
        variablePolicies.add(variablePolicy);
    }

    public void setProgramBlockVariableType(ProgramBlockVariableType programBlockVariableType) {
        this.programBlockVariableType = programBlockVariableType;
    }

    @Override
    public String toString() {
        return "Variable{" +
                "variableType=" + variableType +
                ", variableName='" + variableName + '\'' +
                ", programBlockVariableType=" + programBlockVariableType +
                '}';
    }
}
