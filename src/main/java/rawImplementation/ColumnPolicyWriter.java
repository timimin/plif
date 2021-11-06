package rawImplementation;

import java.io.*;
import java.util.Map;
import java.util.Properties;
import java.util.TreeMap;

import static util.CommonUtil.getColumnPolicyName;

//TODO  может вынести в класс утил, т.к. только статик методы?
//TODO убрать хардкод, перенести файлы в поля класса или параметры методов
public class ColumnPolicyWriter {
    //Записывает минимальную политику для столбцов таблиц в файл ParametersFS
    public static void writeColumnPolicy() {
        Properties properties = new Properties();
        File parameters = new File("gen/tla/ParametersFS.tla");
        String minColumnPolicy = " == [loc|->\"persistence\", policy |-> min]";
        try (InputStream propertiesSource = Thread.currentThread().getContextClassLoader().getResourceAsStream("programblocks/properties/ParametersFS.properties");
             BufferedWriter columnPolicyWriter = new BufferedWriter(new FileWriter(parameters))) {
            properties.load(propertiesSource);
            Map<String, String> sortedProperties = new TreeMap<>();
            properties.keySet().forEach(key -> sortedProperties.put(key.toString(), properties.getProperty(key.toString())));
            for (String key : sortedProperties.keySet()) {
                columnPolicyWriter.write(getColumnPolicyName(key, properties.getProperty(key)) + minColumnPolicy + "\n");
            }
            columnPolicyWriter.write("\n");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}