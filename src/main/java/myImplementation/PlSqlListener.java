package myImplementation;

import grammar.PlSqlParserBaseListener;

import java.util.ArrayList;
import java.util.List;

import static grammar.PlSqlParser.*;

public class PlSqlListener extends PlSqlParserBaseListener {
    public List<String> strings = new ArrayList<>();

    @Override
    public void enterCreate_procedure_body(Create_procedure_bodyContext ctx) {
        List<ParameterContext> parameters = ctx.parameter();
        System.out.println("Parameters:");
        for (ParameterContext param : parameters) {
            System.out.println(param.parameter_name().getText() + " " + param.type_spec().getText());
        }
        System.out.println();
        List<StatementContext> statementContexts = ctx.body().seq_of_statements().statement();
        System.out.println("Columns:");
        for (StatementContext statement : statementContexts) {
            var columns = statement.sql_statement().data_manipulation_language_statements().
                    insert_statement().single_table_insert().insert_into_clause().paren_column_list().column_list().column_name();
            for (var column : columns) {
                System.out.println(column.getText());
            }
        }
    }

    @Override
    public void exitCreate_procedure_body(Create_procedure_bodyContext ctx) {
        super.exitCreate_procedure_body(ctx);
    }
}
