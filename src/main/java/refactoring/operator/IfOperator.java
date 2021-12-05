package refactoring.operator;

import refactoring.ProgramBlockData;
import refactoring.enums.OperatorType;

import java.util.LinkedHashSet;
import java.util.Set;

import static util.CommonUtil.replaceEndOfString;
import static util.CommonUtil.surroundWithQuotes;
import static util.Constants.COMMA_WITH_LINE_BREAK;
import static util.Constants.UNCHANGED_TRACE;
import static util.OperatorUtil.appendConditionalExpressions;

public class IfOperator extends AbstractSqlOperator {
    private Set<String> conditionalExpressions;
    private int numberOfThenLine;
    private int numberOfElseLine;

    {
        conditionalExpressions = new LinkedHashSet<>();
    }

    public IfOperator(int numberOfLineInProgramBlock, ProgramBlockData programBlockData, OperatorType operatorType) {
        super(numberOfLineInProgramBlock, programBlockData, operatorType);
    }

    @Override
    public String getOperatorRule() {
        StringBuilder operatorRule = new StringBuilder(getOperatorRuleName()).append(" ==\n/\\ if(id, LUB4Seq(<<\n ");
        appendConditionalExpressions(operatorRule, conditionalExpressions, programBlockData, null);
        replaceEndOfString(operatorRule, COMMA_WITH_LINE_BREAK, ">>),\n <<\n ");
        String programBlockName = programBlockData.getProgramBlockName();
        String ifDispatcherInterval = numberOfThenLine + "_" + numberOfElseLine;
        String quotedProgramBlockName = surroundWithQuotes(programBlockName);
        String unchangedVariablesInSkipBranch = " /\\ UNCHANGED <<StateE, New2Old, XLocks, VPol, SLocks, Ignore, Trace>>\n";
        String unchangedVariablesInIf = "/\\ UNCHANGED <<StateE, New2Old, XLocks, VPol, SLocks, Ignore>>\n\n";
        operatorRule
                .append(quotedProgramBlockName)//if правило
                .append(", ").append(surroundWithQuotes("lbl_" + ifDispatcherInterval)).append("\n >>)\n")
                .append(UNCHANGED_TRACE).append(unchangedVariablesInIf)

                .append(programBlockName).append(ifDispatcherInterval).append("(id) ==\n\\/ /\\ skip(id, <<").append(quotedProgramBlockName) //диспетчер оператора if
                .append(", ").append(surroundWithQuotes("lbl_" + numberOfThenLine)).append(">>)\n")
                .append(unchangedVariablesInSkipBranch).append("\\/ /\\ skip(id, <<").append(quotedProgramBlockName).append(", ")
                .append(surroundWithQuotes("lbl_" + numberOfElseLine)).append(">>)\n").append(unchangedVariablesInSkipBranch).append("\n\n");
        return operatorRule.toString();
    }

    @Override
    public String getOperatorDispatcherRule() {
        String ifDispatcherInterval = numberOfThenLine + "_" + numberOfElseLine;
        return "Head(st).pc[2] = " + getLabel() + " -> " + getOperatorRuleName() + "\n" +
                "[] Head(st).pc[2] = " + surroundWithQuotes("lbl_" + ifDispatcherInterval) + " -> "
                + programBlockData.getProgramBlockName() + ifDispatcherInterval + "(id)";
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