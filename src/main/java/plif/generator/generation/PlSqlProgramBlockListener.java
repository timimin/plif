package plif.generator.generation;

import plif.generator.generation.enums.OperatorType;
import plif.generator.generation.enums.ProgramBlockVariableType;
import plif.generator.generation.operator.*;
import org.antlr.v4.runtime.ParserRuleContext;
import org.antlr.v4.runtime.RuleContext;
import org.antlr.v4.runtime.tree.ParseTree;
import org.antlr.v4.runtime.tree.ParseTreeWalker;
import plif.generator.PlSqlParserBaseListener;

import java.util.*;

import static plif.generator.generation.enums.OperatorType.*;
import static plif.generator.generation.enums.OperatorType.EXIT;
import static plif.generator.generation.enums.OperatorType.IF;
import static plif.generator.generation.enums.OperatorType.INSERT;
import static plif.generator.generation.enums.OperatorType.RETURN;
import static plif.generator.generation.enums.OperatorType.UPDATE;
import static plif.generator.generation.enums.ProgramBlockType.FUNCTION;
import static plif.generator.generation.enums.ProgramBlockType.PROCEDURE;
import static plif.generator.generation.enums.ProgramBlockVariableType.*;
import static plif.generator.generation.enums.VariableType.*;
import static plif.generator.PlSqlParser.*;
import static plif.generator.util.CommonUtil.surroundWithQuotes;
import static plif.generator.util.extenstion.RuleContextExtension.getSpaceSeparatedText;

public class PlSqlProgramBlockListener extends PlSqlParserBaseListener {
    private final ProgramBlockData programBlockData;
    private final Map<Integer, InsertOperator> insertOperatorMap;
    private final Map<Integer, UpdateOperator> updateOperatorMap;
    private final Map<Integer, SelectIntoOperator> selectIntoOperatorMap;
    private final Map<Integer, IfOperator> ifOperatorMap;
    private final Map<Integer, ReturnOperator> returnOperatorMap;
    private final Map<Integer, ExceptionOperator> exceptionOperatorMap;
    private final DatabaseSchema databaseSchema;
    private final Map<Integer, Set<String>> relationalExpressionToLineMap;
    private final Map<Integer, Set<String>> dotReferencedColumnPolicies;
    private final Map<Integer, Set<String>> handledExceptions;

    public PlSqlProgramBlockListener(ProgramBlockData programBlockData, DatabaseSchema databaseSchema) {
        this.programBlockData = programBlockData;
        this.databaseSchema = databaseSchema;
        this.insertOperatorMap = new LinkedHashMap<>();
        this.updateOperatorMap = new LinkedHashMap<>();
        this.selectIntoOperatorMap = new LinkedHashMap<>();
        this.ifOperatorMap = new LinkedHashMap<>();
        this.returnOperatorMap = new LinkedHashMap<>();
        this.exceptionOperatorMap = new LinkedHashMap<>();
        this.relationalExpressionToLineMap = new LinkedHashMap<>();
        this.dotReferencedColumnPolicies = new LinkedHashMap<>();
        this.handledExceptions = new LinkedHashMap<>();
    }

    //TODO select from select не поддерживается
    @Override
    public void enterSelect_statement(Select_statementContext ctx) {
        if (selectNotInFromClause(ctx)) {
            int numberOfLine = ctx.start.getLine();
            SelectIntoOperator selectIntoOperator = new SelectIntoOperator(numberOfLine, getSpaceSeparatedText(ctx), programBlockData, SELECT_INTO);
            selectIntoOperatorMap.putIfAbsent(numberOfLine, selectIntoOperator);
            programBlockData.addOperator(numberOfLine, selectIntoOperator);
        }
    }

    @Override
    public void exitSelect_statement(Select_statementContext ctx) {
        if (selectNotInFromClause(ctx)) {
            int numberOfLine = ctx.start.getLine();
            SelectIntoOperator selectIntoOperator = selectIntoOperatorMap.get(numberOfLine);
            Set<String> policies = dotReferencedColumnPolicies.get(numberOfLine + 1);
            if (policies != null)
                policies.forEach(policy -> selectIntoOperator.getConditionalExpressions().add(policy));//Добавляем из условий политики столбцов, указанных через обращение точкой к таблице
        }
    }

