// Test the full single cycle CPU

`include "CPU.v"

module testCPU ();

	reg CLK;
	reg[31:0] mem [16:0];

	CPU dut (.CLK(CLK));

	initial CLK = 0;

	initial begin
		$dumpfile("CPU.vcd");
		$dumpvars;

		mem[0] = 32'h2008_0001;
		mem[1] = 32'h2008_0002;
		$writememh("mem.dat", mem);
		#6000;
		$display("Program counter: %h", dut.PC);
		CLK = 1; #6000
		$display("Program counter: %h", dut.PC);
		CLK = 0; #6000; CLK=1; #6000;
		$display("Program counter: %h", dut.PC);
		$finish;
	end

endmodule
