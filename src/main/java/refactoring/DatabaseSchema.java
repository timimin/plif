package refactoring;

import java.io.*;
import java.util.*;

public class DatabaseSchema {
    private final Map<String, Table> tables;

    public DatabaseSchema(String sourceDirectory) {
        tables = new HashMap<>();
        initializeSchema(sourceDirectory);
    }

    private void initializeSchema(String sourceDirectory) {
        File tablePropertiesDirectory = new File(sourceDirectory + File.separator + "tables");//для таблиц
        for (File tablePropertyFile : Objects.requireNonNull(tablePropertiesDirectory.listFiles())) {
            String tablePropertyFileName = tablePropertyFile.getName();
            String tableName = tablePropertyFileName.substring(0, tablePropertyFileName.indexOf('.'));
            Table table = new Table(tableName);
            try (InputStream inputStream = new FileInputStream(tablePropertyFile)) {
                Properties tableProperties = new Properties();
                tableProperties.load(inputStream);
                tableProperties.keySet().forEach(key -> table.addColumn(key.toString(), tableProperties.getProperty(key.toString())));
                tables.put(tableName, table);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    public Map<String, Table> getTables() {
        return tables;
    }

    @Override
    public String toString() {
        return "DatabaseSchema: " + tables;
    }

    public static void main(String[] args) {
        DatabaseSchema databaseSchema = new DatabaseSchema("L:\\");
        System.out.println();
    }
}