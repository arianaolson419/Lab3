// Test the full single cycle CPU

`include "CPU.v"

module testCPU ();

	reg CLK;

	CPU dut (.CLK(CLK));

	initial CLK = 0;

	initial begin
		$dumpfile("CPU.vcd");
		$dumpvars;
		#6000;
		$display("Program counter: %h", dut.PC);
		CLK = 1; #6000
		$display("Program counter: %h", dut.PC);
		CLK = 0; #6000; CLK=1; #6000;
		$display("Program counter: %h", dut.PC);
	end

endmodule
