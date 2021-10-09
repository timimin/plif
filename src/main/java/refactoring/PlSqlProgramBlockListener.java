package refactoring;

import enums.OperatorType;
import enums.ProgramBlockVariableType;
import enums.VariableType;
import grammar.PlSqlParser;
import grammar.PlSqlParserBaseListener;
import org.antlr.v4.runtime.Token;

import java.util.ArrayList;

import static enums.OperatorType.*;
import static enums.ProgramBlockVariableType.*;
import static enums.VariableType.*;

public class PlSqlProgramBlockListener extends PlSqlParserBaseListener {
    private final ProgramBlockData programBlockData;

    public PlSqlProgramBlockListener(ProgramBlockData programBlockData) {
        this.programBlockData = programBlockData;
    }

    @Override
    public void enterSelect_statement(PlSqlParser.Select_statementContext ctx) {
        addLineOfOperatorToMap(SELECT, ctx.start);
    }

    @Override
    public void enterIf_statement(PlSqlParser.If_statementContext ctx) {
        addLineOfOperatorToMap(IF, ctx.start);
        addLineOfOperatorToMap(END_IF, ctx.stop);
    }

    @Override
    public void enterInsert_statement(PlSqlParser.Insert_statementContext ctx) {
        addLineOfOperatorToMap(INSERT, ctx.start);
    }

    @Override
    public void enterUpdate_statement(PlSqlParser.Update_statementContext ctx) {
        addLineOfOperatorToMap(UPDATE, ctx.start);
    }

    @Override
    public void enterFunction_argument(PlSqlParser.Function_argumentContext ctx) {
        addLineOfOperatorToMap(FUNCTION_CALL, ctx.start);
    }

    @Override
    public void enterCreate_function_body(PlSqlParser.Create_function_bodyContext ctx) {
        programBlockData.setReturnType(ctx.type_spec().getText());
    }

    @Override
    public void enterProcedure_name(PlSqlParser.Procedure_nameContext ctx) {
        programBlockData.setProgramBlockName(ctx.getText());
    }

    @Override
    public void enterFunction_name(PlSqlParser.Function_nameContext ctx) {
        programBlockData.setProgramBlockName(ctx.getText());
    }

    //TODO не нужно добавлять тип переменной?
    @Override
    public void enterParameter_name(PlSqlParser.Parameter_nameContext ctx) {
        addVariableToMap(INPUT_PARAMETER, BUILT_IN, ctx.getText());
    }

    @Override
    public void enterVariable_declaration(PlSqlParser.Variable_declarationContext ctx) {
        String typeName = ctx.type_spec().getText();
        if (typeName.equals(programBlockData.getRecordTypeName())) {
            addVariableToMap(LOCAL_VARIABLE, CUSTOM_RECORD, ctx.identifier().getText());
        } else if (typeName.equals(programBlockData.getVarrayTypeName())) {
            addVariableToMap(LOCAL_VARIABLE, CUSTOM_VARRAY, ctx.identifier().getText());
        } else {
            addVariableToMap(LOCAL_VARIABLE, BUILT_IN, ctx.identifier().getText());
        }
    }

    @Override
    public void enterException_declaration(PlSqlParser.Exception_declarationContext ctx) {
        addVariableToMap(EXCEPTION, BUILT_IN, ctx.identifier().getText());
    }

    @Override
    public void enterObject_member_spec(PlSqlParser.Object_member_specContext ctx) {
        programBlockData.setNumberOfColumnsInRecord(programBlockData.getNumberOfColumnsInRecord() + 1);
    }

    //TODO вход в правило varray_type_def?
    //Допускается 2 объявления типа в функции/процедуре, один - запись(AS OBJECT), другой - коллекция (AS VARRAY), не более одного каждого типа.
    @Override
    public void enterType_definition(PlSqlParser.Type_definitionContext ctx) {
        if (ctx.object_type_def().object_as_part().varray_type_def() != null) {
            programBlockData.setVarrayTypeName(ctx.type_name().getText());
        } else {
            programBlockData.setRecordTypeName(ctx.type_name().getText());
        }
    }

    //TODO может вынести в класс данных?
    private void addLineOfOperatorToMap(OperatorType operatorType, Token token) {
        programBlockData.getOperatorLines().putIfAbsent(operatorType, new ArrayList<>());
        programBlockData.getOperatorLines().get(operatorType).add(token.getLine());
    }

    private void addVariableToMap(ProgramBlockVariableType programBlockVariableType, VariableType variableType, String variableName) {
        Variable variable = new Variable(variableType, variableName);
        programBlockData.getVariableTypes().putIfAbsent(programBlockVariableType, new ArrayList<>());
        programBlockData.getVariableTypes().get(programBlockVariableType).add(variable);
    }
}
