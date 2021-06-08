package myImplementation;

import grammar.PlSqlLexer;
import grammar.PlSqlParser;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.tree.ParseTree;
import org.antlr.v4.runtime.tree.ParseTreeWalker;

import java.io.*;

public class Main {
    public static void main(String[] args) throws IOException {
        StringBuilder plSqlCode = new StringBuilder();
        try (InputStream sqlScriptSource = Thread.currentThread().getContextClassLoader().getResourceAsStream("procedures/test.sql");
             BufferedReader sqlScriptSourceReader = new BufferedReader(new InputStreamReader(sqlScriptSource))) {
            while (sqlScriptSourceReader.ready())
                plSqlCode.append(sqlScriptSourceReader.readLine()).append("\n");
        } catch (IOException e) {
            e.printStackTrace();
        }
        ColumnPolicyWriter.writeColumnPolicy();
        PlSqlLexer plSqlLexer = new PlSqlLexer(CharStreams.fromString(plSqlCode.toString()));
        CommonTokenStream tokens = new CommonTokenStream(plSqlLexer);
        PlSqlParser parser = new PlSqlParser(tokens);
        PlSqlListener plSqlListener = new PlSqlListener();
        PlSqlProcedureListener sqlProcedureListener = new PlSqlProcedureListener();
        //parser.create_procedure_body().enterRule(sqlProcedureListener);
        ParseTree tree = parser.sql_script();
        ParseTreeWalker walker = new ParseTreeWalker();
        walker.walk(sqlProcedureListener, tree);
    }
}
