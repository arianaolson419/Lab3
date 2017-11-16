// Test the full single cycle CPU

`include "CPU.v"

module testCPU ();

	reg CLK;
	reg[31:0] mem [16:0];

	CPU dut (.CLK(CLK));

	initial begin
		$dumpfile("CPU.vcd");
		$dumpvars(0, testCPU, dut.c.datamemory.memory[4095]);

		// // add $t1, $zero, $zero
		// mem[0] = 32'h00004820;
		// $writememh("mem.dat", mem);
		// CLK = 1; #12000; CLK = 0; #12000;
		// $display("$t1: %h", dut.c.regfile.register9out);
		// $display("Program counter: %h", dut.PC);

		// // addi $t1, $zero, 2
		// mem[1] = 32'h20090002;
		// CLK = 1; #12000; CLK = 0; #12000;
		// $display("$t1: %h", dut.c.regfile.register9out);
		// $display("Program counter: %h", dut.PC);

		// // sw $t1, 0
		// mem[2] = 32'hac090000;
		// $writememh("mem.dat", mem);
		// CLK = 1; #12000; CLK = 0; #12000;
		// $display("$t2: %h", dut.c.regfile.register10out);
		// $display("Program counter: %h", dut.PC);

		// // addi $t1, $zero, 2
		// mem[3] = 32'h20090002;
		// $writememh("mem.dat", mem);
		// CLK = 1; #12000; CLK = 0; #12000;
		// $display("$t1: %h", dut.c.regfile.register9out);
		// $display("Program counter: %h", dut.PC);

		// //  xori $t3, $t1, 7
		// mem[4] = 32'h392b0007;
		// $writememh("mem.dat", mem);
		// CLK = 1; #12000; CLK = 0; #12000;
		// $display("$t3: %h", dut.c.regfile.register11out);
		// $display("Program counter: %h", dut.PC);

		// // lw $t2, 0($zero)
		// // load the value of memory at $zero into #t2
		// mem[5] = 32'h8c0a0000;
		// $writememh("mem.dat", mem);
		// CLK = 1; #12000; CLK = 0; #12000;
		// $display("$t2: %h", dut.c.regfile.register10out);
		// $display("Program counter: %h", dut.PC);

		// addi test cases.
		// PC = 0
		CLK = 1; #12000; CLK = 0; #12000;
		$display("Program counter: %h", dut.PC);
		if (dut.c.regfile.register8out != 32'd5) begin
			$display("Error at register $t0. Expected value: %h, actual value: %h", 32'd5, dut.c.regfile.register8out);
		end
		
		// PC = 4
		CLK = 1; #12000; CLK = 0; #12000;
		$display("Program counter: %h", dut.PC);	
		if (dut.c.regfile.register9out != 32'd130) begin
			$display("Error at register $t1. Expected value: %h, actual value: %h", 32'd130, dut.c.regfile.register9out);
		end

		// PC = 8
		CLK = 1; #12000; CLK = 0; #12000;
		$display("Program counter: %h", dut.PC);	
		if (dut.c.regfile.register8out != 32'd9) begin
			$display("Error at register $t0. Expected value: %h, actual value: %h", 32'd9, dut.c.regfile.register8out);
		end

		// xori test cases
		CLK = 1; #12000; CLK = 0; #12000;
		CLK = 1; #12000; CLK = 0; #12000;
		CLK = 1; #12000; CLK = 0; #12000;

		// PC = 24
		CLK = 1; #12000; CLK = 0; #12000;
		$display("Program counter: %h", dut.PC);	
		if (dut.c.regfile.register8out != 32'd5) begin
			$display("Error at register $t0. Expected value: %h, actual value: %h", 32'd5, dut.c.regfile.register8out);
		end

		// PC = 28
		CLK = 1; #12000; CLK = 0; #12000;
		$display("Program counter: %h", dut.PC);	
		if (dut.c.regfile.register8out != 32'd0) begin
			$display("Error at register $t0. Expected value: %h, actual value: %h", 32'd0, dut.c.regfile.register8out);
		end

		CLK = 1; #12000; CLK = 0; #12000;
		CLK = 1; #12000; CLK = 0; #12000;
		CLK = 1; #12000; CLK = 0; #12000;
		CLK = 1; #12000; CLK = 0; #12000;
		CLK = 1; #12000; CLK = 0; #12000;
		CLK = 1; #12000; CLK = 0; #12000;
		CLK = 1; #12000; CLK = 0; #12000;

		// PC = 60
		CLK = 1; #12000; CLK = 0; #12000;
		$display("Program counter: %h", dut.PC);	
		if (dut.c.regfile.register8out != 32'd63) begin
			$display("Error at register $t0. Expected value: %h, actual value: %h", 32'd63, dut.c.regfile.register8out);
		end

		// PC = 64
		CLK = 1; #12000; CLK = 0; #12000;
		$display("Program counter: %h", dut.PC);	
		if (dut.c.regfile.register8out != 32'd11) begin
			$display("Error at register $t0. Expected value: %h, actual value: %h", 32'd11, dut.c.regfile.register8out);
		end

		// PC = 68
		CLK = 1; #12000; CLK = 0; #12000;
		$display("Program counter: %h", dut.PC);	
		if (dut.c.regfile.register8out != -32'd16) begin
			$display("Error at register $t0. Expected value: %h, actual value: %h", -32'd16, dut.c.regfile.register8out);
		end

		CLK = 1; #12000; CLK = 0; #12000;

		// PC = 76
		CLK = 1; #12000; CLK = 0; #12000;
		$display("Program counter: %h", dut.PC);	
		if (dut.c.regfile.register8out != -32'd51) begin
			$display("Error at register $t0. Expected value: %h, actual value: %h", -32'd51, dut.c.regfile.register8out);
		end

		// PC = 80
		CLK = 1; #12000; CLK = 0; #12000;
		$display("Program counter: %h", dut.PC);	
		if (dut.c.regfile.register8out != -32'd29) begin
			$display("Error at register $t0. Expected value: %h, actual value: %h", -32'd29, dut.c.regfile.register8out);
		end

		// PC = 84
		CLK = 1; #12000; CLK = 0; #12000;
		$display("Program counter: %h", dut.PC);	
		if (dut.c.regfile.register8out != 32'd6) begin
			$display("Error at register $t0. Expected value: %h, actual value: %h", 32'd6, dut.c.regfile.register8out);
		end

		CLK = 1; #12000; CLK = 0; #12000;

		// PC = 92
		CLK = 1; #12000; CLK = 0; #12000;
		$display("Program counter: %h", dut.PC);	
		if (dut.c.regfile.register8out != 32'd1) begin
			$display("Error at register $t0. Expected value: %h, actual value: %h", 32'd1, dut.c.regfile.register8out);
		end

		// PC = 96
		CLK = 1; #12000; CLK = 0; #12000;
		$display("Program counter: %h", dut.PC);	
		if (dut.c.regfile.register8out != 32'd1) begin
			$display("Error at register $t0. Expected value: %h, actual value: %h", 32'd1, dut.c.regfile.register8out);
		end

		// PC = 100
		CLK = 1; #12000; CLK = 0; #12000;
		$display("Program counter: %h", dut.PC);	
		if (dut.c.regfile.register8out != 32'd0) begin
			$display("Error at register $t0. Expected value: %h, actual value: %h", 32'd0, dut.c.regfile.register8out);
		end

		CLK = 1; #12000; CLK = 0; #12000;
		CLK = 1; #12000; CLK = 0; #12000;
		CLK = 1; #12000; CLK = 0; #12000;

		// PC = 124
		CLK = 1; #12000; CLK = 0; #12000;
		$display("Program counter: %h", dut.PC);	
		if (dut.c.regfile.register11out != 32'd1) begin
			$display("Error at register $t0. Expected value: %h, actual value: %h", 32'd1, dut.c.regfile.register11out);
		end

		CLK = 1; #12000; CLK = 0; #12000;
		CLK = 1; #12000; CLK = 0; #12000;

		// PC = 124
		CLK = 1; #12000; CLK = 0; #12000;
		$display("Program counter: %h", dut.PC);	
		if (dut.c.regfile.register11out != 32'd2) begin
			$display("Error at register $t0. Expected value: %h, actual value: %h", 32'd2, dut.c.regfile.register11out);
		end

		CLK = 1; #12000; CLK = 0; #12000;
		CLK = 1; #12000; CLK = 0; #12000;

		// PC = 124
		CLK = 1; #12000; CLK = 0; #12000;
		$display("Program counter: %h", dut.PC);	
		if (dut.c.regfile.register11out != 32'd3) begin
			$display("Error at register $t0. Expected value: %h, actual value: %h", 32'd3, dut.c.regfile.register11out);
		end

		CLK = 1; #12000; CLK = 0; #12000;
		CLK = 1; #12000; CLK = 0; #12000;

		// PC = 124
		CLK = 1; #12000; CLK = 0; #12000;
		$display("Program counter: %h", dut.PC);	
		if (dut.c.regfile.register11out != 32'd4) begin
			$display("Error at register $t0. Expected value: %h, actual value: %h", 32'd4, dut.c.regfile.register11out);
		end

		CLK = 1; #12000; CLK = 0; #12000;
		CLK = 1; #12000; CLK = 0; #12000;

		// PC = 116
		CLK = 1; #12000; CLK = 0; #12000;
		$display("Program counter: %h", dut.PC);	
		if (dut.c.regfile.register13out != 32'd4) begin
			$display("Error at register $t0. Expected value: %h, actual value: %h", 32'd4, dut.c.regfile.register8out);
		end

		CLK = 1; #12000; CLK = 0; #12000;
		CLK = 1; #12000; CLK = 0; #12000;

		CLK = 1; #12000; CLK = 0; #12000;
		CLK = 1; #12000; CLK = 0; #12000;
		CLK = 1; #12000; CLK = 0; #12000;
		CLK = 1; #12000; CLK = 0; #12000;
		CLK = 1; #12000; CLK = 0; #12000;
		CLK = 1; #12000; CLK = 0; #12000;
		CLK = 1; #12000; CLK = 0; #12000;
		CLK = 1; #12000; CLK = 0; #12000;
		CLK = 1; #12000; CLK = 0; #12000;
		CLK = 1; #12000; CLK = 0; #12000;

	end

endmodule