    @Override
    public void enterInsert_statement(Insert_statementContext ctx) {
        int numberOfLine = ctx.start.getLine();
        InsertOperator insertOperator = new InsertOperator(numberOfLine, getSpaceSeparatedText(ctx), programBlockData, INSERT);
        insertOperatorMap.putIfAbsent(numberOfLine, insertOperator);
        programBlockData.addOperator(numberOfLine, insertOperator);
    }

    //FIXME обращение через точку к столбцам в предложении set не поддерживается
    @Override
    public void enterUpdate_statement(Update_statementContext ctx) {
        int numberOfLine = ctx.start.getLine();
        UpdateOperator updateOperator = new UpdateOperator(numberOfLine, getSpaceSeparatedText(ctx), programBlockData, UPDATE);
        updateOperatorMap.putIfAbsent(numberOfLine, updateOperator);
        programBlockData.addOperator(numberOfLine, updateOperator);
    }

    @Override
    public void exitUpdate_statement(Update_statementContext ctx) {
        int numberOfLine = ctx.start.getLine();
        UpdateOperator updateOperator = updateOperatorMap.get(numberOfLine);
        Set<String> policies = dotReferencedColumnPolicies.get(numberOfLine + 1);
        if (policies != null)
            policies.forEach(policy -> updateOperator.getConditionalExpressions().add(policy));//Добавляем из условий политики столбцов, указанных через обращение точкой к таблице
    }

    @Override
    public void enterColumn_based_update_set_clause(Column_based_update_set_clauseContext ctx) {
        UpdateOperator updateOperator = updateOperatorMap.get(ctx.start.getLine());
        updateOperator.getUpdatableColumnPolicies().add(updateOperator.getInvolvedTable().getColumnPolicy(ctx.column_name().getText()));
        updateOperator.getUpdatingExpressions().add(ctx.expression().getText());
    }

    private boolean selectNotInFromClause(Select_statementContext ctx) {//TODO уточнить проверяемый контекст
        RuleContext parent = ctx.parent;
        while (parent != null) {
            if (parent instanceof From_clauseContext) {
                return false;
            }
            parent = parent.parent;
        }
        return true;
    }

    /**
     * Условие where должно быть записано в одну строку, в следующей за оператором строке
     * (чтобы relational выражения where не путались с relational выражениями оператора)
     * example:
     * update table set col1=val1
     * where col1>val2
     */
    //TODO добавить поддержку сложных вложенных выражений
    @Override
    public void exitWhere_clause(Where_clauseContext ctx) {
        int numberOfLine = ctx.start.getLine();
        if (ctx.parent instanceof Update_statementContext) {//TODO вложенные запросы в update не поддерживаются
            UpdateOperator updateOperator = updateOperatorMap.get(numberOfLine - 1);
            relationalExpressionToLineMap.get(numberOfLine).forEach(conditionalExpression -> updateOperator.getConditionalExpressions().add(conditionalExpression));
        } else if (ctx.parent instanceof Query_blockContext) {//TODO проверить контекст
            //все предложение where основоного select записано в одну строку на следующей за ключевым словом select строке
            SelectIntoOperator selectIntoOperator = selectIntoOperatorMap.get(numberOfLine - 1);
            relationalExpressionToLineMap.get(numberOfLine).forEach(conditionalExpression -> selectIntoOperator.getConditionalExpressions().add(conditionalExpression));
        }
    }

    @Override
    public void enterRelational_expression(Relational_expressionContext ctx) {
        if (isSimpleRelationalExpression(ctx)) {
            int numberOfLine = ctx.start.getLine();
            relationalExpressionToLineMap.putIfAbsent(numberOfLine, new LinkedHashSet<>());
            relationalExpressionToLineMap.get(numberOfLine).add(ctx.getText());
        }
    }

    //TODO псевдонимы запрещены
    //TODO добавить этот метод в insert и update (where, set)

    //FIXME вложенные запросы должны быть в одну строку и в следующей за главным оператором (????)
    private boolean isSimpleRelationalExpression(Relational_expressionContext ctx) {//например a>b - relational_expression, где a и b relational_expression
        ParseTree child = ctx.getChildCount() == 1 ? ctx.getChild(0) : null;
        if (child == null)
            return false;
        while (child != null && child.getChildCount() != 0) {
            if (child.getChildCount() > 1) {
                ParseTreeWalker walker = new ParseTreeWalker();
                VariableListener variableListener = new VariableListener();
                walker.walk(variableListener, child);
                String columnPolicy = variableListener.columnPolicy;
                if (columnPolicy != null) {
                    int numberOfLine = ctx.start.getLine();
                    dotReferencedColumnPolicies.putIfAbsent(numberOfLine, new LinkedHashSet<>());
                    dotReferencedColumnPolicies.get(numberOfLine).add(columnPolicy);
                }
                return false;
            }
            child = child.getChild(0);
        }
        return true;
    }

