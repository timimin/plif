package plif.generator.antlr4;

import org.antlr.v4.runtime.*;

public abstract class PlSqlLexerBase extends Lexer {
    public PlSqlLexerBase self;

    public PlSqlLexerBase(CharStream input) {
        super(input);
        self = this;
    }

    public boolean IsNewlineAtPos(int pos) {
        int la = _input.LA(pos);
        return la == -1 || la == '\n';
    }
}