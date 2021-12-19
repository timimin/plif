import generation.*;
import generation.specification.creator.MainSpecificationCreator;
import generation.specification.creator.ParametersSpecificationCreator;
import generation.specification.creator.TlaSpecificationCreator;

import java.io.File;

public class Application {
    public static void main(String[] args) {
        long t = System.currentTimeMillis();
        DatabaseSchema databaseSchema = new DatabaseSchema("D:\\JavaProjects\\AntlrTesting\\src\\main\\resources\\programblocks");
        ProgramBlocksDataHolder programBlocksDataHolder = new ProgramBlocksDataHolder("D:\\JavaProjects\\AntlrTesting\\src\\main\\resources\\programblocks", databaseSchema);
        System.out.println(programBlocksDataHolder.getProgramBlocksData().size());
        TlaSpecificationCreator parametersSpecificationCreator = new ParametersSpecificationCreator(databaseSchema, programBlocksDataHolder);
        TlaSpecificationCreator mainSpecificationCreator = new MainSpecificationCreator(databaseSchema, programBlocksDataHolder);
        parametersSpecificationCreator.createSpecification(new File("D:\\JavaProjects\\AntlrTesting\\src\\main\\resources\\programblocks\\ParametersFS.tla"));
        mainSpecificationCreator.createSpecification(new File("D:\\JavaProjects\\AntlrTesting\\src\\main\\resources\\programblocks\\ConferenceProcFS_final.tla"));
        System.out.println(System.currentTimeMillis() - t);
    }
}