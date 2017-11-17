`include "CPU.v"

module testCPU ();

	reg CLK;
	reg[31:0] mem [16:0];
	integer i;

	CPU dut (.CLK(CLK));

	initial begin
		$dumpfile("CPU_fib.vcd");
		$dumpvars(0, testCPU);

		repeat(600) begin
			CLK = 1; #12000; CLK = 0; #12000;
		end
		if (dut.PC === 32'd228) begin
			if (dut.c.regfile.register2out === 32'd15) begin
				$display("Fibonnaci test passed!");
			end

			else begin
				$display("Fibonnaci test failed. Expected value: %b Actual value: %b", 32'd15, dut.c.regfile.register2out);
			end
		end
	end

endmodule
