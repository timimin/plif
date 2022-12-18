package plif.generator.util;

public class Constants {
    public static final String START_OF_MODULE_DECLARATION = "------------------------------- MODULE ";//левая часть первой строчки спецификации
    public static final String END_OF_MODULE_DECLARATION = " -------------------------------";//правая часть первой строчки спецификации
    public static final String END_OF_MODULE = "=============================================================================";//последняя строчка спецификации
    public static final String MAIN_SPECIFICATION_EXTENDS_CLAUSE = "EXTENDS RuntimeFS\n";
    public static final String COMMA_WITH_LINE_BREAK = ",\n ";
    public static final String UNCHANGED_TRACE = "/\\ Trace' = Append(Trace,<<>>)\n";
}