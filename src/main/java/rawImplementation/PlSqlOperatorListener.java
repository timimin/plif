package rawImplementation;

import enums.OperatorType;
import grammar.PlSqlParser;
import grammar.PlSqlParserBaseListener;
import org.antlr.v4.runtime.Token;
import refactoring.ProgramBlockData;

import java.util.ArrayList;

import static enums.OperatorType.*;

public class PlSqlOperatorListener extends PlSqlParserBaseListener {

    private final ProgramBlockData programBlockData;

    public PlSqlOperatorListener(ProgramBlockData programBlockData) {
        this.programBlockData = programBlockData;
    }

    @Override
    public void enterSelect_statement(PlSqlParser.Select_statementContext ctx) {
     //   addLineOfOperatorToMap(SELECT, ctx.start);
    }

    @Override
    public void enterIf_statement(PlSqlParser.If_statementContext ctx) {
     //   addLineOfOperatorToMap(IF, ctx.start);
     //   addLineOfOperatorToMap(END_IF, ctx.stop);
    }

    @Override
    public void enterInsert_statement(PlSqlParser.Insert_statementContext ctx) {
      //  addLineOfOperatorToMap(INSERT, ctx.start);
    }

    @Override
    public void enterUpdate_statement(PlSqlParser.Update_statementContext ctx) {
       // addLineOfOperatorToMap(UPDATE, ctx.start);
    }

    @Override
    public void enterFunction_argument(PlSqlParser.Function_argumentContext ctx) {
      //  addLineOfOperatorToMap(FUNCTION_CALL, ctx.start);
    }

   /* public static void main(String[] args) {
        PlSqlLexer plSqlLexer = new PlSqlLexer(CharStreams.fromString("CREATE OR REPLACE PROCEDURE P_ALLOCATE (ID NUMBER, S_ID NUMBER, SEC_ID NUMBER, ALLOC_DATE DATE)\n" +
                "IS\n" +
                "  PAPER_NOT_ACCEPTED EXCEPTION;\n" +
                "  V_P_ID NUMBER;\n" +
                "  V_IS_ACC BOOLEAN;\n" +
                "BEGIN\n" +
                "  V_IS_ACC := F_IS_ACCEPTED (S_ID);\n" +
                "  IF V_IS_ACC\n" +
                "     THEN\n" +
                "SELECT PAPER_ID INTO V_P_ID\n" +
                "FROM SUBMISSIONS\n" +
                "WHERE SUBMISSION_ID = S_ID;\n" +
                "INSERT INTO ALLOCATIONS (ALLOCATION_ID, SUBMISSION_ID, SECTION_ID, ALLOCATION_DATE)\n" +
                "VALUES (ID, S_ID, SEC_ID, ALLOC_DATE);\n" +
                "ELSE RAISE PAPER_NOT_ACCEPTED;\n" +
                "END IF;\n" +
                "EXCEPTION\n" +
                "     WHEN PAPER_NOT_ACCEPTED THEN\n" +
                "        INSERT INTO LOGS\n" +
                "        VALUES (1, 'AN ATTEMPT WAS MADE TO ALLOCATE UNACCEPTED SUBMISSION ' || S_ID || ', ' || SYSDATE || '.');\n" +
                "WHEN OTHERS THEN\n" +
                "        NULL;\n" +
                "END P_ALLOCATE;"));
        CommonTokenStream tokens = new CommonTokenStream(plSqlLexer);
        PlSqlParser parser = new PlSqlParser(tokens);
        ParseTree tree = parser.sql_script();
        ParseTreeWalker walker = new ParseTreeWalker();
        PlSqlParserBaseListener sqlListener = new PlSqlOperatorListener();
        walker.walk(sqlListener, tree);
        System.out.println(sqlListener);
    }*/

    @Override
    public String toString() {
        return programBlockData.toString();
    }

    /*private void addLineOfOperatorToMap(OperatorType operatorType, Token token) {
        programBlockData.getOperatorLines().putIfAbsent(operatorType, new ArrayList<>());
        programBlockData.getOperatorLines().get(operatorType).add(token.getLine());
    }*/
}
