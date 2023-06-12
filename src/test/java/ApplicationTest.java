import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.Timeout;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.ValueSource;
import plif.generator.Application;

import java.io.*;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.Comparator;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

public class ApplicationTest {
    private static final String CONFERENCE_PATH = "src/test/resources/conference/programblocks";
    private static final String EDUCATIONAL_PATH = "src/test/resources/educational/process";

    @AfterAll
    public static void deletedCreated() {
        List.of(CONFERENCE_PATH, EDUCATIONAL_PATH).forEach(stringPath -> {
            Path path = Path.of(stringPath + "/generated");
            try (var s = Files.walk(path)) {
                s.sorted(Comparator.reverseOrder()).map(Path::toFile).forEach(f -> assertTrue(f.delete()));
                System.out.println("Директория " + path + " удалена со всем ее содержимым");
            } catch (IOException e) {
                System.out.println("Директории " + path + " не существует");
            } finally {
                assertFalse(Files.exists(path));
            }
        });
    }


    @ParameterizedTest
    @ValueSource(strings = {CONFERENCE_PATH, EDUCATIONAL_PATH})
    @Timeout(value = 10)
    public void testCreateSpecification(String casePath) {
        var destinationPath = casePath + "/generated/";
        var sourcePath = casePath + "/spec/";
        var generatedFolder = new File(destinationPath);
        assertTrue(generatedFolder.mkdir());
        new Application().createSpecification(casePath, destinationPath);
        verifySpec(sourcePath, destinationPath, "Parameters.tla");
        verifySpec(sourcePath, destinationPath, "Main.tla");
    }


    private void verifySpec(String expectedPath, String actualPath, String specName) {
        var generatedFile = new File(actualPath + File.separator + specName);
        try (var expectedReader = new BufferedReader(new InputStreamReader(new FileInputStream(expectedPath + File.separator + specName)));
             var actualReader = new BufferedReader(new InputStreamReader(new FileInputStream(generatedFile)))) {
            int i = 0;
            String expectedLine;
            while ((expectedLine = expectedReader.readLine()) != null) {
                var actualLine = actualReader.readLine();
                assertEquals(expectedLine, actualLine, "Spec: " + specName + " expected: " + expectedLine + " actual: " + actualLine + " line: " + ++i);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
