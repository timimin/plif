import refactoring.DatabaseSchema;
import refactoring.ParametersSpecificationCreator;
import refactoring.ProgramBlocksDataHolder;

import java.io.File;

public class Application {
    public static void main(String[] args) {
        DatabaseSchema databaseSchema = new DatabaseSchema("D:\\JavaProjects\\AntlrTesting\\src\\main\\resources\\programblocks");
        ProgramBlocksDataHolder programBlocksDataHolder = new ProgramBlocksDataHolder("D:\\JavaProjects\\AntlrTesting\\src\\main\\resources\\programblocks", databaseSchema);
        System.out.println(programBlocksDataHolder.getProgramBlocksData().size());
        ParametersSpecificationCreator parametersSpecificationCreator = new ParametersSpecificationCreator(databaseSchema, programBlocksDataHolder);
        parametersSpecificationCreator.createSpecification(new File("D:\\JavaProjects\\AntlrTesting\\src\\main\\resources\\programblocks\\param.tla"));
    }
}