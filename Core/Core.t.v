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

		if (dut.databout !== 32'b0) begin
			$display("Test case 1 failed: R[rt] != R[rs] + 32'b0 at time %t", $time);
		end

		RegDst = 2'b01; AlUSrc = 1'b1; RegWr = 1'b1; MemWr = 1'b0; ALUCntrl = 3'b000; MemToReg = 1'b0;
		Rd =5'bx; Rt = 5'd3; Rs = 5'b00000; imm = 16'b0;
		#6000

		if (dut.databout !== 32'b0) begin
			$display("Test case 1 failed: R[rt] != R[rs] + 32'b0 at time %t", $time);
		end

		RegDst = 2'b01; AlUSrc = 1'b1; RegWr = 1'b1; MemWr = 1'b0; ALUCntrl = 3'b000; MemToReg = 1'b0;
		Rd =5'bx; Rt = 5'd4; Rs = 5'b00000; imm = 16'b0;
		#6000

		if (dut.databout !== 32'b0) begin
			$display("Test case 1 failed: R[rt] != R[rs] + 32'b0 at time %t", $time);
		end

		RegDst = 2'b01; AlUSrc = 1'b1; RegWr = 1'b1; MemWr = 1'b0; ALUCntrl = 3'b000; MemToReg = 1'b0;
		Rd =5'bx; Rt = 5'd5; Rs = 5'b00000; imm = 16'b0;
		#6000

		if (dut.databout !== 32'b0) begin
			$display("Test case 1 failed: R[rt] != R[rs] + 32'b0 at time %t", $time);
		end

		RegDst = 2'b01; AlUSrc = 1'b1; RegWr = 1'b1; MemWr = 1'b0; ALUCntrl = 3'b000; MemToReg = 1'b0;
		Rd =5'bx; Rt = 5'd6; Rs = 5'b00000; imm = 16'b0;
		#6000

		if (dut.databout !== 32'b0) begin
			$display("Test case 1 failed: R[rt] != R[rs] + 32'b0 at time %t", $time);
		end

		RegDst = 2'b01; AlUSrc = 1'b1; RegWr = 1'b1; MemWr = 1'b0; ALUCntrl = 3'b000; MemToReg = 1'b0;
		Rd =5'bx; Rt = 5'd7; Rs = 5'b00000; imm = 16'b0;
		#6000

		if (dut.databout !== 32'b0) begin
			$display("Test case 1 failed: R[rt] != R[rs] + 32'b0 at time %t", $time);
		end

		RegDst = 2'b01; AlUSrc = 1'b1; RegWr = 1'b1; MemWr = 1'b0; ALUCntrl = 3'b000; MemToReg = 1'b0;
		Rd =5'bx; Rt = 5'd8; Rs = 5'b00000; imm = 16'b0;
		#6000

		if (dut.databout !== 32'b0) begin
			$display("Test case 1 failed: R[rt] != R[rs] + 32'b0 at time %t", $time);
		end

		RegDst = 2'b01; AlUSrc = 1'b1; RegWr = 1'b1; MemWr = 1'b0; ALUCntrl = 3'b000; MemToReg = 1'b0;
		Rd =5'bx; Rt = 5'd9; Rs = 5'b00000; imm = 16'b0;
		#6000

		if (dut.databout !== 32'b0) begin
			$display("Test case 1 failed: R[rt] != R[rs] + 32'b0 at time %t", $time);
		end

		RegDst = 2'b01; AlUSrc = 1'b1; RegWr = 1'b1; MemWr = 1'b0; ALUCntrl = 3'b000; MemToReg = 1'b0;
		Rd =5'bx; Rt = 5'd10; Rs = 5'b00000; imm = 16'b0;
		#6000

		if (dut.databout !== 32'b0) begin
			$display("Test case 1 failed: R[rt] != R[rs] + 32'b0 at time %t", $time);
		end

		RegDst = 2'b01; AlUSrc = 1'b1; RegWr = 1'b1; MemWr = 1'b0; ALUCntrl = 3'b000; MemToReg = 1'b0;
		Rd =5'bx; Rt = 5'd11; Rs = 5'b00000; imm = 16'b0;
		#6000

		if (dut.databout !== 32'b0) begin
			$display("Test case 1 failed: R[rt] != R[rs] + 32'b0 at time %t", $time);
		end

		RegDst = 2'b01; AlUSrc = 1'b1; RegWr = 1'b1; MemWr = 1'b0; ALUCntrl = 3'b000; MemToReg = 1'b0;
		Rd =5'bx; Rt = 5'd12; Rs = 5'b00000; imm = 16'b0;
		#6000

		if (dut.databout !== 32'b0) begin
			$display("Test case 1 failed: R[rt] != R[rs] + 32'b0 at time %t", $time);
		end

		RegDst = 2'b01; AlUSrc = 1'b1; RegWr = 1'b1; MemWr = 1'b0; ALUCntrl = 3'b000; MemToReg = 1'b0;
		Rd =5'bx; Rt = 5'd13; Rs = 5'b00000; imm = 16'b0;
		#6000

		if (dut.databout !== 32'b0) begin
			$display("Test case 1 failed: R[rt] != R[rs] + 32'b0 at time %t", $time);
		end

		RegDst = 2'b01; AlUSrc = 1'b1; RegWr = 1'b1; MemWr = 1'b0; ALUCntrl = 3'b000; MemToReg = 1'b0;
		Rd =5'bx; Rt = 5'd14; Rs = 5'b00000; imm = 16'b0;
		#6000

		if (dut.databout !== 32'b0) begin
			$display("Test case 1 failed: R[rt] != R[rs] + 32'b0 at time %t", $time);
		end

		RegDst = 2'b01; AlUSrc = 1'b1; RegWr = 1'b1; MemWr = 1'b0; ALUCntrl = 3'b000; MemToReg = 1'b0;
		Rd =5'bx; Rt = 5'd15; Rs = 5'b00000; imm = 16'b0;
		#6000

		if (dut.databout !== 32'b0) begin
			$display("Test case 1 failed: R[rt] != R[rs] + 32'b0 at time %t", $time);
		end

		RegDst = 2'b01; AlUSrc = 1'b1; RegWr = 1'b1; MemWr = 1'b0; ALUCntrl = 3'b000; MemToReg = 1'b0;
		Rd =5'bx; Rt = 5'd16; Rs = 5'b00000; imm = 16'b0;
		#6000

		if (dut.databout !== 32'b0) begin
			$display("Test case 1 failed: R[rt] != R[rs] + 32'b0 at time %t", $time);
		end

		RegDst = 2'b01; AlUSrc = 1'b1; RegWr = 1'b1; MemWr = 1'b0; ALUCntrl = 3'b000; MemToReg = 1'b0;
		Rd =5'bx; Rt = 5'd17; Rs = 5'b00000; imm = 16'b0;
		#6000

		if (dut.databout !== 32'b0) begin
			$display("Test case 1 failed: R[rt] != R[rs] + 32'b0 at time %t", $time);
		end

		RegDst = 2'b01; AlUSrc = 1'b1; RegWr = 1'b1; MemWr = 1'b0; ALUCntrl = 3'b000; MemToReg = 1'b0;
		Rd =5'bx; Rt = 5'd18; Rs = 5'b00000; imm = 16'b0;
		#6000

		if (dut.databout !== 32'b0) begin
			$display("Test case 1 failed: R[rt] != R[rs] + 32'b0 at time %t", $time);
		end

		RegDst = 2'b01; AlUSrc = 1'b1; RegWr = 1'b1; MemWr = 1'b0; ALUCntrl = 3'b000; MemToReg = 1'b0;
		Rd =5'bx; Rt = 5'd19; Rs = 5'b00000; imm = 16'b0;
		#6000

		if (dut.databout !== 32'b0) begin
			$display("Test case 1 failed: R[rt] != R[rs] + 32'b0 at time %t", $time);
		end

		RegDst = 2'b01; AlUSrc = 1'b1; RegWr = 1'b1; MemWr = 1'b0; ALUCntrl = 3'b000; MemToReg = 1'b0;
		Rd =5'bx; Rt = 5'd20; Rs = 5'b00000; imm = 16'b0;
		#6000

		if (dut.databout !== 32'b0) begin
			$display("Test case 1 failed: R[rt] != R[rs] + 32'b0 at time %t", $time);
		end

		RegDst = 2'b01; AlUSrc = 1'b1; RegWr = 1'b1; MemWr = 1'b0; ALUCntrl = 3'b000; MemToReg = 1'b0;
		Rd =5'bx; Rt = 5'd21; Rs = 5'b00000; imm = 16'b0;
		#6000

		if (dut.databout !== 32'b0) begin
			$display("Test case 1 failed: R[rt] != R[rs] + 32'b0 at time %t", $time);
		end

		RegDst = 2'b01; AlUSrc = 1'b1; RegWr = 1'b1; MemWr = 1'b0; ALUCntrl = 3'b000; MemToReg = 1'b0;
		Rd =5'bx; Rt = 5'd22; Rs = 5'b00000; imm = 16'b0;
		#6000

		if (dut.databout !== 32'b0) begin
			$display("Test case 1 failed: R[rt] != R[rs] + 32'b0 at time %t", $time);
		end

		RegDst = 2'b01; AlUSrc = 1'b1; RegWr = 1'b1; MemWr = 1'b0; ALUCntrl = 3'b000; MemToReg = 1'b0;
		Rd =5'bx; Rt = 5'd23; Rs = 5'b00000; imm = 16'b0;
		#6000

		if (dut.databout !== 32'b0) begin
			$display("Test case 1 failed: R[rt] != R[rs] + 32'b0 at time %t", $time);
		end

		RegDst = 2'b01; AlUSrc = 1'b1; RegWr = 1'b1; MemWr = 1'b0; ALUCntrl = 3'b000; MemToReg = 1'b0;
		Rd =5'bx; Rt = 5'd24; Rs = 5'b00000; imm = 16'b0;
		#6000

		if (dut.databout !== 32'b0) begin
			$display("Test case 1 failed: R[rt] != R[rs] + 32'b0 at time %t", $time);
		end

		RegDst = 2'b01; AlUSrc = 1'b1; RegWr = 1'b1; MemWr = 1'b0; ALUCntrl = 3'b000; MemToReg = 1'b0;
		Rd =5'bx; Rt = 5'd25; Rs = 5'b00000; imm = 16'b0;
		#6000

		if (dut.databout !== 32'b0) begin
			$display("Test case 1 failed: R[rt] != R[rs] + 32'b0 at time %t", $time);
		end

		RegDst = 2'b01; AlUSrc = 1'b1; RegWr = 1'b1; MemWr = 1'b0; ALUCntrl = 3'b000; MemToReg = 1'b0;
		Rd =5'bx; Rt = 5'd26; Rs = 5'b00000; imm = 16'b0;
		#6000

		if (dut.databout !== 32'b0) begin
			$display("Test case 1 failed: R[rt] != R[rs] + 32'b0 at time %t", $time);
		end

		RegDst = 2'b01; AlUSrc = 1'b1; RegWr = 1'b1; MemWr = 1'b0; ALUCntrl = 3'b000; MemToReg = 1'b0;
		Rd =5'bx; Rt = 5'd27; Rs = 5'b00000; imm = 16'b0;
		#6000

		if (dut.databout !== 32'b0) begin
			$display("Test case 1 failed: R[rt] != R[rs] + 32'b0 at time %t", $time);
		end

		RegDst = 2'b01; AlUSrc = 1'b1; RegWr = 1'b1; MemWr = 1'b0; ALUCntrl = 3'b000; MemToReg = 1'b0;
		Rd =5'bx; Rt = 5'd28; Rs = 5'b00000; imm = 16'b0;
		#6000

		if (dut.databout !== 32'b0) begin
			$display("Test case 1 failed: R[rt] != R[rs] + 32'b0 at time %t", $time);
		end

		RegDst = 2'b01; AlUSrc = 1'b1; RegWr = 1'b1; MemWr = 1'b0; ALUCntrl = 3'b000; MemToReg = 1'b0;
		Rd =5'bx; Rt = 5'd29; Rs = 5'b00000; imm = 16'b0;
		#6000

		if (dut.databout !== 32'b0) begin
			$display("Test case 1 failed: R[rt] != R[rs] + 32'b0 at time %t", $time);
		end

		RegDst = 2'b01; AlUSrc = 1'b1; RegWr = 1'b1; MemWr = 1'b0; ALUCntrl = 3'b000; MemToReg = 1'b0;
		Rd =5'bx; Rt = 5'd30; Rs = 5'b00000; imm = 16'b0;
		#6000

		if (dut.databout !== 32'b0) begin
			$display("Test case 1 failed: R[rt] != R[rs] + 32'b0 at time %t", $time);
		end

		RegDst = 2'b01; AlUSrc = 1'b1; RegWr = 1'b1; MemWr = 1'b0; ALUCntrl = 3'b000; MemToReg = 1'b0;
		Rd =5'bx; Rt = 5'd31; Rs = 5'b00000; imm = 16'b0;
		#6000

		if (dut.databout !== 32'b0) begin
			$display("Test case 1 failed: R[rt] != R[rs] + 32'b0 at time %t", $time);
		end

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

		// Test Case 4: Jump and Link
		RegDst = 2'b10; AlUSrc = 1'bx; RegWr = 1'b1; MemWr = 1'b0; ALUCntrl = 3'bx; MemToReg = 2'b10;
		Rd = 5'bx; Rs = 5'd31; Rt = 5'bx; imm = 16'bx; addedPC = 5'd25;
		#1000

		if (Da !== addedPC) begin
			$display("Test case 4 failed: PC value not saved to correct register at time %t", $time);
		end

		#1000

		// Test Case 5: Branch if Not Equal
		// Load Immediate into registers 16 and 17 so that they are not equal.
		RegDst = 2'b01; AlUSrc = 1'b1; RegWr = 1'b1; MemWr = 1'b0; ALUCntrl = 3'b000; MemToReg = 1'b0;
		Rd =5'bx; Rt = 5'd16; Rs = 5'b00000; imm = 16'd16;	// R[16] = 0 + 16 = 16
		#6000
		RegDst = 2'b01; AlUSrc = 1'b1; RegWr = 1'b1; MemWr = 1'b0; ALUCntrl = 3'b000; MemToReg = 1'b0;
		Rd =5'bx; Rt = 5'd17; Rs = 5'b00000; imm = 16'd17;	// R[17] = 0 + 17 = 17
		#6000

		RegDst = 2'bx; AlUSrc = 1'b0; RegWr = 1'b0; MemWr = 1'b0; ALUCntrl = 3'b001; MemToReg = 2'bx;
		Rd = 5'dx; Rs = 5'd16; Rt = 5'd17; imm = 16'bx;
		#6000

		if (dut.regfile.register16out === dut.regfile.register17out) begin
			$display("Error: R[rs] should not equal R[rt]");
		end

		if (isZero === 1'b1) begin
			$display("Test case 5 failed: R[Rs] == R[Rt] indicated, but these values are not equal at time %t", $time);
		end

		// Load Immediate into registers 16 and 17 so that they are equal.
		RegDst = 2'b01; AlUSrc = 1'b1; RegWr = 1'b1; MemWr = 1'b0; ALUCntrl = 3'b000; MemToReg = 1'b0;
		Rd =5'bx; Rt = 5'd16; Rs = 5'b00000; imm = 16'd15;	// R[16] = 0 + 15 = 15
		#6000
		RegDst = 2'b01; AlUSrc = 1'b1; RegWr = 1'b1; MemWr = 1'b0; ALUCntrl = 3'b000; MemToReg = 1'b0;
		Rd =5'bx; Rt = 5'd17; Rs = 5'b00000; imm = 16'd15;	// R[17] = 0 + 15 = 15
		#6000

		RegDst = 2'bx; AlUSrc = 1'b0; RegWr = 1'b0; MemWr = 1'b0; ALUCntrl = 3'b001; MemToReg = 2'bx;
		Rd = 5'dx; Rs = 5'd16; Rt = 5'd17; imm = 16'bx;
		#6000

		if (dut.regfile.register16out !== dut.regfile.register17out) begin
			$display("Error: R[rs] should equal R[rt]");
		end

		if (isZero === 1'b0) begin
			$display("Test case 5 failed: R[Rs] != R[Rt] indicated, but these values are equal at time %t", $time);
		end

		// Test Case 6: XOR Immediate
		// Load Immediate into register 17
		RegDst = 2'b01; AlUSrc = 1'b1; RegWr = 1'b1; MemWr = 1'b0; ALUCntrl = 3'b000; MemToReg = 1'b0;
		Rd =5'bx; Rt = 5'd17; Rs = 5'b00000; imm = 16'h00005555;
		#6000

		RegDst = 2'b01; AlUSrc = 1'b1; RegWr = 1'b1; MemWr = 1'b0; ALUCntrl = 3'b010; MemToReg = 2'b0;
		Rd = 5'dx; Rs = 5'd17; Rt = 5'd16; imm = 16'h00005555;
		#6000

		if (dut.databout != 32'b0) begin
			$display("Test case 6 failed: R[Rs] == signextendimm and R[Rs] XOR signextendimm != 32'b0 at time %t", $time);
		end

		RegDst = 2'b01; AlUSrc = 1'b1; RegWr = 1'b1; MemWr = 1'b0; ALUCntrl = 3'b010; MemToReg = 2'b0;
		Rd = 5'dx; Rs = 5'd17; Rt = 5'd16; imm = 16'h0000aaaa;
		#6000

		// Test Case 7: Add
		// Load Immediate into register 20
		RegDst = 2'b01; AlUSrc = 1'b1; RegWr = 1'b1; MemWr = 1'b0; ALUCntrl = 3'b000; MemToReg = 1'b0;
		Rd =5'bx; Rt = 5'd20; Rs = 5'b00000; imm = 16'd25;
		#6000

		// Load Immediate into register 3
		RegDst = 2'b01; AlUSrc = 1'b1; RegWr = 1'b1; MemWr = 1'b0; ALUCntrl = 3'b000; MemToReg = 1'b0;
		Rd =5'bx; Rt = 5'd3; Rs = 5'b00000; imm = 16'd19;
		#6000

		RegDst = 2'b0; AlUSrc = 1'b0; RegWr = 1'b1; MemWr = 1'b0; ALUCntrl = 3'b000; MemToReg = 2'b0;
		Rd = 5'd5; Rs = 5'd20; Rt = 5'd3; imm = 16'bx;
		#6000

		if (dut.regfile.register5out !== 32'd44) begin
			$display("Test case 7 failed: R[Rd] != R[Rs] + R[Rt] at time %t", $time);
		end

		// Test Case 8: Subtract
		RegDst = 2'b0; AlUSrc = 1'b0; RegWr = 1'b1; MemWr = 1'b0; ALUCntrl = 3'b001; MemToReg = 2'b0;
		Rd = 5'd5; Rs = 5'd20; Rt = 5'd3; imm = 16'bx;
		#6000

		if (dut.regfile.register5out !== 32'd6) begin
			$display("Test case 8 failed: R[Rd] != R[Rs] - R[Rt] at time %t", $time);
		end

		// Test Case 9: Set Less Than
		RegDst = 2'b0; AlUSrc = 1'b0; RegWr = 1'b1; MemWr = 1'b0; ALUCntrl = 3'b011; MemToReg = 2'b0;
		Rd = 5'd5; Rs = 5'd20; Rt = 5'd3; imm = 16'bx;
		#6000

		if (dut.regfile.register5out !== 32'b0) begin
			$display("Test case 9 failed: R[Rd] is not zero, but R[Rs] !< R[Rt] at time %t", $time);
		end

		RegDst = 2'b0; AlUSrc = 1'b0; RegWr = 1'b1; MemWr = 1'b0; ALUCntrl = 3'b011; MemToReg = 2'b0;
		Rd = 5'd5; Rs = 5'd3; Rt = 5'd20; imm = 16'bx;
		#6000

		if (dut.regfile.register5out !== 32'b1) begin
			$display("Test case 9 failed: R[Rd] is not one, but R[Rs] < R[Rt] at time %t", $time);
		end

		RegDst = 2'b0; AlUSrc = 1'b0; RegWr = 1'b1; MemWr = 1'b0; ALUCntrl = 3'b011; MemToReg = 2'b0;
		Rd = 5'd5; Rs = 5'd20; Rt = 5'd20; imm = 16'bx;
		#6000

		if (dut.regfile.register5out !== 32'b0) begin
			$display("Test case 9 failed: R[Rd] is not zero, but R[Rs] == R[Rt] at time %t", $time);
		end

		$finish;
	end
endmodule