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
import static myImplementation.VariableType.*;
import static util.ParametersSpecificationUtil.*;

//TODO убрать хардкод, перенести файлы в поля класса или параметры методов
public class PlSqlProcedureListener extends PlSqlParserBaseListener {
    private final List<String> procedureParameters;
    private final List<String> procedureLocalVariables;
    private final List<String> procedureExceptions;
    private String procedureName;
    private File parametersSpecification;

    {
        procedureParameters = new ArrayList<>();
        procedureLocalVariables = new ArrayList<>();
        procedureExceptions = new ArrayList<>();
    }

    public PlSqlProcedureListener() {
        this.parametersSpecification = new File("gen/tla/ParametersFS.tla");
    }

    public PlSqlProcedureListener(String filePath) {
        this.parametersSpecification = new File(filePath);
    }

    @Override
    public void enterCreate_procedure_body(Create_procedure_bodyContext ctx) {
    }

    @Override
    public void exitCreate_procedure_body(Create_procedure_bodyContext ctx) {
        System.out.println(procedureParameters);
        System.out.println(procedureLocalVariables);
        try (BufferedWriter procedureParametersPolicyWriter = new BufferedWriter(new FileWriter(parametersSpecification, true))) {
            writeVariablePolicy(procedureParametersPolicyWriter, procedureParameters, PROCEDURE_PARAMETER, procedureName, 0);
            writeVariablePolicy(procedureParametersPolicyWriter, procedureLocalVariables, LOCAL_VARIABLE, procedureName, procedureParameters.size());
            writeVariablePolicy(procedureParametersPolicyWriter, procedureExceptions, EXCEPTION, procedureName, procedureParameters.size() + procedureLocalVariables.size());
            procedureParametersPolicyWriter.write("\n");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void enterProcedure_name(PlSqlParser.Procedure_nameContext ctx) {
        procedureName = ctx.getText();
    }

    @Override
    public void enterParameter_name(PlSqlParser.Parameter_nameContext ctx) {
        this.procedureParameters.add(ctx.getText());
    }

    //TODO для локальных переменных и возвращаемого значения минимальную политику 
    @Override
    public void enterVariable_declaration(PlSqlParser.Variable_declarationContext ctx) {
        this.procedureLocalVariables.add(ctx.identifier().getText());
    }

    @Override
    public void enterException_declaration(PlSqlParser.Exception_declarationContext ctx) {
        this.procedureExceptions.add(ctx.identifier().getText());
    }
}

