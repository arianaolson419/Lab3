// Test the full single cycle CPU

`include "CPU.v"

module testCPU ();

	reg CLK;

	CPU dut (.CLK(CLK));

	initial CLK = 0;

	initial begin
		$dumpfile("CPU.vcd");
		$dumpvars();
		CLK = 1;	#1000
		CLK = !CLK;	#1000
		CLK = !CLK;	#1000
		#6000
		$display("Program counter: %h", dut.PC);
		// $display("DFF: %b", dut.pc);

		#6000
		CLK = 0;
		$finish();
	end

endmodule