    @Override
    public void enterArgument(ArgumentContext ctx) {// в bulk collect считаются аргументами функции
        if (isSelectListElementsArgument(ctx)) {
            SelectIntoOperator selectIntoOperator = selectIntoOperatorMap.get(ctx.start.getLine());
            selectIntoOperator.getSelectedExpressions().add(ctx.getText());
        }
    }

    private boolean isSelectListElementsArgument(ArgumentContext ctx) {
        RuleContext parent = ctx.parent;
        while (parent != null) {
            if (parent instanceof Select_list_elementsContext)
                return true;
            parent = parent.parent;
        }
        return false;
    }

    @Override
    public void enterSelect_list_elements(Select_list_elementsContext ctx) {
        if (isSimpleSelectListElements(ctx)) {
            SelectIntoOperator selectIntoOperator = selectIntoOperatorMap.get(ctx.start.getLine());
            if (selectIntoOperator != null) {
                selectIntoOperator.getSelectedExpressions().add(ctx.getText());
            } else {
                selectIntoOperator = selectIntoOperatorMap.get(ctx.start.getLine() - 1);//провалились в select в предложении where
                selectIntoOperator.getConditionalExpressions().add(ctx.getText());
            }
        }
    }

    private boolean isSimpleSelectListElements(Select_list_elementsContext ctx) {
        ParseTree child = ctx.getChildCount() == 1 ? ctx.getChild(0) : null;
        if (child == null)
            return false;
        while (child != null && child.getChildCount() != 0) {
            if (child.getChildCount() > 1) {
                return false;
            }
            child = child.getChild(0);
        }
        return true;
    }

    @Override
    public void enterInto_clause(Into_clauseContext ctx) {
        SelectIntoOperator selectIntoOperator = selectIntoOperatorMap.get(ctx.start.getLine());
        ctx.general_element().forEach(variable -> selectIntoOperator.getInsertedVariables().add(variable.getText()));
    }

    @Override
    public void enterGeneral_element_part(General_element_partContext ctx) {
        if (ctx.function_argument() != null && !isGeneralElementPartInSelectListElements(ctx)) {//если присутствуют аргументы функции (узел function_call появляется, если вызов функции идет без присваивания)
            int numberOfLine = ctx.start.getLine();
            FunctionCallOperator functionCallOperator = new FunctionCallOperator(numberOfLine, programBlockData, FUNCTION_CALL);
            functionCallOperator.setFunctionName(ctx.id_expression(0).getText());
            programBlockData.addOperator(numberOfLine, functionCallOperator);
        }
    }

    private boolean isGeneralElementPartInSelectListElements(General_element_partContext ctx) {
        RuleContext parent = ctx.parent;
        while (parent != null) {
            if (parent instanceof Select_list_elementsContext)
                return true;
            parent = parent.parent;
        }
        return false;
    }

    @Override
    public void exitAssignment_statement(Assignment_statementContext ctx) {
        int numberOfLine = ctx.start.getLine();
        SqlOperator sqlOperator = programBlockData.getOperators().get(numberOfLine);
        if (sqlOperator.getOperatorType() == FUNCTION_CALL) {
            FunctionCallOperator functionCallOperator = ((FunctionCallOperator) sqlOperator);
            functionCallOperator.setAssignableVariable(ctx.general_element().getText());
            relationalExpressionToLineMap.get(numberOfLine).forEach(functionArgument -> functionCallOperator.getFunctionArguments().add(functionArgument));
        }
    }

    @Override
    public void enterCreate_function_body(Create_function_bodyContext ctx) {
        programBlockData.setReturnType(ctx.type_spec().getText());
    }

    @Override
    public void enterBody(BodyContext ctx) {
        if (ctx.EXCEPTION() != null) {
            programBlockData.setNumberOfLineOfExceptionKeyWord(ctx.EXCEPTION().getSymbol().getLine());
        }
    }

    @Override
    public void enterProcedure_name(Procedure_nameContext ctx) {
        programBlockData.setProgramBlockType(PROCEDURE);
        programBlockData.setProgramBlockName(ctx.getText());
    }

