// Instruction Parser parses the relevant data and control signals from the instruction.

module Instruction_Parser
(
    input[31:0] PC,
    // Instruction values
    output[5:0] Rs, Rd, Rt,
    output[15:0] imm,
    output[25:0] addr,
    output ALUCtrl, MemToReg, MemWr, ALUSrc, PCSel, RegDst, RegWr, AddSel
);

endmodule
