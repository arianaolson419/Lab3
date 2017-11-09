/*
Test bench for the core module of the CPU.
*/

`include "core.v"

module core_TEST();
	wire [31:0] Da;
	wire is_zero;

	reg clk;
	reg [4:0] rd;
	reg [4:0] rt;
	reg [4:0] rs;
	reg [15:0] immediate;
	reg [31:0] new_PC;
	reg [0:1] regdst;
	reg [2:0] ALUcntrl;
	reg AlUsrc;
	reg MemWr;
	reg RegWr;
	reg [1:0] MemtoReg;

	core dut (clk, rd, rt, rs, immediate, new_PC, regdst, ALUcntrl, AlUsrc, MemWr, RegWr, MemtoReg, Da, is_zero);

	initial clk = 0;
	always #10 clk = !clk;

	initial begin
		$dumpfile("core.vcd");
		$dumpvars(0, core_TEST);

		// Test Case 1: Load Word
		regdst = 2'b01; AlUsrc = 1'b1; RegWr = 1'b1; MemWr = 1'b0; ALUcntrl = 3'b0; MemtoReg = 2'b00;
		rd = 5'bx; rt = 5'b0; rs = 5'b00001; immediate = 16'b0;
		#1000

		$finish;
	end
endmodule