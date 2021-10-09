package myImplementation;

import grammar.PlSqlParser;
import grammar.PlSqlParserBaseListener;

import java.io.File;

import static enums.VariableType.CUSTOM_RECORD;
import static enums.VariableType.CUSTOM_VARRAY;
import static enums.ProgramBlockVariableType.*;
import static util.ParametersSpecificationUtil.writeLineBreak;
import static util.ParametersSpecificationUtil.writeVariablePolicy;

//Тип коллекции определяется через AS OBJECT(C1 C1_TYPE,... CN CN_TYPE)
//TODO убрать хардкод, перенести файлы в поля класса или параметры методов
public class PlSqlProgramBlockListener extends PlSqlParserBaseListener {
    private String programBlockName;
    private File parametersSpecification;
    private int numberOfColumnsInRecord;
    private String varrayTypeName;
    private String recordTypeName;
    private String returnType;
    private int offset;

    public PlSqlProgramBlockListener() {
        this.parametersSpecification = new File("gen/tla/ParametersFS.tla");
    }

    public PlSqlProgramBlockListener(String filePath) {
        this.parametersSpecification = new File(filePath);
    }

    @Override
    public void enterCreate_function_body(PlSqlParser.Create_function_bodyContext ctx) {
        returnType = ctx.type_spec().getText();
    }

    @Override
    public void exitCreate_procedure_body(PlSqlParser.Create_procedure_bodyContext ctx) {
        writeLineBreak(parametersSpecification);
    }

    @Override
    public void exitCreate_function_body(PlSqlParser.Create_function_bodyContext ctx) {
        if (returnType.equals(recordTypeName)) {
            offset = writeVariablePolicy(parametersSpecification, "", RETURN_VARIABLE, CUSTOM_RECORD, programBlockName, offset, numberOfColumnsInRecord);
        } else if (returnType.equals(varrayTypeName)) {
            offset = writeVariablePolicy(parametersSpecification, "", RETURN_VARIABLE, CUSTOM_VARRAY, programBlockName, offset, numberOfColumnsInRecord);
        } else {
            writeVariablePolicy(parametersSpecification, "", RETURN_VARIABLE, programBlockName, offset);
        }
        writeLineBreak(parametersSpecification);
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
        writeVariablePolicy(parametersSpecification, ctx.getText(), INPUT_PARAMETER, programBlockName, offset);
        offset++;
    }

    @Override
    public void enterVariable_declaration(PlSqlParser.Variable_declarationContext ctx) {
        String typeName = ctx.type_spec().getText();
        if (typeName.equals(recordTypeName)) {
            offset = writeVariablePolicy(parametersSpecification, ctx.identifier().getText(), LOCAL_VARIABLE, CUSTOM_RECORD, programBlockName, offset, numberOfColumnsInRecord);
        } else if (typeName.equals(varrayTypeName)) {
            offset = writeVariablePolicy(parametersSpecification, ctx.identifier().getText(), LOCAL_VARIABLE, CUSTOM_VARRAY, programBlockName, offset, numberOfColumnsInRecord);
        } else {
            writeVariablePolicy(parametersSpecification, ctx.identifier().getText(), LOCAL_VARIABLE, programBlockName, offset);
            offset++;
        }
    }

    @Override
    public void enterException_declaration(PlSqlParser.Exception_declarationContext ctx) {
        writeVariablePolicy(parametersSpecification, ctx.identifier().getText(), EXCEPTION, programBlockName, offset);
        offset++;
    }

    @Override
    public void enterObject_member_spec(PlSqlParser.Object_member_specContext ctx) {
        numberOfColumnsInRecord++;
    }

    //Допускается 2 объявления типа в функции/процедуре, один - запись(AS OBJECT), другой - коллекция (AS VARRAY), не более одного каждого типа.
    @Override
    public void enterType_definition(PlSqlParser.Type_definitionContext ctx) {
        if (ctx.object_type_def().object_as_part().varray_type_def() != null) {
            varrayTypeName = ctx.type_name().getText();
        } else {
            recordTypeName = ctx.type_name().getText();
        }
    }
}

