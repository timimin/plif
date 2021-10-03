package myImplementation;

import grammar.PlSqlLexer;
import grammar.PlSqlParser;
import grammar.PlSqlParserBaseListener;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.tree.ParseTree;
import org.antlr.v4.runtime.tree.ParseTreeWalker;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;

public class ParametersFSMaker {
    public static void main(String[] args) throws IOException {
        ColumnPolicyWriter.writeColumnPolicy();
        File[] procedureFiles = new File("src/main/resources/procedures").listFiles();
        File[] functionFiles = new File("src/main/resources/functions").listFiles();
        writeParametersFromFiles(procedureFiles == null ? new File[0] : procedureFiles);
        writeParametersFromFiles(functionFiles == null ? new File[0] : functionFiles);
    }

    private static void writeParametersFromFiles(File[] files) {
        for (File file : files) {
            StringBuilder plSqlCode = new StringBuilder();
            try (BufferedReader sqlScriptSourceReader = new BufferedReader(new FileReader(file))) {
                while (sqlScriptSourceReader.ready()) {
                    plSqlCode.append(sqlScriptSourceReader.readLine()).append("\n");
                }
                PlSqlLexer plSqlLexer = new PlSqlLexer(CharStreams.fromString(plSqlCode.toString()));
                CommonTokenStream tokens = new CommonTokenStream(plSqlLexer);
                PlSqlParser parser = new PlSqlParser(tokens);
                ParseTree tree = parser.sql_script();
                ParseTreeWalker walker = new ParseTreeWalker();
                PlSqlParserBaseListener sqlListener = new PlSqlProgramBlockListener();
                walker.walk(sqlListener, tree);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
}
