package myImplementation;

import grammar.PlSqlLexer;
import grammar.PlSqlParser;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.tree.ParseTree;
import org.antlr.v4.runtime.tree.ParseTreeWalker;

public class Main {
    public static void main(String[] args) {
        String plSqlCode = "CREATE OR REPLACE PROCEDURE P_SUBMIT_PAPER\n" +
                "(S_ID NUMBER, P_ID NUMBER, C_ID NUMBER, SUB_DATE DATE, STAT NUMBER)\n" +
                "IS V NUMBER;\n" +
                "BEGIN\n" +
                "  INSERT INTO SUBMISSIONS (SUBMISSION_ID, PAPER_ID, CONFERENCE_ID, SUBMISSION_DATE, STATUS)\n" +
                "VALUES (S_ID, P_ID, C_ID, SUB_DATE, STAT);\n" +
                "EXCEPTION\n" +
                "  WHEN OTHERS \n" +
                "     THEN NULL;\n" +
                "END P_SUBMIT_PAPER;\n";
        PlSqlLexer plSqlLexer = new PlSqlLexer(CharStreams.fromString(plSqlCode));
        CommonTokenStream tokens = new CommonTokenStream(plSqlLexer);
        PlSqlParser parser = new PlSqlParser(tokens);
          PlSqlListener plSqlListener = new PlSqlListener();
        PlSqlProcedureListener sqlProcedureListener = new PlSqlProcedureListener();
        //parser.create_procedure_body().enterRule(sqlProcedureListener);
        ParseTree tree = parser.create_procedure_body();
        ParseTreeWalker walker = new ParseTreeWalker();
        walker.walk(sqlProcedureListener, tree);
    }
}
