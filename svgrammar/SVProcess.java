import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.tree.ParseTree;
import org.antlr.v4.runtime.tree.ParseTreeWalker;

import javax.swing.*;
import java.io.*;
import java.util.*;

class SVDeleteAssign extends SysVerilogHDLBaseListener {
    SysVerilogHDLParser parser;
    HashMap<String, Vector<Integer>> posList = new HashMap<String, Vector<Integer>>();
    HashSet<String> portSet = new HashSet<String>();
    HashSet<String> instantSet = new HashSet<String>();
    HashSet<String> lvalSet = new HashSet<String>();
    HashMap<String, String> rvalMap = new HashMap<String, String>();
    HashMap<String, Integer> lvalLineMap = new HashMap<String, Integer>();
    HashMap<String, Integer> declLineMap = new HashMap<String, Integer>();

    public SVDeleteAssign(SysVerilogHDLParser parser) { this.parser = parser; }

    @Override
    public void enterNet_assignment(SysVerilogHDLParser.Net_assignmentContext ctx) {
        System.out.println(ctx.net_lvalue().toString());
    }

    @Override
    public void enterVariable_assignment(SysVerilogHDLParser.Variable_assignmentContext ctx) {

        if (ctx.expression().primary() != null && ctx.expression().children.size() == 1) {
            //System.out.println(ctx.expression().primary().getText() + "   primary");
            lvalSet.add(ctx.variable_lvalue().getText());
            lvalLineMap.put(ctx.variable_lvalue().getText(), ctx.getStart().getLine());
            rvalMap.put(ctx.variable_lvalue().getText(), ctx.expression().primary().getText());
        }
        //System.out.println(ctx.variable_lvalue().getText() + " = " + ctx.expression().getText());
    }

    @Override
    public void enterAnsi_port_declaration(SysVerilogHDLParser.Ansi_port_declarationContext ctx) {
        portSet.add(ctx.port_identifier().getText());
    }

    @Override
    public void enterIdentifier(SysVerilogHDLParser.IdentifierContext ctx) {
        String[] ruleNames = parser.getRuleNames();
        String ruleName = ruleNames[ctx.parent.parent.getRuleIndex()];

        // identifiers not to be replaced
        if (ruleName.equals("named_port_connection")) {
            return;
        }

        if (ruleName.equals("net_decl_assignment")) {
            declLineMap.put(ctx.getText(), ctx.getStart().getLine());
            return;
        }

        Vector<Integer> newVec = new Vector<Integer>();
        Vector<Integer> tempVec;
        tempVec = posList.getOrDefault(ctx.getText(), newVec);

        tempVec.add(ctx.getStart().getLine());
        tempVec.add(ctx.getStart().getCharPositionInLine());

        posList.put(ctx.getText(), tempVec);
    }
}

class SVTrancateModule extends SysVerilogHDLBaseListener {
    SysVerilogHDLParser parser;
    Vector<Integer> linePosition = new Vector<Integer>();
    Vector<String> moduleVector = new Vector<String>();

    public SVTrancateModule(SysVerilogHDLParser parser) {
        this.parser = parser;
    }


    @Override
    public void enterModuleNonansi(SysVerilogHDLParser.ModuleNonansiContext ctx) {
        linePosition.add(ctx.getStart().getLine());
        moduleVector.add(ctx.module_nonansi_header().module_identifier().getText());
    }

    @Override
    public void exitModuleNonansi(SysVerilogHDLParser.ModuleNonansiContext ctx) {
        linePosition.add(ctx.getStop().getLine());
    }

    @Override
    public void enterModuleAnsi(SysVerilogHDLParser.ModuleAnsiContext ctx) {
        linePosition.add(ctx.getStart().getLine());
        moduleVector.add(ctx.module_ansi_header().module_identifier().getText());
    }

    @Override
    public void exitModuleAnsi(SysVerilogHDLParser.ModuleAnsiContext ctx) {
        linePosition.add(ctx.getStop().getLine());
    }

    @Override
    public void enterModuleIdent(SysVerilogHDLParser.ModuleIdentContext ctx) {
        linePosition.add(ctx.getStart().getLine());
        moduleVector.add(ctx.module_identifier().get(0).getText());
    }

    @Override
    public void exitModuleIdent(SysVerilogHDLParser.ModuleIdentContext ctx) {
        linePosition.add(ctx.getStop().getLine());
    }
}


