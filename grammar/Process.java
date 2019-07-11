import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.tree.ParseTree;
import org.antlr.v4.runtime.tree.ParseTreeWalker;

import javax.swing.*;
import java.io.*;
import java.util.*;

class TrancateModule extends Verilog2001BaseListener {
    Verilog2001Parser parser;
    Vector<Integer> linePosition = new Vector<Integer>();

    public TrancateModule(Verilog2001Parser parser) {
        this.parser = parser;
    }

    @Override
    public void enterTiming_spec(Verilog2001Parser.Timing_specContext ctx) {
        linePosition.add(ctx.getStart().getLine());
    }

    @Override
    public void enterModule_declaration(Verilog2001Parser.Module_declarationContext ctx) {
        linePosition.add(ctx.getStart().getLine());
    }

    @Override
    public void exitModule_declaration(Verilog2001Parser.Module_declarationContext ctx) {
        linePosition.add(ctx.getStop().getLine());
    }
}

class TopoModule extends Verilog2001BaseListener {
    Verilog2001Parser parser;
    Vector<String> moduleVec = new Vector<String>();
    Vector<Vector<String>> moduleList = new Vector<Vector<String>>();
    HashSet<String> set = new HashSet<String>();
    HashSet<String> allModules = new HashSet<String>();
    HashMap<String, Integer> degreeMap = new HashMap<String, Integer>();
    HashMap<String, Integer> moduleMap = new HashMap<String, Integer>();

    public TopoModule(Verilog2001Parser parser) {
        this.parser = parser;
    }

    @Override
    public void enterModule_declaration(Verilog2001Parser.Module_declarationContext ctx) {
        String id = ctx.module_identifier().getText();

        int index = moduleList.size();
        moduleMap.put(id, index);

        degreeMap.put(id, degreeMap.getOrDefault(id, 0));

        allModules.add(id);
    }

    @Override
    public void exitModule_declaration(Verilog2001Parser.Module_declarationContext ctx) {
        moduleList.add((Vector<String>)moduleVec.clone());
        moduleVec.clear();
        set.clear();
    }

    @Override
    public void enterModule_instantiation(Verilog2001Parser.Module_instantiationContext ctx) {
        String id = ctx.module_identifier().getText();
        if (set.add(id)) {
            allModules.add(id);
            moduleVec.add(id);
            degreeMap.put(id, degreeMap.getOrDefault(id, 0) + 1);
        }
    }

}

class Process {

    private static void trancateProcess(String inputFile, ParseTree tree, Verilog2001Parser parser) throws Exception {
        ParseTreeWalker walker = new ParseTreeWalker();
        TrancateModule printer = new TrancateModule(parser);
        walker.walk(printer, tree);
        for (Integer value : printer.linePosition) {
            System.out.println(value);
        }


        FileReader fileReader = new FileReader(inputFile);
        BufferedReader reader = new BufferedReader(fileReader);

        String outputFile = inputFile + "_0.v";
        FileWriter fileWriter = new FileWriter(outputFile);

        String timeSpec = "";
        String lineContent = "";
        int lineNum = 1, vecIndex = 1;
        while ((lineContent = reader.readLine()) != null) {
            if (lineNum == printer.linePosition.get(0)) {
                timeSpec = lineContent;
            }

            if (lineNum == printer.linePosition.get(2 * vecIndex - 1)) {
                fileWriter.write(timeSpec + "\n\n");
            }

            if (lineNum >= printer.linePosition.get(2 * vecIndex - 1) &&
                    lineNum <= printer.linePosition.get(2 * vecIndex)) {
                fileWriter.write(lineContent + "\n");
            }

            if (lineNum == printer.linePosition.get(2 * vecIndex)) {
                vecIndex++;
                fileWriter.close();

                if (2 * vecIndex > printer.linePosition.size()) {
                    break;
                }

                outputFile = inputFile + "_" + Integer.toString(vecIndex - 1) + ".v";
                fileWriter = new FileWriter(outputFile);
            }

            lineNum++;
        }

        fileReader.close();
        reader.close();
    }

    private static void topoProcess(String inputFile, ParseTree tree, Verilog2001Parser parser) throws Exception {
        ParseTreeWalker walker = new ParseTreeWalker();
        TopoModule printer = new TopoModule(parser);
        walker.walk(printer, tree);

        System.out.println("moduleList: " + printer.moduleList);
        System.out.println("degreeMap: " + printer.degreeMap);
        System.out.println("moduleMap: " + printer.moduleMap);
        System.out.println("allModules: " + printer.allModules);

        Queue<String> queue = new LinkedList<String>();
        HashSet<String> set = new HashSet<String>();

        for (String m : printer.allModules) {
            if (printer.degreeMap.get(m) == 0) {
                queue.offer(m);
                set.add(m);
            }
        }

        Vector<String> result = new Vector<String>();

        while (!queue.isEmpty()) {
            String ver = queue.poll();
            set.remove(ver);
            result.add(ver);
            if (printer.moduleMap.containsKey(ver)) {
                int index = printer.moduleMap.get(ver);
                for (String m : printer.moduleList.get(index)) {
                    int degree = printer.degreeMap.get(m);
                    if (degree == 0) {
                        continue;
                    } else if (degree == 1) {
                        if (set.add(m)) {
                            queue.offer(m);
                        }
                    } else {
                        printer.degreeMap.put(m, degree - 1);
                    }
                }
            }
        }

        String outputFile = inputFile + "_topo.txt";
        FileWriter fileWriter = new FileWriter(outputFile);

        for (String m : result) {
            fileWriter.write(m + "\n");
        }

        fileWriter.close();

        //System.out.println(result);
    }

    public static void main(String[] args) throws Exception {
        String inputFile = null;

        if (args.length > 0) inputFile = args[0];
        InputStream is = System.in;
        if (inputFile != null) is = new FileInputStream(inputFile);

        CharStream input = CharStreams.fromStream(is);
        Verilog2001Lexer lexer = new Verilog2001Lexer(input);
        CommonTokenStream tokens = new CommonTokenStream(lexer);
        Verilog2001Parser parser = new Verilog2001Parser(tokens);
        ParseTree tree = parser.source_text();

        topoProcess(inputFile, tree, parser);
        //trancateProcess(inputFile, tree, parser);
    }
}