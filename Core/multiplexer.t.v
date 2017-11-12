//--------------------------------
// Test the multiplexer modules.
//--------------------------------

`include "Core/multiplexer.v"

// Test harness for multiplexer unit test modules.
module multiplexerTestBenchHarness();
	reg begintest0;
	reg begintest1;
	wire endtest0;
	wire endtest1;
	wire dutpassed0;
	wire dutpassed1;

	mux32to1by1Test test0 (begintest0, endtest0, dutpassed0);
	mux32to32by1Test test1 (begintest1, endtest1, dutpassed1);

	initial begin
		begintest0 = 0;
		begintest1 = 0;
		#10;
		begintest0 = 1;
		begintest1 = 1;
		#1000;
	end

	always @(posedge endtest0 && endtest1) begin
		if (dutpassed0 == 1 || dutpassed1 == 1) begin
			$display("All multiplexer tests passed.");
		end
	end

endmodule // multiplexerTestBenchHarness

// Unit test the 32:1 mux module.
module mux32to1by1Test
	(
	input begintest,
	output reg endtest,
	output reg dutpassed
	);
	wire out;
	reg[4:0] address;
	reg[31:0] inputs;

	mux32to1by1 DUT (out, address, inputs);

	always @(posedge begintest) begin
		endtest = 0;
		dutpassed = 1;

		// Test Case 1:
		// Ensure that out is the same as the bit of the input at the 
		// given address.
		inputs = 32'h000FFF; address = 5'd9;
		if (out != 1) begin
			$display("32:1 mux Test Case 1 Failed.");
			dutpassed = 0;
		end

		#5
		endtest = 1;
	end
endmodule // mux32to1by1Test

module mux4inputTest
	(
		input begintest,
		output reg endtest,
		output reg dutpassed
	);

	reg[5:0] input0, input1, input2, input3;
	reg[1:0] address;
	wire[5:0] out;

	mux4input #(.width(6)) DUT (input0, input1, input2, input3, address, out);

	always @(posedge begintest) begin
		endtest = 0;
		dutpassed = 1;

		// Test Case 1:
		// Ensure that the value chosen by the mux matches
		// the value at the given address.
		input0 = 6'd1;
		input1 = 6'd2;
		input2 = 6'd3;
		input3 = 6'd4;
		address = 2'd0;
		#5
		if (out != input0) begin
			$display("3 wide 6 deep mux test case 1 failed at address 00.");
			dutpassed = 0;
		end

		address = 2'd1;
		#5
		if (out != input1) begin
			$display("3 wide 6 deep mux test case 1 failed at address 01.");
			dutpassed = 0;
		end

		address = 2'd2;
		#5
		if (out != input2) begin
			$display("3 wide 6 deep mux test case 1 failed at address 10.");
			dutpassed = 0;
		end

		address = 2'd3;
		#5
		if (out != input2) begin
			$display("3 wide 6 deep mux test case 1 failed at address 11.");
			dutpassed = 0;
		end

		#5
		endtest = 1;
	end
endmodule

// Unit test the 32 wide 32 deep mux module.
module mux32to32by1Test(
	input begintest,
	output reg endtest,
	output reg dutpassed
	);
	wire[31:0] out;
	reg[4:0] address;
	reg[31:0] input0, input1, input2, input3, input4, input5, input6, input7, input8;
	reg[31:0] input9, input10, input11, input12, input13, input14, input15, input16;
	reg[31:0] input17, input18, input19, input20, input21, input22, input23, input24;
	reg[31:0] input25, input26, input27, input28, input29, input30, input31;

	mux32to1by32 DUT (out, address, input0, input1, input2, input3, input4, input5,
		input6, input7, input8, input9, input10, input11, input12, input13, input14,
		input15, input16, input17, input18, input19, input20, input21, input22, input23,
		input24, input25, input26, input27, input28, input29, input30, input31);

	always @(posedge begintest) begin
		endtest = 0;
		dutpassed = 1;

		// Test Case 1:
		// Ensure that the value chosen by the mux matches the value at the given address
		address = 5'd20;
		input0 = 32'd0; input1 = 32'd1; input2 = 32'd2; input3 = 32'd3; input4 = 32'd4;
		input5 = 32'd5; input6 = 32'd6; input7 = 32'd7; input8 = 32'd8; input9 = 32'd9;
		input10 = 32'd10; input11 = 32'd11; input12 = 32'd12; input13 = 32'd13; input14 = 32'd14;
		input15 = 32'd15; input16 = 32'd16; input17 = 32'd17; input18 = 32'd18; input19 = 32'd19;
		input20 = 32'd20; input21 = 32'd21; input22 = 32'd22; input23 = 32'd23; input24 = 32'd24;
		input25 = 32'd25; input26 = 32'd26; input27 = 32'd27; input28 = 32'd28; input29 = 32'd29;
		input30 = 32'd30; input31 = 32'd31;
		if (out != 20) begin
			$display("32 wide 32 deep mux Test Case 1 failed");
			dutpassed = 0;
		end

		#5
		endtest = 1;
	end
endmodule // mux32to32by1Test

