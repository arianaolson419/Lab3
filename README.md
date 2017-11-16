# Single Cycle CPU

### Computer Architecture Fall 2017
#### Ariana Olson, Andrew Pan, Jonah Spear

The goal of this project lab was to design, create, and test a 32-bit CPU. We chose to implement a single-cycle CPU given that time was a large constraint (we had <2 weeks from start to finish). 

## Design

We designed our 32-bit MIPS-subset CPU to support the following instructions:

	LW, SW, J, JR, JAL, BNE, XORI, ADDI, ADD, SUB, SLT

We felt this would give us a good mix of simplicity, while still allowing the execution of complex programs.

## Architechture

Our first step in designing our CPU was to create a block diagram with which could successfully run every type of instruction that we needed.

# Insert picture of block diagram was needed

Once that was completed, we made a table mapping instruction type to control signal value.

# Insert control Table Here

Clearly defining the structure of our processor from an early made final implementation and debugging much easier.


## Testing

Our testing approach was as follows:
1. Unit test every sub-module
2. Unit test top-level module with each instruction type
3. Integration test top-level module with test assmebly programs. 

You can run our tests using the following command:

#Insert testing command here

## Programs ##

You will write, assemble and run a set of programs on your CPU that act as a high-level test-bench.  These programs need to exercise all of the portions of your design and give a clear pass/fail response.

We will work on one test program (Fibonacci) in class. In addition, you must write (at least) one test assembly program of your own. We will collect these test programs and redistribute them to all teams, so that you have a richer variety of assembly tests for your processor.

### Submitting your test program ###

**Due: November 14 before class** by GitHub pull request

In addition to your actual test assembly code, write a short README with:
 - Expected results of the test
 - Any memory layout requirements (e.g. `.data` section)
 - Any instructions used outside the basic required subset (ok to use, but try to submit at least one test program everyone can run)

Submit the test program and README by submitting a pull request to the main course repository. Code should be in `/asmtest/<your-team-name>/` (you may use subfolders if you submit multiple tests).

After submitting your test program, you may use any of the programs written by your peers to test your processor.



## Deliverables ##

**Due: Friday, November 17** by pushing to GitHub and submitting a pull request
 - Verilog and test benches for your processor design
 - Assembly test(s) with README 
 - Any necessary scripts
 - Report (PDF or MarkDown), including:
   - Written description and block diagram of your processor architecture. Consider including selected RTL to capture how instructions are implemented.
   - Description of your test plan and results
   - Some performance/area analysis of your design. This can be for the full processor, or a case study of choices made designing a single unit. It can be based on calculation, simulation, Vivado synthesis results, or a mix of all three.
   - Work plan reflection


Each team will also demo their work in class after break.
 

## Notes/Hints ##

### Design Reuse ###
You may freely reuse code created for previous labs, even code written by another team or the instructors. Reusing code does not change your obligation to understand it and provide appropriate test benches.

**Each example of reuse should be documented.** 

### Synthesis ###
You are **not** required to implement your design on FPGA. You may want to synthesize your design (or parts of it) with Vivado to collect performance/area data.

### Assembling ###
[MARS](http://courses.missouristate.edu/kenvollmar/mars/) is a very nice assembler. It allows you to see the machine code (actual bits) of the instructions, which is useful for debugging. 


### Psuedo-Instructions ###
There are many instructions supported by MARS that aren’t "real" MIPS instructions, but instead map onto other instructions. Your processor should only implement instructions from the actual MIPS ISA (see the [Instruction Reference sheet](https://sites.google.com/site/ca16fall/resources/mips) for a complete listing).

### Initializing Memory ###
You can initialize a memory (e.g. data memory or instruction memory) from a file with `$readmemb` or `$readmemh`.  This will make your life very much easier!

For example, you could load a program into your data memory by putting your machine code in hexadecimal format in a file named `file.dat` and using something like this for your instruction memory.  

```verilog
module memory
(
  input clk, regWE,
  input[9:0] Addr,
  input[31:0] DataIn,
  output[31:0]  DataOut
);
  
  reg [31:0] mem[1023:0];  
  
  always @(posedge clk) begin
    if (regWE) begin
      mem[Addr] <= DataIn;
    end
  end
  
  initial $readmemh(“file.dat”, mem);
    
  assign DataOut = mem[Addr];
endmodule
```

You may need to fiddle with the `Addr` bus to make it fit your design, depending on how you handle the "address is always a multiple of 4" (word alignment) issue.

This memory initialization only works in simulation; it will be ignored by Vivado (which is ok).

### Memory Configuration ###

In MARS, go to "Settings -> Memory Configuration".  Changing this to "Compact, Text at Address 0" will give you a decent memory layout to start with.  This will put your program (text) at address `0`, your data at address `0x1000`, and your stack pointer will start at `0x3ffc`.

You will need to manually set your stack pointer in your Verilog simulation.  This is done automatically for you in MARS.

