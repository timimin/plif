package plif.generator;

import plif.generator.generation.*;
import plif.generator.generation.specification.creator.MainSpecificationCreator;
import plif.generator.generation.specification.creator.ParametersSpecificationCreator;
import plif.generator.generation.specification.creator.TlaSpecificationCreator;

import java.io.File;
import java.util.Scanner;

public class Application {
    private static final String CONFERENCE_PATH ="src/main/resources/conference/programblocks";
    private static final String EDUCATIONAL_PATH ="src/main/resources/educational/process";
    public static void main(String[] args) {
 /*       Scanner scanner = new Scanner(System.in);
        System.out.println("Введите путь до папки с исходными данными:");//D:\JavaProjects\AntlrTesting\src\main\resources\programblocks
        String sourcePath = "D:\\JavaProjects\\AntlrTesting\\src\\main\\resources\\programblocks";//scanner.nextLine();
        System.out.println("Введите путь до папки, в которой будут располагаться сгенерированные спецификации:");//D:\JavaProjects\AntlrTesting\src\main\resources\spec
        String destinationPath = "D:\\JavaProjects\\AntlrTesting\\src\\main\\resources\\spec\\";//scanner.nextLine();
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
        System.out.println("На генерацию затрачено: " + (System.currentTimeMillis() - t) + " мс");*/
        Scanner scanner = new Scanner(System.in);
        System.out.println("Введите путь до папки с исходными данными:");//D:\JavaProjects\AntlrTesting\src\main\resources\programblocks

        String sourcePath = EDUCATIONAL_PATH;//scanner.nextLine();
        //String sourcePath = "src/main/resources/programblocks";//scanner.nextLine();
        System.out.println("Введите путь до папки, в которой будут располагаться сгенерированные спецификации:");//D:\JavaProjects\AntlrTesting\src\main\resources\spec
        String destinationPath = sourcePath + "/spec";//scanner.nextLine();
        //String destinationPath = "src/main/resources/spec";//scanner.nextLine();
        new Application().createSpecification(sourcePath, destinationPath);
    }

    public void createSpecification(String sourcePath, String destinationPath) {

        long t = System.currentTimeMillis();
        DatabaseSchema databaseSchema = new DatabaseSchema(sourcePath);
        ProgramBlocksDataHolder programBlocksDataHolder = new ProgramBlocksDataHolder(sourcePath, databaseSchema);
        TlaSpecificationCreator parametersSpecificationCreator = new ParametersSpecificationCreator(databaseSchema, programBlocksDataHolder);
        TlaSpecificationCreator mainSpecificationCreator = new MainSpecificationCreator(databaseSchema, programBlocksDataHolder);
        Thread parametersSpecThread = new Thread(() -> parametersSpecificationCreator.createSpecification(new File(destinationPath + File.separator + "Parameters.tla")));
        Thread mainSpecThread = new Thread(() -> mainSpecificationCreator.createSpecification(new File(destinationPath + File.separator + "Main.tla")));
        parametersSpecThread.start();
        mainSpecThread.start();
        try {
            mainSpecThread.join();
            parametersSpecThread.join();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        System.out.println("На генерацию затрачено: " + (System.currentTimeMillis() - t) + " мс");
    }
}