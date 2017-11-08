//-------------------------------
// Unit test the decoder module
//-------------------------------

`include "decoders.v"

module decoder1to32Test();
	wire[31:0] out;
	reg enable;
	reg[4:0] address;

	reg dutpassed;	// Flag is set to false if any of the tests fail.

	decoder1to32 DUT (out, enable, address);

	initial begin
		dutpassed = 1;
		
		// Test Case 1: do not enable writing to any register.
		enable = 0; address = 5'd14;
		if (out != 0) begin
			$display("Decoder Test Case 1 failed");
			dutpassed = 0;
		end //

		// Test Case 2:
		// Enable writing to one register only.
		#5
		enable = 1; address = 5'd14;
		if (out[31:15] != 0 || out[14] != 1 || out[13:0] != 0) begin
			$display("Decoder Test Case 2 failed");
			dutpassed = 0;
		end

		#5

		if (dutpassed ==1) begin
			$display("All decoder tests passed.");
		end
	end //
endmodule // decoder1to32Test