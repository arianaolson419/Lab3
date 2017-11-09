// Tests the Decoder

`include "Decoder.v"

module testDecoder();

    reg[31:0] instr;
    wire[5:0] Op;
    wire[4:0] Rs, Rd, Rt;
    wire[15:0] imm;
    wire[25:0] addr;

    Decoder dec(
        .Instr(instr), .Op(Op), .Rs(Rs),
        .Rd(Rd), .Rt(Rt), .imm(imm), .addr(addr)
    );

    initial begin
        // $dumpfile("decoder.vcd");
        // $dumpvars;
        instr = 32'b00000000000000000000000000000000; #1
        if ((Op == 6'b000000) && (Rs == 5'b00000) &&
           (Rd == 5'b00000) && (Rt == 5'b00000) &&
           (imm == 16'b0000000000000000) &&
           (addr == 26'b00000000000000000000000000)) begin
            $display("Test 1 Passed!");
        end
        else begin
            $display("Test 1 Failed!");
        end

        instr = 32'b11111111111111111111111111111111; #1
        if ((Op == 6'b111111) && (Rs == 5'b11111) &&
           (Rd == 5'b11111) && (Rt == 5'b11111) &&
           (imm == 16'b1111111111111111) &&
           (addr == 26'b11111111111111111111111111)) begin
            $display("Test 2 Passed!");
        end
        else begin
            $display("Test 2 Failed!");
        end

        instr = 32'b11001100110011001100110011001100; #1
        if ((Op == 6'b110011) && (Rs == 5'b00110) &&
           (Rd == 5'b11001) && (Rt == 5'b01100) &&
           (imm == 16'b1100110011001100) &&
           (addr == 26'b00110011001100110011001100)) begin
            $display("Test 3 Passed!");
        end
        else begin
            $display("Test 3 Failed!");
        end
    end

endmodule
