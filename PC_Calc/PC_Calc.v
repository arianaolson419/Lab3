// PC_Calc Calculates the next program counter

module PC_Calc
(
    input[31:0] old_PC,
    input isZero,
    input PCSel, AddSel,
    input[31:0] Da,
    input[25:0] addr,
    input[15:0] imm,
    output[31:0] new_PC
);

endmodule
