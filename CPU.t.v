// Test the full single cycle CPU

`include "CPU.v"

module testCPU ();

	reg CLK;
	reg[31:0] mem [16:0];

	CPU dut (.CLK(CLK));

	initial begin
		$dumpfile("CPU.vcd");
		$dumpvars;

		//add $t1, $zero, $zero
		mem[0] = 32'h00004820;
		$writememh("mem.dat", mem);
		CLK = 1; #6000; CLK = 0; #6000
		$display("$t0: %h", dut.c.regfile.register9out);
		$display("Program counter: %h", dut.PC);

		//addi $t1, $zero, 2
		mem[1] = 32'h02009002;
		$writememh("mem.dat", mem);
		CLK = 1; #6000; CLK = 0; #6000
		$display("$t0: %h", dut.c.regfile.register9out);
		$display("Program counter: %h", dut.PC);
	end

endmodule
