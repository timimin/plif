package refactoring.operator;

import refactoring.ProgramBlockData;
import refactoring.Variable;
import refactoring.enums.OperatorType;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

import static util.CommonUtil.loadVariablePolicies;
import static util.CommonUtil.surroundWithQuotes;
import static util.Constants.UNCHANGED_TRACE;
import static util.OperatorUtil.appendNextRuleLabel;

public class ExceptionOperator extends SqlOperator {
    private Map<Integer, Set<String>> handledExceptions;
    private String exceptionName;

    private int lineHandlingException;

    {
        handledExceptions = new LinkedHashMap<>();
    }

    public ExceptionOperator(int numberOfLineInProgramBlock, ProgramBlockData programBlockData, OperatorType operatorType) {
        super(numberOfLineInProgramBlock, programBlockData, operatorType);
    }

    @Override
    public String getOperatorRule() {
        Variable exceptionVariable = programBlockData.getVariables().get(exceptionName);
        if (exceptionVariable == null)//случай если выбрасывается библиотченое исключение, не объявленное в программном блоке
            return "";
        List<Integer> linesHandlingThisException = handledExceptions.keySet().stream()
                .filter(numberOfLine -> handledExceptions.get(numberOfLine).contains(exceptionName)).collect(Collectors.toList());//исключение не должно обрабатываться дважды
        if (linesHandlingThisException.size() > 1) {
            throw new IllegalStateException("Одно и то же исключение обрабатывается дважды");
        }
        int numberOfLineHandlingException = linesHandlingThisException.get(0);
        if (lineHandlingException == 0) {
            lineHandlingException = numberOfLineHandlingException;
        }
        StringBuilder operatorRule = new StringBuilder(getOperatorRuleName()).append(" ==\n/\\ skip(id, <<");
        String quotedProgramBlockName = surroundWithQuotes(programBlockData.getProgramBlockName());
        //диспетчер исключения - после выбрасывания(raise) переходит к правилу обработки when Exception
        operatorRule.append(quotedProgramBlockName).append(", ").append(surroundWithQuotes("lbl_" + numberOfLineHandlingException))
                .append(">>)\n/\\ UNCHANGED  <<StateE, New2Old, XLocks, VPol, SLocks, Ignore, Trace>>\n\n");
        operatorRule.append(programBlockData.getProgramBlockName()).append(numberOfLineHandlingException).append("(id) ==\n/\\ whenexc(id, ");//само правило обработки исключения
        loadVariablePolicies(operatorRule, exceptionVariable);
        operatorRule.append("<<\n ");
        appendNextRuleLabel(operatorRule, programBlockData, numberOfLineHandlingException);
        operatorRule.append("\n >>)\n").append(UNCHANGED_TRACE).append("/\\ UNCHANGED  <<StateE, New2Old, XLocks, VPol, SLocks, Ignore>>\n\n");
        return operatorRule.toString();
    }

    @Override
    public String getOperatorDispatcherRule() {
        return "Head(st).pc[2] = " + getLabel() + " -> " + getOperatorRuleName() + "\n" +
                "[] Head(st).pc[2] = " + surroundWithQuotes("lbl_" + lineHandlingException) + " -> "
                + programBlockData.getProgramBlockName() + lineHandlingException + "(id)";
    }

    public void setHandledExceptions(Map<Integer, Set<String>> handledExceptions) {
        this.handledExceptions = handledExceptions;
    }

    public void setExceptionName(String exceptionName) {
        this.exceptionName = exceptionName;
    }
}