    @Override
    public void enterFunction_name(Function_nameContext ctx) {
        programBlockData.setProgramBlockType(FUNCTION);
        programBlockData.setProgramBlockName(ctx.getText());
    }

    //TODO не нужно добавлять тип переменной? Поддерживать разные типы(записи, варреи) в параметрах
    @Override
    public void enterParameter_name(Parameter_nameContext ctx) {
        programBlockData.addVariable(new Variable(BUILT_IN, ctx.getText(), INPUT_PARAMETER));
    }

    @Override
    public void enterVariable_declaration(Variable_declarationContext ctx) {
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
    public void enterException_declaration(Exception_declarationContext ctx) {
        programBlockData.addVariable(new Variable(BUILT_IN, ctx.identifier().getText(), ProgramBlockVariableType.EXCEPTION));
    }

    @Override
    public void enterObject_member_spec(Object_member_specContext ctx) {
        programBlockData.setNumberOfColumnsInRecord(programBlockData.getNumberOfColumnsInRecord() + 1);
    }

    //Допускается 2 объявления типа в функции/процедуре, один - запись(AS OBJECT), другой - коллекция (AS VARRAY), не более одного каждого типа.
    @Override
    public void enterType_definition(Type_definitionContext ctx) {
        if (ctx.object_type_def().object_as_part().varray_type_def() != null) {
            programBlockData.setVarrayTypeName(ctx.type_name().getText());
        } else {
            programBlockData.setRecordTypeName(ctx.type_name().getText());
        }
    }

    @Override
    public void enterGeneral_table_ref(General_table_refContext ctx) {
        int numberOfLine = ctx.start.getLine();
        RuleContext parent = ctx.parent;
        if (parent instanceof Insert_into_clauseContext) {
            insertOperatorMap.get(numberOfLine).setInvolvedTable(databaseSchema.getTables().get(ctx.getText()));
        } else if (parent instanceof Update_statementContext) {
            updateOperatorMap.get(numberOfLine).setInvolvedTable(databaseSchema.getTables().get(ctx.getText()));
        }
    }

    @Override
    public void enterTable_ref_list(Table_ref_listContext ctx) {
        SelectIntoOperator selectIntoOperator = selectIntoOperatorMap.get(ctx.start.getLine());
        if (selectIntoOperator != null) {
            selectIntoOperator.setInvolvedTable(databaseSchema.getTables().get(ctx.getText()));// в from 1 таблица допустима
        }
    }

    //FIXME Выражения вида a+1 будут вноситься как a+1, вместо a и 1, перед этип требуется вынести a+1 в отдельную переменную
    @Override
    public void enterValues_clause(Values_clauseContext ctx) {
        InsertOperator insertOperator = insertOperatorMap.get(ctx.start.getLine());
        ctx.expressions().children.stream()
                .filter(expression -> expression.getChildCount() > 0)
                .forEach(expression -> insertOperator.getInsertedExpressions().add(expression.getText()));
    }

    @Override
    public void enterColumn_list(Column_listContext ctx) {
        if (ctx.parent instanceof Paren_column_listContext) {
            RuleContext parent = ctx.parent;
            if (parent.parent instanceof Insert_into_clauseContext) {
                InsertOperator insertOperator = insertOperatorMap.get(ctx.start.getLine());
                ctx.column_name().forEach(columnName -> insertOperator.addInvolvedColumnPolicy(columnName.getText()));
            }
        }
    }

    @Override
    public void exitInsert_statement(Insert_statementContext ctx) {
        InsertOperator insertOperator = insertOperatorMap.get(ctx.start.getLine());
        if (insertOperator.getInvolvedColumnsPolicies().isEmpty()) {
            insertOperator.getInvolvedColumnsPolicies().addAll(insertOperator.getInvolvedTable().getColumnPolicies());
        }
    }

    @Override
    public void enterIf_statement(If_statementContext ctx) {
        int numberOfStartCtxLine = ctx.start.getLine();
        IfOperator ifOperator = new IfOperator(numberOfStartCtxLine, "if " + getSpaceSeparatedText(ctx.condition()), programBlockData, IF);
        ifOperator.setNumberOfThenLine(ctx.seq_of_statements().start.getLine());
        ifOperator.setNumberOfElseLine(ctx.else_part().start.getLine());
        int numberOfEndCtxLine = ctx.stop.getLine();
        EndIfOperator endIfOperator = new EndIfOperator(numberOfEndCtxLine, programBlockData, END_IF);
        ifOperatorMap.putIfAbsent(numberOfStartCtxLine, ifOperator);
        programBlockData.addOperator(numberOfStartCtxLine, ifOperator);
        programBlockData.addOperator(numberOfEndCtxLine, endIfOperator);
    }

    @Override
    public void exitIf_statement(If_statementContext ctx) {
        int numberOfLine = ctx.start.getLine();
        IfOperator ifOperator = ifOperatorMap.get(numberOfLine);
        ParserRuleContext elseContext = ctx.else_part();
        if (elseContext != null) {
            int numberOfLineOfElseKeyWord = elseContext.start.getLine();
            SqlOperator sqlOperatorInElseClause = programBlockData.getOperators().get(numberOfLineOfElseKeyWord);
            if (sqlOperatorInElseClause != null) {
                sqlOperatorInElseClause.setHasElseKeyWordInThisLine(true);
            }
        }
        relationalExpressionToLineMap.get(numberOfLine).forEach(conditionalExpression -> ifOperator.getConditionalExpressions().add(conditionalExpression));
    }

    @Override
    public void enterReturn_statement(Return_statementContext ctx) {
        int numberOfLine = ctx.start.getLine();
        ReturnOperator returnOperator = new ReturnOperator(numberOfLine, getSpaceSeparatedText(ctx), programBlockData, RETURN);
        returnOperatorMap.putIfAbsent(numberOfLine, returnOperator);
        programBlockData.addOperator(numberOfLine, returnOperator);
    }

    @Override
    public void exitReturn_statement(Return_statementContext ctx) {
        int numberOfLine = ctx.start.getLine();
        ReturnOperator returnOperator = returnOperatorMap.get(numberOfLine);
        relationalExpressionToLineMap.get(numberOfLine).forEach(returnOperator::setReturnableVariableName);
    }

    @Override
    public void enterRaise_statement(Raise_statementContext ctx) {
        int numberOfLine = ctx.start.getLine();
        ExceptionOperator exceptionOperator = new ExceptionOperator(numberOfLine, getSpaceSeparatedText(ctx), programBlockData, OperatorType.EXCEPTION);//TODO какой queryCode должен быть
        exceptionOperator.setExceptionName(ctx.exception_name().getText());
        exceptionOperatorMap.putIfAbsent(numberOfLine, exceptionOperator);
        programBlockData.addOperator(numberOfLine, exceptionOperator);
    }

    @Override
    public void enterException_handler(Exception_handlerContext ctx) {
        int numberOfLine = ctx.start.getLine();
        handledExceptions.putIfAbsent(numberOfLine, new LinkedHashSet<>());
        ctx.exception_name().forEach(name -> handledExceptions.get(numberOfLine).add(name.getText()));
    }

    @Override
    public void exitCreate_procedure_body(Create_procedure_bodyContext ctx) {
        exitProgramBlock(ctx.stop.getLine());
    }

    @Override
    public void exitCreate_function_body(Create_function_bodyContext ctx) {
        if (programBlockData.getReturnType().equals(programBlockData.getVarrayTypeName())) {
            programBlockData.addVariable(new Variable(CUSTOM_VARRAY, "", RETURN_VARIABLE));
        } else if (programBlockData.getReturnType().equals(programBlockData.getRecordTypeName())) {
            programBlockData.addVariable(new Variable(CUSTOM_RECORD, "", RETURN_VARIABLE));
        } else {
            programBlockData.addVariable(new Variable(BUILT_IN, "", RETURN_VARIABLE));
        }
        exitProgramBlock(ctx.stop.getLine());
    }

    private void exitProgramBlock(int endLine) {
        programBlockData.getOperators().put(endLine, new ExitOperator(endLine, programBlockData, EXIT));
        exceptionOperatorMap.values().forEach(exceptionOperator -> exceptionOperator.setHandledExceptions(handledExceptions));
    }

    private class VariableListener extends PlSqlParserBaseListener {
        private String columnPolicy;

        @Override
        public void enterVariable_name(Variable_nameContext ctx) {
            if (columnPolicy == null) {
                if (ctx.getChildCount() != 1) {//обращение без точки
                    List<Id_expressionContext> expressions = ctx.id_expression();
                    Table table = databaseSchema.getTables().get(expressions.get(0).getText().toLowerCase());
                    if (table != null) {
                        columnPolicy = surroundWithQuotes(table.getColumnPolicy(expressions.get(1).getText()));
                    }
                }
            }
        }
    }
}