package plif.generator.generation.operator;

import plif.generator.generation.ProgramBlockData;
import plif.generator.generation.enums.OperatorType;

import java.util.LinkedHashSet;
import java.util.Set;

import static plif.generator.util.CommonUtil.replaceEndOfString;
import static plif.generator.util.CommonUtil.surroundWithQuotes;
import static plif.generator.util.Constants.COMMA_WITH_LINE_BREAK;
import static plif.generator.util.OperatorUtil.appendConditionalExpressions;
import static plif.generator.util.OperatorUtil.getConditionalExpressionsTrace;

public class IfOperator extends SqlOperator {
    private Set<String> conditionalExpressions;
    private int numberOfThenLine;
    private int numberOfElseLine;

    {
        conditionalExpressions = new LinkedHashSet<>();
    }

    public IfOperator(int numberOfLineInProgramBlock, ProgramBlockData programBlockData, OperatorType operatorType) {
        super(numberOfLineInProgramBlock, programBlockData, operatorType);
    }

    public IfOperator(int numberOfLineInProgramBlock, String queryCode, ProgramBlockData programBlockData, OperatorType operatorType) {
        super(numberOfLineInProgramBlock, queryCode, programBlockData, operatorType);
    }

    @Override
    public String getOperatorRule() {
        StringBuilder operatorRule = new StringBuilder(getOperatorRuleNameWithId()).append(" ==\n/\\ if(id, LUB4Seq(<<\n ");
        appendConditionalExpressions(operatorRule, conditionalExpressions, programBlockData, involvedTable);
        replaceEndOfString(operatorRule, COMMA_WITH_LINE_BREAK, ">>),\n <<\n ");
        String programBlockName = programBlockData.getProgramBlockName();
        String ifDispatcherInterval = numberOfThenLine + "_" + numberOfElseLine;
        String quotedProgramBlockName = surroundWithQuotes(programBlockName);
        String unchangedVariablesInSkipBranch = " /\\ UNCHANGED <<StateE, New2Old, XLocks, VPol, SLocks, Ignore, Trace>>\n";
        String unchangedVariablesInIf = "/\\ UNCHANGED <<StateE, New2Old, XLocks, VPol, SLocks, Ignore>>\n\n";
        operatorRule
                .append(quotedProgramBlockName)//if правило
                .append(", ").append(surroundWithQuotes("lbl_" + ifDispatcherInterval)).append("\n >>)\n")
                .append(getTrace()).append(unchangedVariablesInIf)

                .append(programBlockName).append(ifDispatcherInterval).append("(id) ==\n\\/ /\\ skip(id, <<").append(quotedProgramBlockName) //диспетчер оператора if
                .append(", ").append(surroundWithQuotes("lbl_" + numberOfThenLine)).append(">>)\n")
                .append(unchangedVariablesInSkipBranch).append("\\/ /\\ skip(id, <<").append(quotedProgramBlockName).append(", ")
                .append(surroundWithQuotes("lbl_" + numberOfElseLine)).append(">>)\n").append(unchangedVariablesInSkipBranch).append("\n\n");
        System.out.println(programBlockData.getProgramBlockName() + " " + numberOfLineInProgramBlock + " " + queryCode);
        return operatorRule.toString();
    }

    @Override
    public String getOperatorDispatcherRule() {
        String ifDispatcherInterval = numberOfThenLine + "_" + numberOfElseLine;
        return "Head(st).pc[2] = " + getLabel() + " -> " + getOperatorRuleNameWithId() + "\n" +
                "[] Head(st).pc[2] = " + surroundWithQuotes("lbl_" + ifDispatcherInterval) + " -> "
                + programBlockData.getProgramBlockName() + ifDispatcherInterval + "(id)";
    }

    @Override
    protected String getTrace() {
        return "/\\ Trace' = Append(Trace,<<id,\n " + surroundWithQuotes(getOperatorRuleName()) + COMMA_WITH_LINE_BREAK +
                surroundWithQuotes(queryCode) + COMMA_WITH_LINE_BREAK + "[from |-> <<\n <<" +
                getConditionalExpressionsTrace(conditionalExpressions, programBlockData, involvedTable) +
                ">>\n >>" + COMMA_WITH_LINE_BREAK +
                "to |-> <<[policy |-> LUB4Seq(Sessions[id][\"PCLabel\"]), name |-> \"PCLabel\"]>>]>>)\n ";
    }

    public Set<String> getConditionalExpressions() {
        return conditionalExpressions;
    }

    public void setConditionalExpressions(Set<String> conditionalExpressions) {
        this.conditionalExpressions = conditionalExpressions;
    }

    public void setNumberOfThenLine(int numberOfThenLine) {
        this.numberOfThenLine = numberOfThenLine;
    }

    public void setNumberOfElseLine(int numberOfElseLine) {
        this.numberOfElseLine = numberOfElseLine;
    }
}