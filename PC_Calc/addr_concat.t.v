`timescale 1 ns / 1 ps
`include "addr_concat.v"

module testConcat();
	wire[31:0] ans;
	reg[31:0] pc;
	reg[25:0] jumpAddr;
	
	addrConcat concat(ans[31:0], pc[31:0], jumpAddr[25:0]);
	initial begin
		pc = 32'b11000000000000000000000000000000;
		jumpAddr = 26'b10101010101010101010101010; #100
		$display("%b %b %b", pc[31:0], jumpAddr[25:0], ans[31:0]);
		pc = 32'b11110000000000000000000000000000;
		jumpAddr = 26'b11111111111111111111111111; #100
		$display("%b %b %b", pc[31:0], jumpAddr[25:0], ans[31:0]);
		pc = 32'b00000000000000000000000000000000;
		jumpAddr = 26'b11111111111111111111111111; #100
		$display("%b %b %b", pc[31:0], jumpAddr[25:0], ans[31:0]);
	end
endmodule