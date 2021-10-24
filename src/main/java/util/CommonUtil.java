package util;

import java.io.File;

import static util.Constants.END_OF_MODULE_DECLARATION;
import static util.Constants.START_OF_MODULE_DECLARATION;

public class CommonUtil {
    public static String getColumnPolicyName(String tableProperty, String columnName) {
        String tableName = tableProperty.substring(0, tableProperty.lastIndexOf("_"));
        return "col_" + tableName + "_" + columnName;
    }

    public static String getFileNameWithoutExtension(File file) {
        String fileName = file.getName();
        return fileName.substring(0, fileName.indexOf('.'));
    }

    public static String getModuleDeclarationLine(File file) {
        return START_OF_MODULE_DECLARATION + getFileNameWithoutExtension(file) + END_OF_MODULE_DECLARATION;
    }
}
