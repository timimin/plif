package refactoring.specification.creator;

import java.io.File;

@FunctionalInterface
public interface TlaSpecificationCreator {
    void createSpecification(File file);
}