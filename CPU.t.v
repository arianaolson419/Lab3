// Test the full single cycle CPU

`include "CPU.v"

module testCPU ();

	reg CLK;
	reg[31:0] mem [16:0];

	CPU dut (.CLK(CLK));

	initial begin
		$dumpfile("CPU.vcd");
		$dumpvars(0, testCPU, dut.c.datamemory.memory[0]);

		//add $t1, $zero, $zero
		// mem[0] = 32'h00004820;
		// $writememh("mem.dat", mem);
		CLK = 1; #12000; CLK = 0; #12000;
		$display("$t1: %h", dut.c.regfile.register9out);
		$display("Program counter: %h", dut.PC);

		//addi $t1, $zero, 2
		// mem[1] = 32'h20090002;
		// $writememh("mem.dat", mem);
		CLK = 1; #12000; CLK = 0; #12000;
		$display("$t1: %h", dut.c.regfile.register9out);
		$display("Program counter: %h", dut.PC);

		//sw $t1, 0
		// mem[2] = 32'hac090000;
		// $writememh("mem.dat", mem);
		CLK = 1; #12000; CLK = 0; #12000;
		$display("M[0]: %h", dut.c.datamemory.memory[0]);
		$display("Program counter: %h", dut.PC);


		CLK = 1; #12000; CLK = 0; #12000;
		CLK = 1; #12000; CLK = 0; #12000;
		CLK = 1; #12000; CLK = 0; #12000;

	end

endmodule
