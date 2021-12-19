package generation;

import util.LinkedProperties;

import java.io.*;
import java.util.*;

import static util.CommonUtil.getFileNameWithoutExtension;

public class DatabaseSchema {
    private final Map<String, Table> tables;

    public DatabaseSchema(String sourceDirectory) {
        tables = new LinkedHashMap<>();
        initializeSchema(sourceDirectory);
    }

    private void initializeSchema(String sourceDirectory) {
        File tablePropertiesDirectory = new File(sourceDirectory + File.separator + "tables");//для таблиц
        for (File tablePropertyFile : Objects.requireNonNull(tablePropertiesDirectory.listFiles())) {
            String tableName = getFileNameWithoutExtension(tablePropertyFile);
            Table table = new Table(tableName);
            try (InputStream inputStream = new FileInputStream(tablePropertyFile)) {
                Properties tableProperties = new LinkedProperties();
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
}