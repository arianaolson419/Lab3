/*
Test bench for the core module of the CPU.
*/

`include "Core/Core.v"

module Core_TEST();
	reg CLK;
	reg [4:0] Rd;
	reg [4:0] Rt;
	reg [4:0] Rs;
	reg [15:0] imm;
	reg [31:0] addedPC;
	reg [0:1] RegDst;
	reg RegWr;
	reg MemWr;
	reg AlUSrc;
	reg [1:0] MemToReg;
	reg [2:0] ALUCntrl;

	wire [31:0] Da;
	wire isZero;

	Core dut (CLK, Rd, Rt, Rs, imm, addedPC, RegDst, RegWr, MemWr, AlUSrc, MemToReg, ALUCntrl, Da, isZero);

	initial CLK = 0;
	always #10 CLK = !CLK;

	initial begin
		$dumpfile("Core/Core.vcd");
		$dumpvars(0, Core_TEST, dut.datamemory.memory[0], dut.datamemory.memory[1]);

		// Test Case 1: Add Imm
		RegDst = 2'b01; AlUSrc = 1'b1; RegWr = 1'b1; MemWr = 1'b0; ALUCntrl = 3'b000; MemToReg = 1'b0;
		Rd =5'bx; Rt = 5'd1; Rs = 5'b00000; imm = 16'b0;
		#6000

		if (dut.databout !== 32'b0) begin
			$display("Test case 1 failed: R[rt] != R[rs] + 32'b0 at time %t", $time);
		end

		// Populate the rest of the registers with data (each gets 32'b0)
		RegDst = 2'b01; AlUSrc = 1'b1; RegWr = 1'b1; MemWr = 1'b0; ALUCntrl = 3'b000; MemToReg = 1'b0;
		Rd =5'bx; Rt = 5'd2; Rs = 5'b00000; imm = 16'b0;
		#6000
		RegDst = 2'b01; AlUSrc = 1'b1; RegWr = 1'b1; MemWr = 1'b0; ALUCntrl = 3'b000; MemToReg = 1'b0;
		Rd =5'bx; Rt = 5'd3; Rs = 5'b00000; imm = 16'b0;
		#6000
		RegDst = 2'b01; AlUSrc = 1'b1; RegWr = 1'b1; MemWr = 1'b0; ALUCntrl = 3'b000; MemToReg = 1'b0;
		Rd =5'bx; Rt = 5'd4; Rs = 5'b00000; imm = 16'b0;
		#6000
		RegDst = 2'b01; AlUSrc = 1'b1; RegWr = 1'b1; MemWr = 1'b0; ALUCntrl = 3'b000; MemToReg = 1'b0;
		Rd =5'bx; Rt = 5'd5; Rs = 5'b00000; imm = 16'b0;
		#6000
		RegDst = 2'b01; AlUSrc = 1'b1; RegWr = 1'b1; MemWr = 1'b0; ALUCntrl = 3'b000; MemToReg = 1'b0;
		Rd =5'bx; Rt = 5'd6; Rs = 5'b00000; imm = 16'b0;
		#6000
		RegDst = 2'b01; AlUSrc = 1'b1; RegWr = 1'b1; MemWr = 1'b0; ALUCntrl = 3'b000; MemToReg = 1'b0;
		Rd =5'bx; Rt = 5'd7; Rs = 5'b00000; imm = 16'b0;
		#6000
		RegDst = 2'b01; AlUSrc = 1'b1; RegWr = 1'b1; MemWr = 1'b0; ALUCntrl = 3'b000; MemToReg = 1'b0;
		Rd =5'bx; Rt = 5'd8; Rs = 5'b00000; imm = 16'b0;
		#6000
		RegDst = 2'b01; AlUSrc = 1'b1; RegWr = 1'b1; MemWr = 1'b0; ALUCntrl = 3'b000; MemToReg = 1'b0;
		Rd =5'bx; Rt = 5'd9; Rs = 5'b00000; imm = 16'b0;
		#6000
		RegDst = 2'b01; AlUSrc = 1'b1; RegWr = 1'b1; MemWr = 1'b0; ALUCntrl = 3'b000; MemToReg = 1'b0;
		Rd =5'bx; Rt = 5'd10; Rs = 5'b00000; imm = 16'b0;
		#6000
		RegDst = 2'b01; AlUSrc = 1'b1; RegWr = 1'b1; MemWr = 1'b0; ALUCntrl = 3'b000; MemToReg = 1'b0;
		Rd =5'bx; Rt = 5'd11; Rs = 5'b00000; imm = 16'b0;
		#6000
		RegDst = 2'b01; AlUSrc = 1'b1; RegWr = 1'b1; MemWr = 1'b0; ALUCntrl = 3'b000; MemToReg = 1'b0;
		Rd =5'bx; Rt = 5'd12; Rs = 5'b00000; imm = 16'b0;
		#6000
		RegDst = 2'b01; AlUSrc = 1'b1; RegWr = 1'b1; MemWr = 1'b0; ALUCntrl = 3'b000; MemToReg = 1'b0;
		Rd =5'bx; Rt = 5'd13; Rs = 5'b00000; imm = 16'b0;
		#6000
		RegDst = 2'b01; AlUSrc = 1'b1; RegWr = 1'b1; MemWr = 1'b0; ALUCntrl = 3'b000; MemToReg = 1'b0;
		Rd =5'bx; Rt = 5'd14; Rs = 5'b00000; imm = 16'b0;
		#6000
		RegDst = 2'b01; AlUSrc = 1'b1; RegWr = 1'b1; MemWr = 1'b0; ALUCntrl = 3'b000; MemToReg = 1'b0;
		Rd =5'bx; Rt = 5'd15; Rs = 5'b00000; imm = 16'b0;
		#6000
		RegDst = 2'b01; AlUSrc = 1'b1; RegWr = 1'b1; MemWr = 1'b0; ALUCntrl = 3'b000; MemToReg = 1'b0;
		Rd =5'bx; Rt = 5'd16; Rs = 5'b00000; imm = 16'b0;
		#6000
		RegDst = 2'b01; AlUSrc = 1'b1; RegWr = 1'b1; MemWr = 1'b0; ALUCntrl = 3'b000; MemToReg = 1'b0;
		Rd =5'bx; Rt = 5'd17; Rs = 5'b00000; imm = 16'b0;
		#6000
		RegDst = 2'b01; AlUSrc = 1'b1; RegWr = 1'b1; MemWr = 1'b0; ALUCntrl = 3'b000; MemToReg = 1'b0;
		Rd =5'bx; Rt = 5'd18; Rs = 5'b00000; imm = 16'b0;
		#6000
		RegDst = 2'b01; AlUSrc = 1'b1; RegWr = 1'b1; MemWr = 1'b0; ALUCntrl = 3'b000; MemToReg = 1'b0;
		Rd =5'bx; Rt = 5'd19; Rs = 5'b00000; imm = 16'b0;
		#6000
		RegDst = 2'b01; AlUSrc = 1'b1; RegWr = 1'b1; MemWr = 1'b0; ALUCntrl = 3'b000; MemToReg = 1'b0;
		Rd =5'bx; Rt = 5'd20; Rs = 5'b00000; imm = 16'b0;
		#6000
		RegDst = 2'b01; AlUSrc = 1'b1; RegWr = 1'b1; MemWr = 1'b0; ALUCntrl = 3'b000; MemToReg = 1'b0;
		Rd =5'bx; Rt = 5'd21; Rs = 5'b00000; imm = 16'b0;
		#6000
		RegDst = 2'b01; AlUSrc = 1'b1; RegWr = 1'b1; MemWr = 1'b0; ALUCntrl = 3'b000; MemToReg = 1'b0;
		Rd =5'bx; Rt = 5'd22; Rs = 5'b00000; imm = 16'b0;
		#6000
		RegDst = 2'b01; AlUSrc = 1'b1; RegWr = 1'b1; MemWr = 1'b0; ALUCntrl = 3'b000; MemToReg = 1'b0;
		Rd =5'bx; Rt = 5'd23; Rs = 5'b00000; imm = 16'b0;
		#6000
		RegDst = 2'b01; AlUSrc = 1'b1; RegWr = 1'b1; MemWr = 1'b0; ALUCntrl = 3'b000; MemToReg = 1'b0;
		Rd =5'bx; Rt = 5'd24; Rs = 5'b00000; imm = 16'b0;
		#6000
		RegDst = 2'b01; AlUSrc = 1'b1; RegWr = 1'b1; MemWr = 1'b0; ALUCntrl = 3'b000; MemToReg = 1'b0;
		Rd =5'bx; Rt = 5'd25; Rs = 5'b00000; imm = 16'b0;
		#6000
		RegDst = 2'b01; AlUSrc = 1'b1; RegWr = 1'b1; MemWr = 1'b0; ALUCntrl = 3'b000; MemToReg = 1'b0;
		Rd =5'bx; Rt = 5'd26; Rs = 5'b00000; imm = 16'b0;
		#6000
		RegDst = 2'b01; AlUSrc = 1'b1; RegWr = 1'b1; MemWr = 1'b0; ALUCntrl = 3'b000; MemToReg = 1'b0;
		Rd =5'bx; Rt = 5'd27; Rs = 5'b00000; imm = 16'b0;
		#6000
		RegDst = 2'b01; AlUSrc = 1'b1; RegWr = 1'b1; MemWr = 1'b0; ALUCntrl = 3'b000; MemToReg = 1'b0;
		Rd =5'bx; Rt = 5'd28; Rs = 5'b00000; imm = 16'b0;
		#6000
		RegDst = 2'b01; AlUSrc = 1'b1; RegWr = 1'b1; MemWr = 1'b0; ALUCntrl = 3'b000; MemToReg = 1'b0;
		Rd =5'bx; Rt = 5'd29; Rs = 5'b00000; imm = 16'b0;
		#6000
		RegDst = 2'b01; AlUSrc = 1'b1; RegWr = 1'b1; MemWr = 1'b0; ALUCntrl = 3'b000; MemToReg = 1'b0;
		Rd =5'bx; Rt = 5'd30; Rs = 5'b00000; imm = 16'b0;
		#6000
		RegDst = 2'b01; AlUSrc = 1'b1; RegWr = 1'b1; MemWr = 1'b0; ALUCntrl = 3'b000; MemToReg = 1'b0;
		Rd =5'bx; Rt = 5'd31; Rs = 5'b00000; imm = 16'b0;
		#6000


		// Test Case 2: Load Word
		RegDst = 2'b01; AlUSrc = 1'b1; RegWr = 1'b1; MemWr = 1'b0; ALUCntrl = 3'b000; MemToReg = 2'b01;
		Rd = 5'bx; Rt = 5'b00010; Rs = 5'b00001; imm = 16'b0;
		#1000

		if (dut.databout !== dut.datamemory.memory[0]) begin
			$display("Test case 2 (LW) failed: R[rt] != M[R[rs] + signextendimm] at time %t", $time);
		end

		// Test Case 3: Store Word
		RegDst = 2'bx; AlUSrc = 1'b1; RegWr = 1'b0; MemWr = 1'b1; ALUCntrl = 3'b000; MemToReg = 2'bx;
		Rd = 5'bx; Rs = 5'b00001; Rt = 5'b00000; imm = 16'b0;
		#1000

		if (dut.datamemory.dataOut !== dut.databout) begin
			$display("Test case 3 failed: M[R[rs] + signextendimm] != R[rt] at time %t", $time);
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