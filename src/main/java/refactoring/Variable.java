package refactoring;

import enums.ProgramBlockVariableType;
import enums.VariableType;

import java.util.ArrayList;
import java.util.List;

//TODO Может сделать вложенным? Разобраться с типом вложенного класса и видимостью
public class Variable {
    private VariableType variableType;
    private String variableName;
    private ProgramBlockVariableType programBlockVariableType;

    //TODO Возвращать список, чтобы не получать каждый раз политики для записией и массивов
    private List<String> variablePolicies;

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

    public void setVariablePolicies(List<String> variablePolicies) {
        this.variablePolicies = variablePolicies;
    }

    public void addVariablePolicy(String variablePolicy) {
        variablePolicies.add(variablePolicy);
    }

    public void setProgramBlockVariableType(ProgramBlockVariableType programBlockVariableType) {
        this.programBlockVariableType = programBlockVariableType;
    }
}
