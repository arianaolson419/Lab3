/*
Test bench for the core module of the CPU.
*/

`include "core.v"

module core_TEST();
	wire [31:0] Da;
	wire is_zero;

	reg clk;
	reg [31:0] rd;
	reg [31:0] rt;
	reg [31:0] rs;
	reg [15:0] immediate;
	reg [31:0] added_PC;

	core dut (clk, rd, rt, rs, immediate, added_PC, Da, is_zero);

	initial begin
		// Test code here.
	end
endmodule