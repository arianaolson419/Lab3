// Tests the Memory

`include "Memory.v"

module testMemory();

    reg clk, regWE;
    reg[9:0] Addr;
    reg[31:0] DataIn;
    wire[31:0]  DataOut;

    Memory Instruction_Memory(.Addr(Addr), .DataOut(DataOut));

    initial begin
        // Before memory is initialized, all addresses should return x's
        Addr = 0;
        if (DataOut == 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) begin
            $display("Test 1 Passed");
        end
        else begin
            $display("Test 1 Failed");
        end
    end

endmodule
