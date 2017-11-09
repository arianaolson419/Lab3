`timescale 1 ns / 1 ps
`include "or_32bit.v"

module test32bitor();
	reg[31:0] a;
	reg[31:0] b;
	wire[31:0] ans;

	or_32bit or32(ans, a[31:0], b[31:0]);

	initial begin
		a=32'b00000000000000000000000000000000; b=32'b00000000000000000000000000000000; #5000
		$display("%b %b | %b", a, b, ans);

		a=32'b00000000000000000000000000000001; b=32'b00000000000000000000000000000001; #5000
		$display("%b %b | %b", a, b, ans);

		a=32'b00000000000000000000000000000010; b=32'b00000000000000000000000000000001; #5000
		$display("%b %b | %b", a, b, ans);

		a=32'b00000000000000000000000000000000; b=32'b00000000000000000000000000000001; #5000
		$display("%b %b | %b", a, b, ans);

		a=32'b11000000000000000000000000000000; b=32'b10000000000000000000000000000001; #5000
		$display("%b %b | %b", a, b, ans);

		a=32'b10000000000000000000000000000000; b=32'b11000000000000000000000000000001; #5000
		$display("%b %b | %b", a, b, ans);
	end
endmodule