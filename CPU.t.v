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
		$display("$t2: %h", dut.c.regfile.register10out);
		$display("Program counter: %h", dut.PC);

		//addi $t1, $zero, 2
		mem[3] = 32'h20090002;
		$writememh("mem.dat", mem);
		CLK = 1; #12000; CLK = 0; #12000;
		$display("$t1: %h", dut.c.regfile.register9out);
		$display("Program counter: %h", dut.PC);

		// xori $t3, $t1, 7
		mem[4] = 32'h392b0007;
		$writememh("mem.dat", mem);
		CLK = 1; #12000; CLK = 0; #12000;
		$display("$t3: %h", dut.c.regfile.register11out);
		$display("Program counter: %h", dut.PC);

		//lw $t2, 0($zero)
		//load the value of memory at $zero into #t2
		// mem[4] = 32'h8c0a0000;
		// $writememh("mem.dat", mem);
		// CLK = 1; #12000; CLK = 0; #12000;
		// $display("$t2: %h", dut.c.regfile.register10out);
		// $display("Program counter: %h", dut.PC);

		CLK = 1; #12000; CLK = 0; #12000;
		CLK = 1; #12000; CLK = 0; #12000;
		CLK = 1; #12000; CLK = 0; #12000;

	end

endmodule