class SVTopoModule extends SysVerilogHDLBaseListener {

    SysVerilogHDLParser parser;
    Vector<String> moduleVec = new Vector<String>();
    Vector<Vector<String>> moduleList = new Vector<Vector<String>>();
    HashSet<String> set = new HashSet<String>();
    HashSet<String> allModules = new HashSet<String>();
    HashMap<String, Integer> degreeMap = new HashMap<String, Integer>();
    HashMap<String, Integer> moduleMap = new HashMap<String, Integer>();

    public SVTopoModule(SysVerilogHDLParser parser) {
        this.parser = parser;
    }

    @Override
    public void enterModuleNonansi(SysVerilogHDLParser.ModuleNonansiContext ctx) {
        String id = ctx.module_nonansi_header().module_identifier().getText();

        int index = moduleList.size();
        moduleMap.put(id, index);

        degreeMap.put(id, degreeMap.getOrDefault(id, 0));

        allModules.add(id);
    }

    @Override
    public void exitModuleNonansi(SysVerilogHDLParser.ModuleNonansiContext ctx) {
        moduleList.add((Vector<String>)moduleVec.clone());
        moduleVec.clear();
        set.clear();
    }

    @Override
    public void enterModuleAnsi(SysVerilogHDLParser.ModuleAnsiContext ctx) {
        String id = ctx.module_ansi_header().module_identifier().getText();

        int index = moduleList.size();
        moduleMap.put(id, index);

        degreeMap.put(id, degreeMap.getOrDefault(id, 0));

        allModules.add(id);
    }

    @Override
    public void exitModuleAnsi(SysVerilogHDLParser.ModuleAnsiContext ctx) {
        moduleList.add((Vector<String>)moduleVec.clone());
        moduleVec.clear();
        set.clear();
    }

    @Override
    public void enterModuleIdent(SysVerilogHDLParser.ModuleIdentContext ctx) {
        String id = ctx.module_identifier().get(0).getText();

        int index = moduleList.size();
        moduleMap.put(id, index);

        degreeMap.put(id, degreeMap.getOrDefault(id, 0));

        allModules.add(id);
    }

    @Override
    public void exitModuleIdent(SysVerilogHDLParser.ModuleIdentContext ctx) {
        moduleList.add((Vector<String>)moduleVec.clone());
        moduleVec.clear();
        set.clear();
    }

    @Override
    public void enterModule_instantiation(SysVerilogHDLParser.Module_instantiationContext ctx) {
        String id = ctx.module_identifier().getText();
        if (set.add(id)) {
            allModules.add(id);
            moduleVec.add(id);
            degreeMap.put(id, degreeMap.getOrDefault(id, 0) + 1);
        }
    }

}

class SVProcess {
    private static void deleteAssign(String inputFile, ParseTree otree, SysVerilogHDLParser oparser) throws Exception {
        ParseTree tree = otree;
        SysVerilogHDLParser parser = oparser;

        ParseTreeWalker walker = new ParseTreeWalker();
        SVDeleteAssign printer = new SVDeleteAssign(parser);
        walker.walk(printer, tree);

        int loopTotal = printer.lvalSet.size();

        for (int i = 0; i < loopTotal; i++) {

            FileReader fileReader = new FileReader(inputFile);
            BufferedReader reader = new BufferedReader(fileReader);

            StringBuffer buffer = new StringBuffer();
            String lineContent = "";

            for (String id : printer.lvalSet) {
                if (printer.portSet.contains(id)) {
                    continue;
                }

                int lineNum = 1, vecIndex = 0;
                while ((lineContent = reader.readLine()) != null) {
                    if (lineNum == printer.lvalLineMap.get(id)) {
                        if (lineNum == printer.posList.get(id).get(vecIndex * 2)) {
                            vecIndex++;
                        }
                        lineNum++;
                        continue;
                    }

                    if (printer.declLineMap.containsKey(id)) {
                        if (lineNum == printer.declLineMap.get(id)) {
                            lineNum++;
                            continue;
                        }
                    }

                    if (vecIndex * 2 < printer.posList.get(id).size()) {
                        String rval = printer.rvalMap.get(id);
                        if (lineNum == printer.posList.get(id).get(vecIndex * 2)) {
                            lineContent = lineContent.replace(id, rval);
                            vecIndex++;
                        }
                    }

                    lineNum++;

                    buffer.append(lineContent);
                    buffer.append(System.getProperty("line.separator"));
                }

                fileReader.close();
                reader.close();

                String content = buffer.toString();

                FileWriter fileWriter = new FileWriter(inputFile);
                BufferedWriter bufferedWriter = new BufferedWriter(fileWriter);
                bufferedWriter.write(content);
                bufferedWriter.close();

                break;
            }

            CharStream input = CharStreams.fromStream(new FileInputStream(inputFile));
            SysVerilogHDLLexer lexer = new SysVerilogHDLLexer(input);
            CommonTokenStream tokens = new CommonTokenStream(lexer);
            parser = new SysVerilogHDLParser(tokens);
            tree = parser.source_text();

            walker = new ParseTreeWalker();
            printer = new SVDeleteAssign(parser);
            walker.walk(printer, tree);
        }
    }

