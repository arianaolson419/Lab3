/*
Test bench for data memory module.
*/

module memory_TEST();
	reg clk;
	reg [31:0] address;
	reg writeEnable;
	reg [31:0] dataIn;

	wire dataOut;

	memory dut(clk, dataOut, address, writeEnable, dataIn);

	initial begin
		// Test code here
	end
endmodule