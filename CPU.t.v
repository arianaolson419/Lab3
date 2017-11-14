// Test the full single cycle CPU

`include "CPU.v"

module testCPU ();

	reg CLK;

	CPU dut (.CLK(CLK));

	initial CLK = 0;

	initial begin
		$dumpfile("CPU.vcd");
		$dumpvars;
		#1
		CLK = 1; #2
		$display("Program counter: %h", dut.PC);

		#6000
		CLK = 0;
	end

endmodule
