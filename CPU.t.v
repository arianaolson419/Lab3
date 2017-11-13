// Test the full single cycle CPU

`include "CPU.v"

module testCPU ();

	reg CLK;

	CPU dut (.CLK(CLK));

	initial CLK = 0;

	initial begin
		#6000
		CLK = 1;
		$display("Program counter: %h", dut.PC);

		#6000
		CLK = 0;
	end

endmodule