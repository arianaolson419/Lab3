//--------------------------
// Test the register modules
//--------------------------
`include "Core/register.v"

// Unit tests for the single bit register module.
module registerTest();
	wire q;
	reg d;
	reg wrenable;
	reg clk;

	register DUT (q, d, wrenable, clk);

	initial begin
		// Test Case 1:
		// Write a 1 to the register.
		d = 1; wrenable = 1;
		#5 clk = 0;
		#5 clk = 1;
		if (q != d) begin
			$display("Register Test Case 1 failed");
		end

		// Test Case 2:
		// Write a 0 to the register.
		d = 0; wrenable = 1;
		#5 clk = 0;
		#5 clk = 1;
		if (q != d) begin
			$display("Register Test Case 2 failed");
		end

		// Test Case 3:
		// Write not enabled, the data written should not match the output.
		d = 1; wrenable = 0;
		#5 clk = 0;
		#5 clk = 1;
		if (q == d) begin
			$display("Register Test Case 3 failed");
		end
	end 
endmodule // registerTest

// Unit tests for the 32 bit register module.
module register32Test();

	wire[31:0] q;
	reg[31:0] d;
	reg wrenable;
	reg clk;

	register32 DUT (q, d, wrenable, clk);

	initial begin

		// Test Case 1:
		// Write to the register
		d = 32'hFFFAAA; wrenable = 1;
		#5 clk = 0;
		#5 clk = 1;
		if (q != d) begin
			$display("32 bit register Test Case 1 failed");
		end

		// Test Case 2:
		// Do not enable writing to register
		d = 32'hFFF000; wrenable = 0;
		#5 clk = 0;
		#5 clk = 1;
		if (q == d) begin
			$display("32 bit register Test Case 1 failed");
		end
	end
endmodule // register32Test

// Unit tests for the 32 bit zero register module.
module register32zeroTest();
	wire[31:0] q;
	reg[31:0] d;
	reg wrenable;
	reg clk;

	register32zero DUT (q, d, wrenable, clk);

	reg dutpassed;	// Flag is set to false if any of the tests fail.

	initial begin
		dutpassed = 1;

		// Test Case 1:
		// Write to the register
		d = 32'hFFFAAA; wrenable = 1;
		#5 clk = 0;
		#5 clk = 1;
		if (q != 0) begin
			$display("32 bit zero register Test Case 1 failed");
			dutpassed = 0;
		end

		// Test Case 2:
		// Do not enable writing to register
		#5
		d = 32'hFFF000; wrenable = 0;
		#5 clk = 0;
		#5 clk = 1;
		if (q != 0) begin
			$display("32 bit zero register Test Case 2 failed");
			dutpassed = 0;
		end

		#5

		if (dutpassed ==1) begin
			$display("All register tests passed.");
		end
	end
endmodule // register32zeroTest



