package myImplementation;

import grammar.PlSqlLexer;
import grammar.PlSqlParser;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;

public class Main {
    public static void main(String[] args) {
        String plSqlCode = "CREATE OR REPLACE PROCEDURE P_SUBMIT_PAPER\n" +
                "(S_ID NUMBER, P_ID NUMBER, C_ID NUMBER, SUB_DATE DATE, STAT NUMBER)\n" +
                "IS \n" +
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
        PlSqlListener plSqlParserBaseListener = new PlSqlListener();
        parser.create_procedure_body().enterRule(plSqlParserBaseListener);
       /* ParseTree tree = parser.sql_script();
        ParseTreeWalker walker = new ParseTreeWalker();
        walker.walk(new PlSqlParserBaseListener(), tree);
        System.out.println(tree.getChild(0).getChild(0).getChild(0).getText());
        System.out.println(tree.getChild(0).getChild(0).getChild(4).getText());*/
    }
}
