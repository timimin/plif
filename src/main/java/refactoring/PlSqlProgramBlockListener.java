package refactoring;

import grammar.PlSqlParser;
import grammar.PlSqlParserBaseListener;
import org.antlr.v4.runtime.RuleContext;
import refactoring.operator.ExitOperator;
import refactoring.operator.InsertOperator;
import refactoring.operator.UpdateOperator;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import static enums.ProgramBlockType.FUNCTION;
import static enums.ProgramBlockType.PROCEDURE;
import static enums.ProgramBlockVariableType.*;
import static enums.VariableType.*;

public class PlSqlProgramBlockListener extends PlSqlParserBaseListener {
    private final ProgramBlockData programBlockData;
    private final Map<Integer, InsertOperator> insertOperatorMap;
    private final Map<Integer, UpdateOperator> updateOperatorMap;
    private final DatabaseSchema databaseSchema;
    private final Map<Integer, List<String>> relationalExpressionToLineMap;

    public PlSqlProgramBlockListener(ProgramBlockData programBlockData, DatabaseSchema databaseSchema) {
        this.programBlockData = programBlockData;
        this.databaseSchema = databaseSchema;
        this.insertOperatorMap = new LinkedHashMap<>();
        this.updateOperatorMap = new LinkedHashMap<>();
        this.relationalExpressionToLineMap = new LinkedHashMap<>();
    }

    public ProgramBlockData getProgramBlockData() {
        return programBlockData;
    }

    @Override
    public void enterSelect_statement(PlSqlParser.Select_statementContext ctx) {
        int numberOfLine = ctx.start.getLine();
        // programBlockData.addOperator(new Operator(SELECT, numberOfLine));
    }

    //TODO 2 оператора в одном правиле?
    @Override
    public void enterIf_statement(PlSqlParser.If_statementContext ctx) {
        int numberOfStartLine = ctx.start.getLine();
        //      programBlockData.addOperator(new Operator(IF, numberOfStartLine));
        int numberOfStopLine = ctx.stop.getLine();
        //     programBlockData.addOperator(new Operator(END_IF, numberOfStopLine));
    }

    @Override
    public void enterInsert_statement(PlSqlParser.Insert_statementContext ctx) {
        int numberOfLine = ctx.start.getLine();
        InsertOperator insertOperator = new InsertOperator(numberOfLine, programBlockData);
        insertOperatorMap.putIfAbsent(numberOfLine, insertOperator);
    }

    @Override
    public void enterUpdate_statement(PlSqlParser.Update_statementContext ctx) {
        int numberOfLine = ctx.start.getLine();
        UpdateOperator updateOperator = new UpdateOperator(numberOfLine, programBlockData);
        updateOperatorMap.putIfAbsent(numberOfLine, updateOperator);
    }

    @Override
    public void enterColumn_based_update_set_clause(PlSqlParser.Column_based_update_set_clauseContext ctx) {
        UpdateOperator updateOperator = updateOperatorMap.get(ctx.start.getLine());
        updateOperator.getUpdatableColumnPolicies().add(updateOperator.getInvolvedTable().getColumnPolicy(ctx.column_name().getText()));
        updateOperator.getUpdatingExpressions().add(ctx.expression().getText());
    }

    @Override
    public void enterWhere_clause(PlSqlParser.Where_clauseContext ctx) {//where должно быть записано в одну строку(или весь оператор в одну строку)
        if (ctx.parent instanceof PlSqlParser.Update_statementContext) {
            int numberOfLine = ctx.start.getLine();
            UpdateOperator updateOperator = updateOperatorMap.get(numberOfLine);
            relationalExpressionToLineMap.get(numberOfLine).forEach(expression -> updateOperator.getConditionalExpressions().add(expression));
        }
    }

    @Override
    public void enterRelational_expression(PlSqlParser.Relational_expressionContext ctx) {
        if (ctx.getChildCount() == 1) {
            int numberOfLine = ctx.start.getLine();
            relationalExpressionToLineMap.putIfAbsent(numberOfLine, new ArrayList<>());
            relationalExpressionToLineMap.get(numberOfLine).add(ctx.getText());
        }
    }

    @Override
    public void enterFunction_argument(PlSqlParser.Function_argumentContext ctx) {
        int numberOfLine = ctx.start.getLine();
        //  programBlockData.addOperator(new Operator(FUNCTION_CALL, numberOfLine));
    }

    @Override
    public void enterCreate_function_body(PlSqlParser.Create_function_bodyContext ctx) {
        programBlockData.setReturnType(ctx.type_spec().getText());
    }

    @Override
    public void enterProcedure_name(PlSqlParser.Procedure_nameContext ctx) {
        programBlockData.setProgramBlockType(PROCEDURE);
        programBlockData.setProgramBlockName(ctx.getText());
    }

    @Override
    public void enterFunction_name(PlSqlParser.Function_nameContext ctx) {
        programBlockData.setProgramBlockType(FUNCTION);
        programBlockData.setProgramBlockName(ctx.getText());
    }

    //TODO не нужно добавлять тип переменной? Поддерживать разные типы(записи, варреи) в параметрах
    @Override
    public void enterParameter_name(PlSqlParser.Parameter_nameContext ctx) {
        programBlockData.addVariable(new Variable(BUILT_IN, ctx.getText(), INPUT_PARAMETER));
    }

