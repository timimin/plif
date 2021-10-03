package enums;

public enum VariableType {
    INPUT_PARAMETER("p"),
    LOCAL_VARIABLE("v"),
    RETURN_VARIABLE("r"),
    EXCEPTION("e");
    private final String shortName;

    VariableType(String type) {
        shortName = type;
    }

    public String getShortName() {
        return shortName;
    }
}
