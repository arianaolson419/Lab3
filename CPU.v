// 32 Bit CPU
// Ariana Olson, Andrew Pan, Jonah Spear

`include "Instruction_Parser/Instruction_Parser.v"
`include "Core/Core.v"
`include "PC_Calc/PC_Calc.v"
`include "DFF.v"

module CPU
(
    input CLK
);
    // PC is the current program counter, new_PC is what it's next value will be.
    wire[31:0] PC, new_PC;
    reg en;

    initial begin
        en = 0; #1000;
        en = 1;
    end

    DFF #(32) pc(.trigger(CLK), .enable(en), .out(PC), .in(new_PC));

    wire[4:0]  Rs, Rd, Rt;
    wire[15:0] imm;
    wire[25:0] addr;
    wire[2:0]  ALUCtrl;
    wire[1:0]  MemToReg, RegDst, PCSel;
    wire       MemWr, ALUSrc, RegWr, AddSel;
    InstructionParser ip(
        .PC(PC),
        .Rs(Rs), .Rd(Rd), .Rt(Rt),
        .imm(imm), .addr(addr),
        .ALUCtrl(ALUCtrl), .MemToReg(MemToReg),
        .MemWr(MemWr), .ALUSrc(ALUSrc), .PCSel(PCSel),
        .RegDst(RegDst), .RegWr(RegWr), .AddSel(AddSel)
    );


    wire[31:0] Da;
    wire isZero;
    wire[31:0] added_PC;
    Core c(
        .CLK(CLK), .Rd(Rd), .Rt(Rt), .Rs(Rs), .imm(imm), .addedPC(added_PC),
        .RegDst(RegDst), .RegWr(RegWr), .MemWr(MemWr),
        .ALUSrc(ALUSrc), .MemToReg(MemToReg), .ALUCntrl(ALUCtrl),
        .Da(Da), .isZero(isZero)
    );

    PC_Calc pc_calc(
        .old_PC(PC), .isZero(isZero), .PCSel(PCSel), .AddSel(AddSel),
        .Da(Da), .addr(addr), .imm(imm), .added_PC(added_PC), .new_PC(new_PC)
    );


endmodule
