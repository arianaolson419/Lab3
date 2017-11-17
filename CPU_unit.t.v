// Test the full single cycle CPU

`include "CPU.v"

module testCPU ();

	reg CLK;
	reg[31:0] mem [16:0];

	CPU dut (.CLK(CLK));

	initial begin
		$dumpfile("CPU_unit.vcd");
		$dumpvars(0, testCPU);

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

		// PC = 132
		CLK = 1; #12000; CLK = 0; #12000;
		$display("Program counter: %h", dut.PC);	
		if (dut.c.regfile.register29out != 32'd64) begin
			$display("Error at register $sp. Expected value: %h, actual value: %h", 32'd16380, dut.c.regfile.register29out);
		end

		// PC = 136
		CLK = 1; #12000; CLK = 0; #12000;
		$display("Program counter: %h", dut.PC);	
		if (dut.c.regfile.register9out != 32'd2) begin
			$display("Error at register $t1. Expected value: %h, actual value: %h", 32'd2, dut.c.regfile.register9out);
		end

		// PC = 140
		CLK = 1; #12000; CLK = 0; #12000;
		$display("Program counter: %h", dut.PC);	
		if (dut.c.regfile.register10out != 32'd169) begin
			$display("Error at register $t1. Expected value: %h, actual value: %h", 32'd169, dut.c.regfile.register10out);
		end

		CLK = 1; #12000; CLK = 0; #12000;
		CLK = 1; #12000; CLK = 0; #12000;

		// PC = 152
		CLK = 1; #12000; CLK = 0; #12000;
		$display("Program counter: %h", dut.PC);	
		if (dut.c.regfile.register11out != 32'd2) begin
			$display("Error at register $t1. Expected value: %h, actual value: %h", 32'd2, dut.c.regfile.register11out);
		end

		// PC = 156
		CLK = 1; #12000; CLK = 0; #12000;
		$display("Program counter: %h", dut.PC);	
		if (dut.c.regfile.register12out != 32'd169) begin
			$display("Error at register $t1. Expected value: %h, actual value: %h", 32'd169, dut.c.regfile.register12out);
		end

		// PC = 160
		CLK = 1; #12000; CLK = 0; #12000;
		$display("Program counter: %h", dut.PC);	
		if (dut.c.regfile.register9out != 32'd100) begin
			$display("Error at register $t1. Expected value: %h, actual value: %h", 32'd100, dut.c.regfile.register9out);
		end

		// PC = 164
		CLK = 1; #12000; CLK = 0; #12000;
		$display("Program counter: %h", dut.PC);	
		if (dut.c.regfile.register31out != 32'd168) begin
			$display("Error at register $t1. Expected value: %h, actual value: %h", 32'd168, dut.c.regfile.register31out);
		end

		// PC = 176
		CLK = 1; #12000; CLK = 0; #12000;
		$display("Program counter: %h", dut.PC);	
		if (dut.c.regfile.register9out != 32'd101) begin
			$display("Error at register $t1. Expected value: %h, actual value: %h", 32'd101, dut.c.regfile.register9out);
		end

		CLK = 1; #12000; CLK = 0; #12000;

		// PC = 168
		CLK = 1; #12000; CLK = 0; #12000;
		$display("Program counter: %h", dut.PC);	
		if (dut.c.regfile.register9out != 32'd102) begin
			$display("Error at register $t1. Expected value: %h, actual value: %h", 32'd102, dut.c.regfile.register9out);
		end
		CLK = 1; #12000; CLK = 0; #12000;
		CLK = 1; #12000; CLK = 0; #12000;
		CLK = 1; #12000; CLK = 0; #12000;
	end
endmodule