    @Override
    public void enterVariable_declaration(PlSqlParser.Variable_declarationContext ctx) {
        String typeName = ctx.type_spec().getText();
        if (typeName.equals(programBlockData.getRecordTypeName())) {
            programBlockData.addVariable(new Variable(CUSTOM_RECORD, ctx.identifier().getText(), LOCAL_VARIABLE));
        } else if (typeName.equals(programBlockData.getVarrayTypeName())) {
            programBlockData.addVariable(new Variable(CUSTOM_VARRAY, ctx.identifier().getText(), LOCAL_VARIABLE));
        } else {
            programBlockData.addVariable(new Variable(BUILT_IN, ctx.identifier().getText(), LOCAL_VARIABLE));
        }
    }

    @Override
    public void enterException_declaration(PlSqlParser.Exception_declarationContext ctx) {
        programBlockData.addVariable(new Variable(BUILT_IN, ctx.identifier().getText(), EXCEPTION));
    }

    @Override
    public void enterObject_member_spec(PlSqlParser.Object_member_specContext ctx) {
        programBlockData.setNumberOfColumnsInRecord(programBlockData.getNumberOfColumnsInRecord() + 1);
    }

    //Допускается 2 объявления типа в функции/процедуре, один - запись(AS OBJECT), другой - коллекция (AS VARRAY), не более одного каждого типа.
    @Override
    public void enterType_definition(PlSqlParser.Type_definitionContext ctx) {
        if (ctx.object_type_def().object_as_part().varray_type_def() != null) {
            programBlockData.setVarrayTypeName(ctx.type_name().getText());
        } else {
            programBlockData.setRecordTypeName(ctx.type_name().getText());
        }
    }

    @Override
    public void enterGeneral_table_ref(PlSqlParser.General_table_refContext ctx) {
        int numberOfLine = ctx.start.getLine();
        RuleContext parent = ctx.parent;
        if (parent instanceof PlSqlParser.Insert_into_clauseContext) {
            insertOperatorMap.get(numberOfLine).setInvolvedTable(databaseSchema.getTables().get(ctx.getText()));
        } else if (parent instanceof PlSqlParser.Update_statementContext) {
            updateOperatorMap.get(numberOfLine).setInvolvedTable(databaseSchema.getTables().get(ctx.getText()));
        }
    }

    //FIXME Выражения вида a+1 будут вноситься как a+1, вместо a и 1, перед этип требуется вынести a+1 в отдельную переменную
    @Override
    public void enterValues_clause(PlSqlParser.Values_clauseContext ctx) {
        InsertOperator insertOperator = insertOperatorMap.get(ctx.start.getLine());
        ctx.expressions().children.stream()
                .filter(expression -> expression.getChildCount() > 0)
                .forEach(expression -> insertOperator.getInsertedExpressions().add(expression.getText()));
    }

    @Override
    public void enterColumn_list(PlSqlParser.Column_listContext ctx) {
        if (ctx.parent instanceof PlSqlParser.Paren_column_listContext) {
            RuleContext parent = ctx.parent;
            if (parent.parent instanceof PlSqlParser.Insert_into_clauseContext) {
                InsertOperator insertOperator = insertOperatorMap.get(ctx.start.getLine());
                ctx.column_name().forEach(columnName -> insertOperator.addInvolvedColumnPolicy(columnName.getText()));
            }
        }
    }

    @Override
    public void exitInsert_statement(PlSqlParser.Insert_statementContext ctx) {
        InsertOperator insertOperator = insertOperatorMap.get(ctx.start.getLine());
        if (insertOperator.getInvolvedColumnsPolicies().isEmpty()) {
            insertOperator.getInvolvedColumnsPolicies().addAll(insertOperator.getInvolvedTable().getColumnPolicies());
        }
    }

    @Override
    public void exitCreate_procedure_body(PlSqlParser.Create_procedure_bodyContext ctx) {
        exitProgramBlock(ctx.stop.getLine());
    }

    @Override
    public void exitCreate_function_body(PlSqlParser.Create_function_bodyContext ctx) {
        if (programBlockData.getReturnType().equals(programBlockData.getVarrayTypeName())) {
            programBlockData.addVariable(new Variable(CUSTOM_VARRAY, "", RETURN_VARIABLE));
        } else if (programBlockData.getReturnType().equals(programBlockData.getRecordTypeName())) {
            programBlockData.addVariable(new Variable(CUSTOM_RECORD, "", RETURN_VARIABLE));
        } else {
            programBlockData.addVariable(new Variable(BUILT_IN, "", RETURN_VARIABLE));
        }
        exitProgramBlock(ctx.stop.getLine());
    }

    private void addAllOperatorsToProgramBlockData() {
        List.of(insertOperatorMap, updateOperatorMap).forEach(operatorMap -> programBlockData.getOperators().putAll(operatorMap));
    }

    private void exitProgramBlock(int endLine) {
        programBlockData.getOperators().put(endLine, new ExitOperator(endLine, programBlockData));
        addAllOperatorsToProgramBlockData();
    }
}
