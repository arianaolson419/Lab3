// PC_Calc Calculates the next program counter
`include "addr_concat.v"
`include "imm_concat.v"

module PC_Calc
(
    input[31:0] old_PC,
    input isZero,
    input PCSel, AddSel,
    input[31:0] Da,
    input[25:0] addr,
    input[15:0] imm,
    output[31:0] added_PC
);
	wire[31:0] extendedImm;
	immConcat iconcat(extendedImm[31:0], imm[15:0]);

	wire immZeroed;
	


endmodule
