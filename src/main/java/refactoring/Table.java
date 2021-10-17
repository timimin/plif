package refactoring;

import java.util.ArrayList;
import java.util.List;

public class Table {
    private final String tableName;
    private final List<Column> columns;

    {
        columns = new ArrayList<>();
    }

    public Table(String tableName) {
        this.tableName = tableName;
    }

    public String getTableName() {
        return tableName;
    }

    public List<Column> getColumns() {
        return columns;
    }

    public void addColumn(String columnName, String columnType) {
        Column column = new Column(columnName, columnType);
        column.columnPolicy = "col_" + tableName + "_" + columnName;
        columns.add(column);

    }

    @Override
    public String toString() {
        return "Table(" + "tableName=" + tableName + ", columns=" + columns + ')';
    }

    // TODO разобраться с внутренними классами!!
    static class Column {
        String columnName;
        String columnType;
        String columnPolicy;

        public Column(String columnName, String columnType) {
            this.columnName = columnName;
            this.columnType = columnType;
        }

        public String getColumnName() {
            return columnName;
        }

        public String getColumnType() {
            return columnType;
        }

        public String getColumnPolicy() {
            return columnPolicy;
        }

        @Override
        public String toString() {
            return "columnName= " + columnName + ", columnType= " + columnType;
        }
    }
}