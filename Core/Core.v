// Core controls the central registor and memory storage and manipulation

module Core
(
    input CLK,
    // Decoded Instruction Values
    input[5:0] Rd, Rt, Rs,
    input[15:0] imm,
    input[31:0] addedPC,
    // Control Signals
    input RegDst, RegWr, MemWr, ALUSrc, MemToReg,

    // Outputs
    output[31:0] Da,
    output isZero
);

endmodule
