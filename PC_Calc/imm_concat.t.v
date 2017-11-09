`timescale 1 ns / 1 ps
`include "imm_concat.v"

module testConcat();
	wire[31:0] ans;
	reg[15:0] imm;
	
	immConcat concat(ans[31:0], imm[15:0]);
	initial begin
		imm = 16'b1000000000000001; #100
		$display("%b %b", imm[15:0], ans[31:0]);
		imm = 16'b0111111111111110; #100
		$display("%b %b", imm[15:0], ans[31:0]);
	end
endmodule