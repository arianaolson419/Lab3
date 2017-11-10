module isZeroAnd
(
	output[31:0] out,
	input[31:0] imm,
	input isZero
);
	assign out = (imm & {32{isZero}});
endmodule