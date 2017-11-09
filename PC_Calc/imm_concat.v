module immConcat
(
	output[31:0] out,
	input[15:0] imm
);
	assign out = {{14{imm[15]}}, imm, 2'b00};
endmodule