package myImplementation;

public enum DeclaredTypes {
    VARRAY("arr"),
    RECORD("rec");
    private final String shortName;

    DeclaredTypes(String type) {
        shortName = type;
    }

    public String getShortName() {
        return shortName;
    }
}
