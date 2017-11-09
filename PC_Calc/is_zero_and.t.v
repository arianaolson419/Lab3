`timescale 1 ns / 1 ps
`include "is_zero_and.v"

module testIsZero();
	wire[31:0] ans;
	reg[31:0] imm;
	reg isZero;
	
	isZeroAnd iszero(ans[31:0], imm[31:0], isZero);
	initial begin
		imm = 32'b11111111111111111111111111111111;
		isZero = 1; #1000
		$display("%b %b %b", imm[31:0], isZero, ans[31:0]);
		isZero = 0; #1000
		$display("%b %b %b", imm[31:0], isZero, ans[31:0]);
	end
endmodule