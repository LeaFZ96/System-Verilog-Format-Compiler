# System Verilog source code format tool

## Description

A code format tool for the System Verilog source code (`*.sv` )

**Include:**

- Separate the modules to the single file;
- Generate the topological sort of the modules;
- Remove the duplicate assign.

### Directory

```
.
├── README.md
├── grammar
│   ├── Process.java
│   └── Verilog2001.g4
├── svgrammar
│   ├── SVProcess.java
│   └── SysVerilogHDL.g4
└── test
    └── test_case
        ├── case1
        ├── case2
        └── cl_firesim_generated.sv
```

`./grammar` dir is for Verilog source files `*.v`  **Abandoned**

`./svgrammar` dir is for System Verilog source files.

## Dependency

- Java(TM) SE Runtime Environment 18.3
- ANTLR 4.7.1
- Icarus Verilog version 10.2

### .zshrc / .bashrc

```shell
export CLASSPATH="/Path/To/Antlr/antlr-4.7.1-complete.jar:$CLASSPATH"
alias antlr4='java org.antlr.v4.Tool'
alias grun='java org.antlr.v4.gui.TestRig'
```

## Usage

#### 1. Preprocess the source code

Using Icarus Verilog to preprocess to remove the macro and other system function.

```
iverilg -E -o output.sv input.sv
```

#### 2. Generate the parser

```
cd ./svgrammar
antlr4 *.g4
javac SysVerilogHDL*.java
```

#### 3. Process the code

```
javac SVProcess.java
java SVProcess ../test/test_case/output.sv
```

#### Notice

Three function can be used separatly. Comment the other two methods on the 415 - 417 line to use the single function. **And the function of removing the duplicate assign should be used in another command after separating the big source file to single module files. Like:**

```
java SVProcess ../test/test_case/case1/Top.sv				# Only one module in the file
```

## Output

Suppose the `.sv` file is  `./test/test_case/case1/output.sv` 

**Topological Sort:**

Output: `./test/test_case/case1/output.sv_topo.txt` 

The top of the file is the leaf node and the bottom of the file is the root node.

**Separate Modules:**

Output: `./test/test_case/case1/module_names.sv`

**Remove Duplicate Assign:**

Output: the origin input file