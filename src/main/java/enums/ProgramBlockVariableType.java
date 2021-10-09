package enums;

public enum ProgramBlockVariableType {
    INPUT_PARAMETER("p"),
    LOCAL_VARIABLE("v"),
    RETURN_VARIABLE("r"),
    EXCEPTION("e");
    private final String shortName;

    ProgramBlockVariableType(String type) {
        shortName = type;
    }

    public String getShortName() {
        return shortName;
    }
}
