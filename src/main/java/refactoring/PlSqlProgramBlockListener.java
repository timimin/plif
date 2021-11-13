package refactoring;

import grammar.PlSqlParser;
import grammar.PlSqlParserBaseListener;

import static enums.OperatorType.*;
import static enums.ProgramBlockType.FUNCTION;
import static enums.ProgramBlockType.PROCEDURE;
import static enums.ProgramBlockVariableType.*;
import static enums.VariableType.*;

public class PlSqlProgramBlockListener extends PlSqlParserBaseListener {
    private final ProgramBlockData programBlockData;

    public PlSqlProgramBlockListener(ProgramBlockData programBlockData) {
        this.programBlockData = programBlockData;
    }

    public ProgramBlockData getProgramBlockData() {
        return programBlockData;
    }

    @Override
    public void enterSelect_statement(PlSqlParser.Select_statementContext ctx) {
        programBlockData.addOperator(new Operator(SELECT, ctx.start.getLine()));
        //      addLineOfOperatorToMap(SELECT, ctx.start);
    }

    //TODO 2 оператора в одном правиле?
    @Override
    public void enterIf_statement(PlSqlParser.If_statementContext ctx) {
        programBlockData.addOperator(new Operator(IF, ctx.start.getLine()));
        programBlockData.addOperator(new Operator(END_IF, ctx.stop.getLine()));
        //      addLineOfOperatorToMap(IF, ctx.start);
        //    addLineOfOperatorToMap(END_IF, ctx.stop);
    }

    @Override
    public void enterInsert_statement(PlSqlParser.Insert_statementContext ctx) {
        programBlockData.addOperator(new Operator(INSERT, ctx.getStart().getLine()));
        // addLineOfOperatorToMap(INSERT, ctx.start);
    }

    @Override
    public void enterUpdate_statement(PlSqlParser.Update_statementContext ctx) {
        programBlockData.addOperator(new Operator(UPDATE, ctx.start.getLine()));
        //   addLineOfOperatorToMap(UPDATE, ctx.start);
    }

    @Override
    public void enterFunction_argument(PlSqlParser.Function_argumentContext ctx) {
        programBlockData.addOperator(new Operator(FUNCTION_CALL, ctx.start.getLine()));
        // addLineOfOperatorToMap(FUNCTION_CALL, ctx.start);
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
    public void exitCreate_function_body(PlSqlParser.Create_function_bodyContext ctx) {
        if (programBlockData.getReturnType().equals(programBlockData.getVarrayTypeName())) {
            programBlockData.addVariable(new Variable(CUSTOM_VARRAY, "", RETURN_VARIABLE));
        } else if (programBlockData.getReturnType().equals(programBlockData.getRecordTypeName())) {
            programBlockData.addVariable(new Variable(CUSTOM_RECORD, "", RETURN_VARIABLE));
        } else {
            programBlockData.addVariable(new Variable(BUILT_IN, "", RETURN_VARIABLE));
        }
    }
    //TODO может вынести в класс данных?
   /* private void addLineOfOperatorToMap(OperatorType operatorType, Token token) {
        programBlockData.getOperatorLines().putIfAbsent(operatorType, new ArrayList<>());
        programBlockData.getOperatorLines().get(operatorType).add(token.getLine());
    }*/
}
