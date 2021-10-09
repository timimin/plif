package enums;

public enum VariableType {
    BUILT_IN("built-in"),//Для всех "примитивных" типов Pl/SQL
    CUSTOM_VARRAY("arr"),//Для созданного Varray
    CUSTOM_RECORD("rec");//Для созданной Record
    private final String shortName;

    VariableType(String type) {
        shortName = type;
    }

    public String getShortName() {
        return shortName;
    }
}
