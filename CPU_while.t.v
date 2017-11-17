`include "CPU.v"

module testCPU ();

	reg CLK;
	reg[31:0] mem [16:0];
	integer i;

	CPU dut (.CLK(CLK));

	initial begin
		$dumpfile("CPU_fib.vcd");
		$dumpvars(0, testCPU);

		repeat(30) begin
			CLK = 1; #12000; CLK = 0; #12000;
		end
		if (dut.PC === 32'd28) begin
			if (dut.c.regfile.register11out === dut.c.regfile.register12out) begin
				$display("While loop test passed!");
			end

			else begin
				$display("While loop test failed. $t3 and $t4 are not equal at the end of the program.");
			end
		end
	end

endmodule