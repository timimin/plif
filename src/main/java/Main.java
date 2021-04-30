import grammar.PlSqlLexer;
import grammar.PlSqlParser;
import grammar.PlSqlParserBaseListener;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.tree.ParseTree;
import org.antlr.v4.runtime.tree.ParseTreeWalker;

public class Main {
    public static void main(String[] args) {
        String plSqlCode = "CREATE OR REPLACE PROCEDURE P_ADD_PAPER (P_ID NUMBER, TIT VARCHAR2, ABSR VARCHAR2, AUTH VARCHAR2, T CLOB)\n" +
                "IS \n" +
                "BEGIN\n" +
                "  INSERT INTO SUBMISSIONS (PAPER_ID, TITLE, ABSTRACTION, AUTHORS, TEXT)\n" +
                "VALUES (P_ID, TIT, ABSR, AUTH, T);\n" +
                "EXCEPTION\n" +
                "  WHEN OTHERS \n" +
                "     THEN NULL;\n" +
                "END P_SUBMIT_PAPER;\n";
        PlSqlLexer plSqlLexer = new PlSqlLexer(CharStreams.fromString(plSqlCode));
        CommonTokenStream tokens = new CommonTokenStream(plSqlLexer);
        PlSqlParser parser = new PlSqlParser(tokens);
        ParseTree tree = parser.sql_script();
        ParseTreeWalker walker = new ParseTreeWalker();
        walker.walk(new PlSqlParserBaseListener(), tree);
        System.out.println(tree.getChild(0).getChild(0).getChild(0).getText());
        System.out.println(tree.getChild(0).getChild(0).getChild(4).getText());
    }
}
