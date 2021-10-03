package util;

public class CommonUtil {
    public static String getColumnPolicyName(String tableProperty, String columnName) {
        String tableName = tableProperty.substring(0, tableProperty.lastIndexOf("_"));
        return "col_" + tableName + "_" + columnName;
    }
}
