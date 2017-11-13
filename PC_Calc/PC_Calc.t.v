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
	
	PC_Calc pccalc(old_PC[31:0], isZero, PCSel[1:0], AddSel, Da[31:0], addr[25:0], imm[15:0], added_PC[31:0], new_PC[31:0], addedSel[31:0], jump[31:0]);
	initial begin
		$display("added_PC                         | new_PC");
		old_PC = 32'd4;
		isZero = 0;
		PCSel = 0;
		AddSel = 0;
		Da = 32'd16;
		addr = 26'd12;
		imm = 16'd10; #1000
		$display("expected 8 and 48");
		$display("%b | %b", added_PC, new_PC);

		old_PC = 32'b01010000000000000000000000000000;
		isZero = 0;
		PCSel = 0;
		AddSel = 0;
		Da = 32'd16;
		addr = 26'd12;
		imm = 16'd10; #1000
		$display("expected 01010000000000000000000000000100 and 01010000000000000000000000110000");
		$display("%b | %b", added_PC, new_PC);
	end
endmodule