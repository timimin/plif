package myImplementation;

import grammar.PlSqlParserBaseListener;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import static grammar.PlSqlParser.Create_procedure_bodyContext;
import static myImplementation.VariableType.LOCAL_VARIABLE;
import static myImplementation.VariableType.PROCEDURE_PARAMETER;
import static util.ParametersSpecificationUtil.*;

//TODO убрать хардкод, перенести файлы в поля класса или параметры методов
public class PlSqlProcedureListener extends PlSqlParserBaseListener {
    private final List<String> procedureParameters;
    private final List<String> procedureLocalVariables;
    private final List<String> procedureExceptions;
    private String procedureName;

    {
        procedureParameters = new ArrayList<>();
        procedureLocalVariables = new ArrayList<>();
        procedureExceptions = new ArrayList<>();
    }

    @Override
    public void enterCreate_procedure_body(Create_procedure_bodyContext ctx) {
        procedureName = ctx.procedure_name().getText();
        var procedureParameters = ctx.parameter();
        for (var parameter : procedureParameters) {
            this.procedureParameters.add(parameter.parameter_name().getText());
        }
        var declarationBlock = ctx.seq_of_declare_specs();
        if (declarationBlock != null) {
            var procedureLocalVariables = declarationBlock.declare_spec();
            for (var localVariable : procedureLocalVariables) {
                this.procedureLocalVariables.add(localVariable.variable_declaration().identifier().getText());
            }
        }
    }

    @Override
    public void exitCreate_procedure_body(Create_procedure_bodyContext ctx) {
        System.out.println(procedureParameters);
        System.out.println(procedureLocalVariables);
        File parameters = new File("gen/tla/ParametersFS.tla");
        try (BufferedWriter procedureParametersPolicyWriter = new BufferedWriter(new FileWriter(parameters, true))) {
            writeVariablePolicy(procedureParametersPolicyWriter, procedureParameters, PROCEDURE_PARAMETER, procedureName, 0);
            writeVariablePolicy(procedureParametersPolicyWriter, procedureLocalVariables, LOCAL_VARIABLE, procedureName, procedureParameters.size());
            procedureParametersPolicyWriter.write("\n");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}

