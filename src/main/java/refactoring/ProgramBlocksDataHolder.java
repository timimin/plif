package refactoring;

import grammar.PlSqlLexer;
import grammar.PlSqlParser;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.tree.ParseTree;
import org.antlr.v4.runtime.tree.ParseTreeListener;
import org.antlr.v4.runtime.tree.ParseTreeWalker;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Objects;
import java.util.concurrent.*;

public class ProgramBlocksDataHolder {
    private final List<ProgramBlockData> programBlocksData;

    public ProgramBlocksDataHolder(String sourceDirectory) {
        programBlocksData = new CopyOnWriteArrayList<>();
        fillProgramBlocksData(sourceDirectory);
    }

    //TODO переписать красивее, особенно потоки
    private void fillProgramBlocksData(String sourceDirectory) {
        File proceduresDirectory = new File(sourceDirectory + File.separator + "procedures");
        File functionsDirectory = new File(sourceDirectory + File.separator + "functions");
        //File propertiesDirectory = new File(sourceDirectory + File.separator + "functions");//для таблиц

        File[] procedures = Objects.requireNonNull(proceduresDirectory.listFiles());
        File[] functions = Objects.requireNonNull(functionsDirectory.listFiles());
        List<File> programBlockFiles = new ArrayList<>(procedures.length + functions.length);
        programBlockFiles.addAll(Arrays.asList(procedures));
        programBlockFiles.addAll(Arrays.asList(functions));
        ExecutorService executorService = Executors.newFixedThreadPool(programBlockFiles.size());
        List<Future<ProgramBlockData>> futures = new ArrayList<>(programBlockFiles.size());
        for (File programBlockFile : programBlockFiles) {
            futures.add(executorService.submit(new ProgramBlockDataFiller(programBlockFile)));
        }
        try {
            for (Future<ProgramBlockData> f :
                    futures) {
                programBlocksData.add(f.get());
            }
        } catch (ExecutionException | InterruptedException e) {
            e.printStackTrace();
        } finally {
            executorService.shutdown();
        }
        System.out.println();
    }

    //TODO Разобраться с видимостью/типом класса и модификаторами
    static class ProgramBlockDataFiller implements Callable<ProgramBlockData> {
        private final File programBlockSourceFile;

        public ProgramBlockDataFiller(File programBlockSourceFile) {
            this.programBlockSourceFile = programBlockSourceFile;
        }

        @Override
        public ProgramBlockData call() {
            ProgramBlockData programBlockData = new ProgramBlockData(programBlockSourceFile);
            StringBuilder plSqlCode = new StringBuilder();
            try (BufferedReader sqlScriptSourceReader = new BufferedReader(new FileReader(programBlockSourceFile))) {
                while (sqlScriptSourceReader.ready()) {
                    plSqlCode.append(sqlScriptSourceReader.readLine()).append("\n");
                }
                //TODO может здесь можно как-то лучше сделать, нужно немного разобраться.
                // Определиться с уровнем абстракции переменных
                PlSqlLexer plSqlLexer = new PlSqlLexer(CharStreams.fromString(plSqlCode.toString()));
                CommonTokenStream tokens = new CommonTokenStream(plSqlLexer);
                PlSqlParser parser = new PlSqlParser(tokens);
                ParseTree tree = parser.sql_script();
                ParseTreeWalker walker = new ParseTreeWalker();
                ParseTreeListener sqlListener = new PlSqlProgramBlockListener(programBlockData);
                walker.walk(sqlListener, tree);
            } catch (IOException e) {
                e.printStackTrace();
            }
            return programBlockData;
        }
    }

    public static void main(String[] args) throws InterruptedException, ExecutionException {
        long start = System.currentTimeMillis();
        new ProgramBlocksDataHolder("D:\\JavaProjects\\AntlrTesting\\src\\main\\resources\\programblocks");
        System.out.println(System.currentTimeMillis() - start);
/*
        Future<Integer> future = Executors.newSingleThreadExecutor().submit(() -> {
            if (LocalDateTime.now().toLocalTime() == null)
                throw new Exception();
            return 1;
        });
        System.out.println(future.isDone());*/
    }
}