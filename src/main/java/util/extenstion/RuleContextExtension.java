package util.extenstion;

import org.antlr.v4.runtime.RuleContext;
import org.antlr.v4.runtime.tree.ParseTree;
import org.antlr.v4.runtime.tree.TerminalNode;

public class RuleContextExtension {
    public static String getSpaceSeparatedText(RuleContext ruleContext) {
        return getTextSpaceSeparatedWithTrailingSpace(ruleContext).trim();
    }

    private static String getTextSpaceSeparatedWithTrailingSpace(RuleContext ruleContext) {
        if (ruleContext.getChildCount() == 0) {
            return "";
        } else {
            StringBuilder builder = new StringBuilder();
            for (int i = 0; i < ruleContext.getChildCount(); ++i) {
                ParseTree childContext = ruleContext.getChild(i);
                builder.append(childContext instanceof RuleContext ? getTextSpaceSeparatedWithTrailingSpace((RuleContext) childContext) : childContext.getText());
                if (childContext instanceof TerminalNode)
                    builder.append(' ');
            }
            return builder.toString();
        }
    }
}