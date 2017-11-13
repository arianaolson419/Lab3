// PC_Calc Calculates the next program counter
`include "addr_concat.v"
`include "imm_concat.v"
`include "is_zero_and.v"
`include "multiplexer.v"

module PC_Calc
(
    input[31:0] old_PC,
    input isZero,
    input[1:0] PCSel, 
    input AddSel,
    input[31:0] Da,
    input[25:0] addr,
    input[15:0] imm,
    output[31:0] added_PC,
    output[31:0] new_PC,
    output[31:0] addedSel,
    output[31:0] jump
);
	wire[31:0] extendedImm;
	immConcat iconcat(extendedImm[31:0], imm[15:0]);

	wire[31:0] immZeroed;
	wire nIsZero;
	not inviszero(nIsZero, isZero);
	isZeroAnd immzeroed(immZeroed[31:0], extendedImm[31:0], nIsZero);

	wire[31:0] immZeroed4;
	assign immZeroed4 = immZeroed + 4;

	wire[31:0] addedSel;
	mux2input m2(32'd4, immZeroed4[31:0], AddSel, addedSel[31:0]);

	assign added_PC = addedSel + old_PC;

	wire[31:0] jump;
	addrConcat addrconcat(jump[31:0], added_PC[31:0], addr[25:0]);

	mux4input m4(jump[31:0], added_PC[31:0], Da[31:0], 32'd0, PCSel[1:0], new_PC[31:0]);
endmodule
