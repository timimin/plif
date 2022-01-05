import generation.*;
import generation.specification.creator.MainSpecificationCreator;
import generation.specification.creator.ParametersSpecificationCreator;
import generation.specification.creator.TlaSpecificationCreator;

import java.io.File;

public class Application {
    public static void main(String[] args) {
        long t = System.currentTimeMillis();
        DatabaseSchema databaseSchema = new DatabaseSchema("L:\\Диплом\\Работа над ВКР\\Проверка прототипа утилиты\\programblocks");
        ProgramBlocksDataHolder programBlocksDataHolder = new ProgramBlocksDataHolder("L:\\Диплом\\Работа над ВКР\\Проверка прототипа утилиты\\programblocks", databaseSchema);
        System.out.println(programBlocksDataHolder.getProgramBlocksData().size());
        TlaSpecificationCreator parametersSpecificationCreator = new ParametersSpecificationCreator(databaseSchema, programBlocksDataHolder);
        TlaSpecificationCreator mainSpecificationCreator = new MainSpecificationCreator(databaseSchema, programBlocksDataHolder);
        Thread parametersSpecThread = new Thread(() -> parametersSpecificationCreator.createSpecification(new File("D:\\JavaProjects\\AntlrTesting\\src\\main\\resources\\programblocks\\ParametersFS.tla")));
        Thread mainSpecThread = new Thread(() -> mainSpecificationCreator.createSpecification(new File("D:\\JavaProjects\\AntlrTesting\\src\\main\\resources\\programblocks\\ConferenceProcFS_final.tla")));
        parametersSpecThread.start();
        mainSpecThread.start();
        try {
            mainSpecThread.join();
            parametersSpecThread.join();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        System.out.println(System.currentTimeMillis() - t);
    }
}