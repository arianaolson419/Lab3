/*
Test bench for the core module of the CPU.
*/

`include "Core/core.v"

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
		$dumpfile("Core/core.vcd");
		$dumpvars(0, core_TEST, dut.datamemory.memory[0], dut.datamemory.memory[1]);

		// Test Case 1: Add Immediate
		regdst = 2'b01; AlUsrc = 1'b1; RegWr = 1'b1; MemWr = 1'b0; ALUcntrl = 3'b000; MemtoReg = 1'b0;
		rd =5'bx; rt = 5'd1; rs = 5'b00000; immediate = 16'b0;
		#6000

		if (dut.databout !== 32'b0) begin
			$display("Test case 1 failed: R[rt] != R[rs] + 32'b0");
		end

		// Populate the rest of the registers with data (each gets 32'b0)
		regdst = 2'b01; AlUsrc = 1'b1; RegWr = 1'b1; MemWr = 1'b0; ALUcntrl = 3'b000; MemtoReg = 1'b0;
		rd =5'bx; rt = 5'd2; rs = 5'b00000; immediate = 16'b0;
		#6000
		regdst = 2'b01; AlUsrc = 1'b1; RegWr = 1'b1; MemWr = 1'b0; ALUcntrl = 3'b000; MemtoReg = 1'b0;
		rd =5'bx; rt = 5'd3; rs = 5'b00000; immediate = 16'b0;
		#6000
		regdst = 2'b01; AlUsrc = 1'b1; RegWr = 1'b1; MemWr = 1'b0; ALUcntrl = 3'b000; MemtoReg = 1'b0;
		rd =5'bx; rt = 5'd4; rs = 5'b00000; immediate = 16'b0;
		#6000
		regdst = 2'b01; AlUsrc = 1'b1; RegWr = 1'b1; MemWr = 1'b0; ALUcntrl = 3'b000; MemtoReg = 1'b0;
		rd =5'bx; rt = 5'd5; rs = 5'b00000; immediate = 16'b0;
		#6000
		regdst = 2'b01; AlUsrc = 1'b1; RegWr = 1'b1; MemWr = 1'b0; ALUcntrl = 3'b000; MemtoReg = 1'b0;
		rd =5'bx; rt = 5'd6; rs = 5'b00000; immediate = 16'b0;
		#6000
		regdst = 2'b01; AlUsrc = 1'b1; RegWr = 1'b1; MemWr = 1'b0; ALUcntrl = 3'b000; MemtoReg = 1'b0;
		rd =5'bx; rt = 5'd7; rs = 5'b00000; immediate = 16'b0;
		#6000
		regdst = 2'b01; AlUsrc = 1'b1; RegWr = 1'b1; MemWr = 1'b0; ALUcntrl = 3'b000; MemtoReg = 1'b0;
		rd =5'bx; rt = 5'd8; rs = 5'b00000; immediate = 16'b0;
		#6000
		regdst = 2'b01; AlUsrc = 1'b1; RegWr = 1'b1; MemWr = 1'b0; ALUcntrl = 3'b000; MemtoReg = 1'b0;
		rd =5'bx; rt = 5'd9; rs = 5'b00000; immediate = 16'b0;
		#6000
		regdst = 2'b01; AlUsrc = 1'b1; RegWr = 1'b1; MemWr = 1'b0; ALUcntrl = 3'b000; MemtoReg = 1'b0;
		rd =5'bx; rt = 5'd10; rs = 5'b00000; immediate = 16'b0;
		#6000
		regdst = 2'b01; AlUsrc = 1'b1; RegWr = 1'b1; MemWr = 1'b0; ALUcntrl = 3'b000; MemtoReg = 1'b0;
		rd =5'bx; rt = 5'd11; rs = 5'b00000; immediate = 16'b0;
		#6000
		regdst = 2'b01; AlUsrc = 1'b1; RegWr = 1'b1; MemWr = 1'b0; ALUcntrl = 3'b000; MemtoReg = 1'b0;
		rd =5'bx; rt = 5'd12; rs = 5'b00000; immediate = 16'b0;
		#6000
		regdst = 2'b01; AlUsrc = 1'b1; RegWr = 1'b1; MemWr = 1'b0; ALUcntrl = 3'b000; MemtoReg = 1'b0;
		rd =5'bx; rt = 5'd13; rs = 5'b00000; immediate = 16'b0;
		#6000
		regdst = 2'b01; AlUsrc = 1'b1; RegWr = 1'b1; MemWr = 1'b0; ALUcntrl = 3'b000; MemtoReg = 1'b0;
		rd =5'bx; rt = 5'd14; rs = 5'b00000; immediate = 16'b0;
		#6000
		regdst = 2'b01; AlUsrc = 1'b1; RegWr = 1'b1; MemWr = 1'b0; ALUcntrl = 3'b000; MemtoReg = 1'b0;
		rd =5'bx; rt = 5'd15; rs = 5'b00000; immediate = 16'b0;
		#6000
		regdst = 2'b01; AlUsrc = 1'b1; RegWr = 1'b1; MemWr = 1'b0; ALUcntrl = 3'b000; MemtoReg = 1'b0;
		rd =5'bx; rt = 5'd16; rs = 5'b00000; immediate = 16'b0;
		#6000
		regdst = 2'b01; AlUsrc = 1'b1; RegWr = 1'b1; MemWr = 1'b0; ALUcntrl = 3'b000; MemtoReg = 1'b0;
		rd =5'bx; rt = 5'd17; rs = 5'b00000; immediate = 16'b0;
		#6000
		regdst = 2'b01; AlUsrc = 1'b1; RegWr = 1'b1; MemWr = 1'b0; ALUcntrl = 3'b000; MemtoReg = 1'b0;
		rd =5'bx; rt = 5'd18; rs = 5'b00000; immediate = 16'b0;
		#6000
		regdst = 2'b01; AlUsrc = 1'b1; RegWr = 1'b1; MemWr = 1'b0; ALUcntrl = 3'b000; MemtoReg = 1'b0;
		rd =5'bx; rt = 5'd19; rs = 5'b00000; immediate = 16'b0;
		#6000
		regdst = 2'b01; AlUsrc = 1'b1; RegWr = 1'b1; MemWr = 1'b0; ALUcntrl = 3'b000; MemtoReg = 1'b0;
		rd =5'bx; rt = 5'd20; rs = 5'b00000; immediate = 16'b0;
		#6000
		regdst = 2'b01; AlUsrc = 1'b1; RegWr = 1'b1; MemWr = 1'b0; ALUcntrl = 3'b000; MemtoReg = 1'b0;
		rd =5'bx; rt = 5'd21; rs = 5'b00000; immediate = 16'b0;
		#6000
		regdst = 2'b01; AlUsrc = 1'b1; RegWr = 1'b1; MemWr = 1'b0; ALUcntrl = 3'b000; MemtoReg = 1'b0;
		rd =5'bx; rt = 5'd22; rs = 5'b00000; immediate = 16'b0;
		#6000
		regdst = 2'b01; AlUsrc = 1'b1; RegWr = 1'b1; MemWr = 1'b0; ALUcntrl = 3'b000; MemtoReg = 1'b0;
		rd =5'bx; rt = 5'd23; rs = 5'b00000; immediate = 16'b0;
		#6000
		regdst = 2'b01; AlUsrc = 1'b1; RegWr = 1'b1; MemWr = 1'b0; ALUcntrl = 3'b000; MemtoReg = 1'b0;
		rd =5'bx; rt = 5'd24; rs = 5'b00000; immediate = 16'b0;
		#6000
		regdst = 2'b01; AlUsrc = 1'b1; RegWr = 1'b1; MemWr = 1'b0; ALUcntrl = 3'b000; MemtoReg = 1'b0;
		rd =5'bx; rt = 5'd25; rs = 5'b00000; immediate = 16'b0;
		#6000
		regdst = 2'b01; AlUsrc = 1'b1; RegWr = 1'b1; MemWr = 1'b0; ALUcntrl = 3'b000; MemtoReg = 1'b0;
		rd =5'bx; rt = 5'd26; rs = 5'b00000; immediate = 16'b0;
		#6000
		regdst = 2'b01; AlUsrc = 1'b1; RegWr = 1'b1; MemWr = 1'b0; ALUcntrl = 3'b000; MemtoReg = 1'b0;
		rd =5'bx; rt = 5'd27; rs = 5'b00000; immediate = 16'b0;
		#6000
		regdst = 2'b01; AlUsrc = 1'b1; RegWr = 1'b1; MemWr = 1'b0; ALUcntrl = 3'b000; MemtoReg = 1'b0;
		rd =5'bx; rt = 5'd28; rs = 5'b00000; immediate = 16'b0;
		#6000
		regdst = 2'b01; AlUsrc = 1'b1; RegWr = 1'b1; MemWr = 1'b0; ALUcntrl = 3'b000; MemtoReg = 1'b0;
		rd =5'bx; rt = 5'd29; rs = 5'b00000; immediate = 16'b0;
		#6000
		regdst = 2'b01; AlUsrc = 1'b1; RegWr = 1'b1; MemWr = 1'b0; ALUcntrl = 3'b000; MemtoReg = 1'b0;
		rd =5'bx; rt = 5'd30; rs = 5'b00000; immediate = 16'b0;
		#6000
		regdst = 2'b01; AlUsrc = 1'b1; RegWr = 1'b1; MemWr = 1'b0; ALUcntrl = 3'b000; MemtoReg = 1'b0;
		rd =5'bx; rt = 5'd31; rs = 5'b00000; immediate = 16'b0;
		#6000


		// Test Case 2: Load Word
		regdst = 2'b01; AlUsrc = 1'b1; RegWr = 1'b1; MemWr = 1'b0; ALUcntrl = 3'b000; MemtoReg = 2'b01;
		rd = 5'bx; rt = 5'b00010; rs = 5'b00001; immediate = 16'b0;
		#100

		if (dut.databout !== dut.datamemory.memory[0]) begin
			$display("Test case 2 (LW) failed: R[rt] != M[R[rs] + signextendimmediate]");
		end

		// Test Case 3: Store Word
		regdst = 2'bx; AlUsrc = 1'b1; RegWr = 1'b0; MemWr = 1'b1; ALUcntrl = 3'b000; MemtoReg = 2'bx;
		rd = 5'bx; rs = 5'b00001; rt = 5'b00000; immediate = 16'b0;
		#100

		if (dut.datamemory.dataOut !== dut.databout) begin
			$display("Test case 3 failed: M[R[rs] + signextendimmediate] != R[rt]");
		end

		// Test Case 4: Jump
		// Test Case 5: Jump Register
		// Test Case 6: Jump and Link
		// Test Case 7: Branch if Not Equal
		// Test Case 8: XOR Immediate
		// Test Case 9: Add
		// Test Case 10: Subtract
		// Test Case 11: Set Less Than
		#10000

		$finish;
	end
endmodule