/*
Test bench for the core module of the CPU.
*/

`include "core.v"

module core_TEST();
	wire [31:0] Da;
	wire is_zero;

	reg clk;
	reg [5:0] rd;
	reg [5:0] rt;
	reg [5:0] rs;
	reg [15:0] immediate;
	reg [31:0] new_PC;
	reg [0:1] regdst;
	reg [2:0] ALUcntrl;
	reg AlUsrc;
	reg MemWr;
	reg RegWr;
	reg [1:0] MemtoReg;

	core dut (clk, rd, rt, rs, immediate, new_PC, regdst, ALUcntrl, AlUsrc, MemWr, RegWr, MemtoReg, Da, is_zero);

	initial begin
		// Test code here.
	end
endmodule