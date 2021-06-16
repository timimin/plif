package myImplementation;

import grammar.PlSqlLexer;
import grammar.PlSqlParser;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.tree.ParseTree;
import org.antlr.v4.runtime.tree.ParseTreeWalker;

import java.io.*;

public class ParametersFSMaker {
    public static void main(String[] args) throws IOException {
        ColumnPolicyWriter.writeColumnPolicy();
        File[] procedureFiles = new File("src/main/resources/procedures").listFiles();
        for (File procedureFile : procedureFiles) {
            StringBuilder plSqlCode = new StringBuilder();
            try (BufferedReader sqlScriptSourceReader = new BufferedReader(new FileReader(procedureFile))) {
                while (sqlScriptSourceReader.ready()) {
                    plSqlCode.append(sqlScriptSourceReader.readLine()).append("\n");
                }
                PlSqlLexer plSqlLexer = new PlSqlLexer(CharStreams.fromString(plSqlCode.toString()));
                CommonTokenStream tokens = new CommonTokenStream(plSqlLexer);
                PlSqlParser parser = new PlSqlParser(tokens);
                ParseTree tree = parser.sql_script();
                ParseTreeWalker walker = new ParseTreeWalker();
                PlSqlProcedureListener sqlProcedureListener = new PlSqlProcedureListener();
                walker.walk(sqlProcedureListener, tree);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
}
//try (InputStream sqlScriptSource = Thread.currentThread().getContextClassLoader().getResourceAsStream("procedures/test.sql");
//                 BufferedReader sqlScriptSourceReader = new BufferedReader(new InputStreamReader(sqlScriptSource))) {