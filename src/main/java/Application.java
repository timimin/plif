import generation.*;
import generation.specification.creator.MainSpecificationCreator;
import generation.specification.creator.ParametersSpecificationCreator;
import generation.specification.creator.TlaSpecificationCreator;

import java.io.File;
import java.util.Scanner;

public class Application {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.println("Введите путь до папки с исходными данными:");//D:\JavaProjects\AntlrTesting\src\main\resources\programblocks
        String sourcePath = scanner.nextLine();
        System.out.println("Введите путь до папки, в которой будут располагаться сгенерированные спецификации:");//D:\JavaProjects\AntlrTesting\src\main\resources\spec
        String destinationPath = scanner.nextLine();
        long t = System.currentTimeMillis();
        DatabaseSchema databaseSchema = new DatabaseSchema(sourcePath);
        ProgramBlocksDataHolder programBlocksDataHolder = new ProgramBlocksDataHolder(sourcePath, databaseSchema);
        TlaSpecificationCreator parametersSpecificationCreator = new ParametersSpecificationCreator(databaseSchema, programBlocksDataHolder);
        TlaSpecificationCreator mainSpecificationCreator = new MainSpecificationCreator(databaseSchema, programBlocksDataHolder);
        Thread parametersSpecThread = new Thread(() -> parametersSpecificationCreator.createSpecification(new File(destinationPath + "Parameters.tla")));
        Thread mainSpecThread = new Thread(() -> mainSpecificationCreator.createSpecification(new File(destinationPath + "Main.tla")));
        parametersSpecThread.start();
        mainSpecThread.start();
        try {
            mainSpecThread.join();
            parametersSpecThread.join();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        System.out.println("На генерацию затрачено: " + (System.currentTimeMillis() - t) +" мс");
    }
}