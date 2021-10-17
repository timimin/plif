package refactoring;

import java.util.List;

public class Table {
    String tableName;
    List<String> columns;

    public Table(String tableName) {
        this.tableName = tableName;
    }
}