# Single Cycle CPU

### Computer Architecture Fall 2017
#### Ariana Olson, Andrew Pan, Jonah Spear

The goal of this project lab was to design, create, and test a 32-bit CPU. We chose to implement a single-cycle CPU given that time was a large constraint. Even though we only had <2 weeks from start to finish, we were ultimately successful in our goal.

## Design

We designed our 32-bit MIPS-subset CPU to support the following instructions:

	LW, SW, J, JR, JAL, BNE, XORI, ADDI, ADD, SUB, SLT

We felt this would give us a good mix of simplicity, while still allowing the execution of complex programs.

We broke up our single-cycle CPU design into three main components: an instruction parser, a PC calculator, and a core module.  The instruction parser decoded instructions from instruction memory directly into the control signals we used for the various components in our other modules.  Our PC calculator handled the changes that needed to be made to the program counter based on information from the various J-type instructions.  Finally, our core module addressed the main functions performed by R and I-type instructions, handling calculations and load/store word operations.

We re-used and modified some modules from previous labs and homework so that we wouldn't have to reimplement a lot of work from scratch.  Specifically, we re-used and modified the ALU, register, data memory, muxes, and DFF gates for our CPU.  The ALU, register, and data memory were all used in our core module, muxes were used in both the core module and PC calculator, and a DFF gate was used for our program counter.  

## Architechture

Our first step in designing our CPU was to create a block diagram with which could successfully run every type of instruction that we needed. We split up our CPU into 3 major components, so that we could each work on them in parallel.

![Instruction Parser Diagram](https://github.com/arianaolson419/Lab3/blob/master/Static/Instruction%20Parser.png "Instruction Parser Diagram")

![PC Calc Diagram](https://github.com/arianaolson419/Lab3/blob/master/Static/PC%20Calc.png "PC Calc Diagram")

![Core Diagram](https://github.com/arianaolson419/Lab3/blob/master/Static/Core.png "Core Diagram")

Once that was completed, we made a table mapping instruction type to control signal value.

Instruction | RegDst | ALUSrc | RegWR | MemWr | ALUCtrl | MemToReg | PCSel | AddSel |
:----------:|:------:|:------:|:-----:|:-----:|:-------:|:--------:|:-----:|:------:|
LW          | 1      | 1      | 1     | 0     | Add     | 1        | 1     | 0      |
SW          | x      | 1      | 0     | 1     | Add     | x        | 1     | 0      |
J           | x      | x      | 0     | 0     | x       | x        | 0     | 0      |
JR          | x      | x      | 0     | 0     | x       | x        | 2     | 0      |
JAL         | 2      | x      | 1     | 0     | x       | 2        | 0     | 0      |
BNE         | x      | 0      | 0     | 0     | Sub     | x        | 1     | 1      |
XORI        | 1      | 1      | 1     | 0     | Xor     | 0        | 1     | 0      |
ADDI        | 1      | 1      | 1     | 0     | Add     | 0        | 1     | 0      |
ADD         | 0      | 0      | 1     | 0     | Add     | 0        | 1     | 0      |
SUB         | 0      | 0      | 1     | 0     | Sub     | 0        | 1     | 0      |
SLT         | 0      | 0      | 1     | 0     | Slt     | 0        | 1     | 0      |


Clearly defining the structure of our processor and our control signal mapping from an early point made final implementation and debugging much easier.

## Testing

Our testing approach was as follows:
1. Unit test every sub-module
2. Unit test top-level module with each instruction type
3. Integration test top-level module with test assmebly programs. 


You can run our tests using the following commands:

`chmod 755 run_tests.sh`

*Needs to be run once in order for the file to be executable*

`./run_tests.sh`


We tested our CPU with unit tests and assembly program tests that attempted to use all of the implemented operations in various patterns.  After using the tests and GTKWAVE to examine the waveforms of our CPU, we identified and fixed all of the bugs that prevented our test cases from running correctly.  

## Work Plan Reflection

We created a work plan and allocated sufficient amount of time for each section of the plan in the event that we encountered roadblocks during our CPU creation.  We actually stayed on track with our work plan throughout the majority of this lab, only having to spend a couple of extra hours for the debugging of our module integration.  Overall, we effectively managed our time thanks to a proper amount of planning in the beginning of the lab and communication amongst team members as we worked on our individual sections.
