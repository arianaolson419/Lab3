/*
Test bench for data memory module.
*/

`include "Core/memory.v"

module memory_TEST();
	reg clk;
	reg [31:0] address;
	reg writeEnable;
	reg [31:0] dataIn;

	wire [31:0] dataOut;

	memory dut(clk, dataOut, address, writeEnable, dataIn);

	initial clk = 0;
	always #10 clk = !clk;
	initial begin
		$dumpfile("Core/memory.vcd");
		$dumpvars(0, memory_TEST, dut.memory[0]);

		// Test Case 1: Do not write if writeEnable is low.
		writeEnable = 0; dataIn = 32'hffffffff; address = 32'd0;
		#20
		if (dataOut === dataIn) begin
			$display("Test case 1 failed: memory was written to when writeEnable was false.");
		end

		else if (dataOut === 32'bx) begin
			$display("Test case 1 failed: there is no memory at the given address.");
		end

		#1000
		// Test case 2: Write to memory if writeEnable is high.
		writeEnable = 1; dataIn = 32'hffffffff; address = 32'd0;
		#40
		
		if (dataOut === 32'bx) begin
			$display("Test case 2 failed: there is no memory at the given address.");
		end

		if (dut.memory[0] !== dataIn) begin
			$display("Test case 2 failed: the memory contained at the given address does not match dataIn");
		end

		if (dataOut !== dataIn) begin
			$display("Test case 2 failed: memory was not written to when writeEnable was true.");
		end

		#1000

		$finish;
	end
endmodule