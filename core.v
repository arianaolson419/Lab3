/*
The section of the CPU containing the register file, data memory, and ALU.
*/

`include "alu.v"
`include "memory.v"
`include "regfile.v"
`include "signextend.v"

module core
(
	input clk,
	input [5:0] rd,
	input [5:0] rt,
	input [5:0] rs,
	input [15:0] immediate,
	input [31:0] new_PC,
	input [0:1] regdst,
	input [2:0] ALUcntrl,
	input AlUsrc,
	input MemWr,
	input RegWr,
	input [1:0] MemtoReg,
	output [31:0] Da,
	output is_zero
);

	wire[5:0] writeaddr;

	// Register file write address
	mux4input #(.width(6)) regwriteaddr (rd, rt, 6'd31, 6'bx, regdst, writeaddr);

	wire[31:0] dataaout;
	wire[31:0] databout;
	wire[31:0] datain;

	// Register file
	regfile regfile (dataaout, databout, datain, rs, rt, writeaddr, RegWr, clk);

	// Sign extend

	wire[31:0] signextimm;
	signextend extend (immediate, signextimm);

	// ALU operand 2 mux
	wire[31:0] operandb;

	mux4input #(.width(32)) aluinput (databout, signextimm, 32'bx, 32'bx, {1'b0, AlUsrc}, operandb);

	// ALU
	wire cout;
	wire overflow;
	wire[31:0] finalsignal;

	ALUcontrolLUT aluout (cout, overflow, is_zero, finalsignal, ALUcntrl, databout, operandb);

	// Regfile write data mux
	reg[31:0] memout;

	mux4input #(.width(32)) regdatamux (finalsignal, memout, new_PC, 32'bx, MemtoReg, datain);


endmodule