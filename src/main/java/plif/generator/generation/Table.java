package plif.generator.generation;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

public class Table {
    private final String tableName;
    private final Map<String, Column> columns;

    {
        columns = new LinkedHashMap<>();
    }

    public Table(String tableName) {
        this.tableName = tableName;
    }

    public String getTableName() {
        return tableName;
    }

    public Map<String, Column> getColumns() {
        return columns;
    }

    public void addColumn(String columnName, String columnType) {
        Column column = new Column(columnName, columnType);
        column.columnPolicy = "col_" + tableName + "_" + columnName;
        columns.put(columnName, column);

    }

    public List<String> getColumnPolicies() {
        return columns.values().stream().map(Column::getColumnPolicy).collect(Collectors.toList());
    }

    public String getColumnPolicy(String columnName) {
        Column column = columns.get(columnName);
        return column != null ? column.getColumnPolicy() : null;
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
            return "{columnName= " + columnName + ", columnType= " + columnType + "}";
        }
    }
}