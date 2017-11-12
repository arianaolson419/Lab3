// Instruction Parser parses the relevant data and control signals from the instruction.

`include "Memory.v"
`include "Decoder.v"
`include "Controller.v"

module Instruction_Parser
(
    input[31:0] PC,
    // Instruction values
    output[4:0] Rs, Rd, Rt,
    output[15:0] imm,
    output[25:0] addr,
    output[2:0] ALUCtrl,
    output[1:0] MemToReg, RegDst, PCSel,
    output      MemWr, ALUSrc, RegWr, AddSel
);
    wire[31:0] instr;
    Memory Instruction_Memory(.Addr(PC[9:0]), .DataOut(instr));

    wire[5:0] Op, funct;
    wire[4:0] Rs, Rd, Rt;
    wire[15:0] imm;
    wire[25:0] addr;
    Decoder dec(
        .Instr(instr), .Op(Op), .funct(funct),
        .Rs(Rs), .Rd(Rd), .Rt(Rt), .imm(imm), .addr(addr)
    );

    Controller ctrlr(
        .Op(Op), .funct(funct),
        .ALUCtrl(ALUCtrl),
        .MemToReg(MemToReg), .RegDst(RegDst),
        .PCSel(PCSel), .AddSel(AddSel),
        .MemWr(MemWr), .ALUSrc(ALUSrc), .RegWr(RegWr)
    );

endmodule
