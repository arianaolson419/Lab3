`include "CPU.v"

module testCPU ();

	reg CLK;
	reg[31:0] mem [16:0];
	integer i;

	CPU dut (.CLK(CLK));

	initial begin
		$dumpfile("CPU.vcd");
		$dumpvars(0, testCPU, dut.c.datamemory.memory[8]);
		
		for (i = 0; i < 100; i = i + 1) begin
			CLK = 1; #12000; CLK = 0; #12000;
			$display("Program counter: %h", dut.PC);
			$display("$at: %h", dut.c.regfile.register1out);
			$display("$a0: %h", dut.c.regfile.register4out);
			$display("$ra: %h", dut.c.regfile.register31out);
			$display("Memtoreg mux output: %h", dut.c.regdatamux.out);
		end
	end

endmodule
