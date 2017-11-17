`timescale 1 ns / 1 ps
`include "PC_Calc.v"

module testPCCalc();
	reg[31:0] old_PC;
    reg isZero;
    reg[1:0] PCSel;
    reg AddSel;
    reg[31:0] Da;
    reg[25:0] addr;
    reg[15:0] imm;
    wire[31:0] added_PC;
    wire[31:0] new_PC;

    wire[31:0] addedSel;
    wire[31:0] jump;
	
	PC_Calc pccalc(old_PC[31:0], isZero, PCSel[1:0], AddSel, Da[31:0], addr[25:0], imm[15:0], added_PC[31:0], new_PC[31:0]);
	initial begin
		old_PC = 32'd4;
		isZero = 0;
		PCSel = 0;
		AddSel = 0;
		Da = 32'd16;
		addr = 26'd12;
		imm = 16'd10; #1000
		if (added_PC != 32'd8 || new_PC != 32'd48) begin
			$display("test case failed, expected 8 and 48");
			$display("added_PC: %b | new_PC: %b", added_PC, new_PC);
		end		

		old_PC = 32'b01010000000000000000000000000000;
		isZero = 0;
		PCSel = 0;
		AddSel = 0;
		Da = 32'd16;
		addr = 26'd12;
		imm = 16'd10; #1000
		if (added_PC != 32'd8 || new_PC != 32'd48) begin
			$display("test case failed, expected 01010000000000000000000000000100 and 01010000000000000000000000110000");
			$display("added_PC: %b | new_PC: %b", added_PC, new_PC);
		end		
	end
endmodule