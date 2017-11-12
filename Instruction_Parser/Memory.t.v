// Tests the Memory
// To use this test, the memory must be dyanmically using the following command:
// ./run_program.sh Instruction_Parser/Memory.t.v Instruction_Parser/test_mem.dat


`include "Memory.v"

module testMemory();

    reg clk, regWE;
    reg[9:0] Addr;
    reg[31:0] DataIn;
    wire[31:0]  DataOut;

    Memory Instruction_Memory(.Addr(Addr), .DataOut(DataOut));

    initial begin
        Addr = 0;
        if (DataOut == 32'h0000_0000) begin
            $display("Test 1 Passed");
        end
        else begin
            $display("Test 1 Failed");
        end

        Addr = 1;
        if (DataOut == 32'hFFFF_FFFF) begin
            $display("Test 2 Passed");
        end
        else begin
            $display("Test 2 Failed");
        end

        Addr = 3;
        if (DataOut == 32'h0F0F_0F0F) begin
            $display("Test 3 Passed");
        end
        else begin
            $display("Test 3 Failed");
        end
    end

endmodule