    private static void trancateProcess(String inputFile, ParseTree tree, SysVerilogHDLParser parser) throws Exception {
        ParseTreeWalker walker = new ParseTreeWalker();
        SVTrancateModule printer = new SVTrancateModule(parser);
        walker.walk(printer, tree);



        FileReader fileReader = new FileReader(inputFile);
        BufferedReader reader = new BufferedReader(fileReader);

        String outputFile = fileName(inputFile, printer.moduleVector.get(0));
        FileWriter fileWriter = new FileWriter(outputFile);

        String lineContent = "";
        int lineNum = 1, vecIndex = 0;
        while ((lineContent = reader.readLine()) != null) {

            if (lineNum >= printer.linePosition.get(2 * vecIndex) &&
                    lineNum <= printer.linePosition.get(2 * vecIndex + 1)) {
                if (!lineContent.equals("")) {
                    fileWriter.write(lineContent + "\n");
                }
            }

            if (lineNum == printer.linePosition.get(2 * vecIndex + 1)) {
                vecIndex++;
                fileWriter.close();

                if (2 * vecIndex + 1 >= printer.linePosition.size()) {
                    break;
                }

                outputFile = fileName(inputFile, printer.moduleVector.get(vecIndex));
                fileWriter = new FileWriter(outputFile);
            }

            lineNum++;
        }

        fileReader.close();
        reader.close();
    }

    private static void topoProcess(String inputFile, ParseTree tree, SysVerilogHDLParser parser) throws Exception {
        ParseTreeWalker walker = new ParseTreeWalker();
        SVTopoModule printer = new SVTopoModule(parser);
        walker.walk(printer, tree);

        Queue<String> queue = new LinkedList<String>();
        HashSet<String> set = new HashSet<String>();

        for (String m : printer.allModules) {
            if (printer.degreeMap.get(m) == 0) {
                queue.offer(m);
                set.add(m);
            }
        }

        //Vector<String> result = new Vector<String>();
        Stack<String> result = new Stack<String>();

        while (!queue.isEmpty()) {
            String ver = queue.poll();
            set.remove(ver);
            result.push(ver);
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

        String moduleName = result.pop();
        fileWriter.write(moduleName + "\n");
        while (!result.isEmpty()) {
            moduleName = result.pop();
            fileWriter.write(moduleName + "\n");
        }

        fileWriter.close();
    }

    public static String fileName(String inputFile, String moduleName) {
        String[] splitedName = inputFile.split(File.separator);

        String route = "";
        for (int i = 0; i < splitedName.length - 1; i++) {
            route = route + splitedName[i] + File.separator;
        }

        String outputFile = route + moduleName + ".sv";

        return outputFile;
    }

    public static void main(String[] args) throws Exception {
        String inputFile = null;

        if (args.length > 0) inputFile = args[0];
        InputStream is = System.in;
        if (inputFile != null) is = new FileInputStream(inputFile);

        CharStream input = CharStreams.fromStream(is);
        SysVerilogHDLLexer lexer = new SysVerilogHDLLexer(input);
        CommonTokenStream tokens = new CommonTokenStream(lexer);
        SysVerilogHDLParser parser = new SysVerilogHDLParser(tokens);
        ParseTree tree = parser.source_text();

        //topoProcess(inputFile, tree, parser);
        //trancateProcess(inputFile, tree, parser);
        deleteAssign(inputFile, tree, parser);
    }
}
