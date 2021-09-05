package myImplementation;

import grammar.PlSqlParser;
import grammar.PlSqlParserBaseListener;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import static grammar.PlSqlParser.Create_procedure_bodyContext;
import static myImplementation.VariableType.RETURN_VARIABLE;
import static util.ParametersSpecificationUtil.writePolicies;
import static util.ParametersSpecificationUtil.writeVariablePolicy;

//Тип коллекции определяется через AS OBJECT(C1 C1_TYPE,... CN CN_TYPE)
//TODO убрать хардкод, перенести файлы в поля класса или параметры методов
public class PlSqlProgramBlockListener extends PlSqlParserBaseListener {
    private final List<String> parameters;
    private final List<String> localVariables;
    private final List<String> exceptions;
    private final List<String> returns;
    private String programBlockName;
    private File parametersSpecification;
    private int numberOfColumnsInVarrayType;
    private String varrayTypeName;

    {
        parameters = new ArrayList<>();
        localVariables = new ArrayList<>();
        exceptions = new ArrayList<>();
        returns = new ArrayList<>();
    }

    public PlSqlProgramBlockListener() {
        this.parametersSpecification = new File("gen/tla/ParametersFS.tla");
    }

    public PlSqlProgramBlockListener(String filePath) {
        this.parametersSpecification = new File(filePath);
    }

    @Override
    public void exitCreate_procedure_body(Create_procedure_bodyContext ctx) {
        writePolicies(parametersSpecification, programBlockName, parameters, localVariables, exceptions, true);
    }

    @Override
    public void exitCreate_function_body(PlSqlParser.Create_function_bodyContext ctx) {
        int offset = writePolicies(parametersSpecification, programBlockName, parameters, localVariables, exceptions, false);
        try (BufferedWriter returnWriter = new BufferedWriter(new FileWriter(parametersSpecification, true))) {
            writeVariablePolicy(returnWriter, returns, RETURN_VARIABLE, programBlockName, offset);
            returnWriter.write('\n');
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void enterProcedure_name(PlSqlParser.Procedure_nameContext ctx) {
        this.programBlockName = ctx.getText();
    }

    @Override
    public void enterFunction_name(PlSqlParser.Function_nameContext ctx) {
        this.programBlockName = ctx.getText();
    }

    @Override
    public void enterParameter_name(PlSqlParser.Parameter_nameContext ctx) {
        this.parameters.add(ctx.getText());
    }

    @Override
    public void enterVariable_declaration(PlSqlParser.Variable_declarationContext ctx) {
        this.localVariables.add(ctx.identifier().getText());
    }

    @Override
    public void enterException_declaration(PlSqlParser.Exception_declarationContext ctx) {
        this.exceptions.add(ctx.identifier().getText());
    }

    @Override
    public void enterReturn_statement(PlSqlParser.Return_statementContext ctx) {
        this.returns.add(ctx.expression().getText());
    }

    @Override
    public void enterObject_member_spec(PlSqlParser.Object_member_specContext ctx) {
        numberOfColumnsInVarrayType++;
    }

    @Override
    public void enterType_definition(PlSqlParser.Type_definitionContext ctx) {
        if (ctx.getChild(1).getChild(0).getChild(1).getText().startsWith("VARRAY")) {
            varrayTypeName = ctx.getChild(0).getText();
        }
    }
}

