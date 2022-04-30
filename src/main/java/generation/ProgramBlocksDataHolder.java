package generation;

import grammar.CaseChangingCharStream;
import grammar.PlSqlLexer;
import grammar.PlSqlParser;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.tree.ParseTree;
import org.antlr.v4.runtime.tree.ParseTreeListener;
import org.antlr.v4.runtime.tree.ParseTreeWalker;
import generation.operator.FunctionCallOperator;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.*;
import java.util.concurrent.*;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.function.Function;
import java.util.stream.Collectors;

import static generation.enums.OperatorType.FUNCTION_CALL;

public class ProgramBlocksDataHolder {
    private final List<ProgramBlockData> programBlocksData;
    private final DatabaseSchema databaseSchema;

    private final AtomicInteger literalCounter = new AtomicInteger(0);

    public ProgramBlocksDataHolder(String sourceDirectory, DatabaseSchema databaseSchema) {
        programBlocksData = new ArrayList<>();
        this.databaseSchema = databaseSchema;
        fillProgramBlocksData(sourceDirectory);
    }

    //TODO переписать красивее, особенно потоки
    private void fillProgramBlocksData(String sourceDirectory) {
        File proceduresDirectory = new File(sourceDirectory + File.separator + "procedures");
        File functionsDirectory = new File(sourceDirectory + File.separator + "functions");
        File[] procedures = Objects.requireNonNull(proceduresDirectory.listFiles());
        File[] functions = Objects.requireNonNull(functionsDirectory.listFiles());
        List<File> programBlockFiles = new ArrayList<>(procedures.length + functions.length);
        programBlockFiles.addAll(Arrays.asList(procedures));
        programBlockFiles.addAll(Arrays.asList(functions));
        ExecutorService executorService = Executors.newFixedThreadPool(programBlockFiles.size());
        List<Future<ProgramBlockData>> futures = new ArrayList<>(programBlockFiles.size());
        for (File programBlockFile : programBlockFiles) {
            futures.add(executorService.submit(new ProgramBlockDataFiller(programBlockFile, databaseSchema)));
        }
        try {
            for (Future<ProgramBlockData> f : futures) {
                programBlocksData.add(f.get());
            }
        } catch (ExecutionException | InterruptedException e) {
            e.printStackTrace();
        } finally {
            executorService.shutdown();
            Map<String, ProgramBlockData> programBlockDataMap = programBlocksData.stream().collect(Collectors.toMap(ProgramBlockData::getProgramBlockName, Function.identity()));
            //добавляем необходимые данные о программных блоках во все операторы вызова функций
            programBlockDataMap.values().forEach(programBlockData ->
                    programBlockData.getOperators().values().stream()
                            .filter(sqlOperator -> sqlOperator.getOperatorType() == FUNCTION_CALL)
                            .forEach(sqlOperator -> {
                                FunctionCallOperator functionCallOperator = ((FunctionCallOperator) sqlOperator);
                                functionCallOperator.setCalledFunction(programBlockDataMap.get(functionCallOperator.getFunctionName()));
                            }));
        }
    }

    //TODO Разобраться с видимостью/типом класса и модификаторами
    private class ProgramBlockDataFiller implements Callable<ProgramBlockData> {
        private final File programBlockSourceFile;
        private final DatabaseSchema databaseSchema;//TODO может использовать внешний параметр?

        public ProgramBlockDataFiller(File programBlockSourceFile, DatabaseSchema databaseSchema) {
            this.programBlockSourceFile = programBlockSourceFile;
            this.databaseSchema = databaseSchema;
        }

        @Override
        public ProgramBlockData call() {
            ProgramBlockData programBlockData = new ProgramBlockData(ProgramBlocksDataHolder.this);
            StringBuilder plSqlCode = new StringBuilder();
            try (BufferedReader sqlScriptSourceReader = new BufferedReader(new FileReader(programBlockSourceFile))) {
                while (sqlScriptSourceReader.ready()) {
                    plSqlCode.append(sqlScriptSourceReader.readLine()).append("\n");
                }
                //TODO может здесь можно как-то лучше сделать, нужно немного разобраться.
                // Определиться с уровнем абстракции переменных
                PlSqlLexer plSqlLexer = new PlSqlLexer(new CaseChangingCharStream(CharStreams.fromString(plSqlCode.toString()), true));
                CommonTokenStream tokens = new CommonTokenStream(plSqlLexer);
                PlSqlParser parser = new PlSqlParser(tokens);
                ParseTree tree = parser.sql_script();
                ParseTreeWalker walker = new ParseTreeWalker();
                ParseTreeListener sqlListener = new PlSqlProgramBlockListener(programBlockData, databaseSchema);
                walker.walk(sqlListener, tree);
            } catch (IOException e) {
                e.printStackTrace();
            }
            return programBlockData;
        }
    }

    public List<ProgramBlockData> getProgramBlocksData() {
        return programBlocksData;
    }

    public AtomicInteger getLiteralCounter() {
        return literalCounter;
    }
}