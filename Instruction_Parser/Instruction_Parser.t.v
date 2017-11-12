// Tests the Instruction Parser
// To use this test, the Instruction Memory must be dyanmically using the following command:
// ./run_program.sh Instruction_Parser/Instruction_Parser.t.v Instruction_Parser/test_mem.dat

`include "Instruction_Parser.v"

module testInstructionParser();

    reg[31:0] PC;
    // Instruction values
    wire[4:0] Rs, Rd, Rt;
    wire[15:0] imm;
    wire[25:0] addr;
    // Control Signals
    wire[2:0] ALUCtrl;
    wire[1:0] MemToReg, RegDst, PCSel;
    wire      MemWr, ALUSrc, RegWr, AddSel;

    InstructionParser ip(
        .PC(PC),
        .Rs(Rs), .Rd(Rd), .Rt(Rt),
        .imm(imm), .addr(addr),
        .ALUCtrl(ALUCtrl), .MemToReg(MemToReg),
        .MemWr(MemWr), .ALUSrc(ALUSrc), .PCSel(PCSel),
        .RegDst(RegDst), .RegWr(RegWr), .AddSel(AddSel)
    );

    initial begin

        PC = 0; #1;
        if ((Rs == 0) &&
            (Rd == 0) &&
            (Rt == 0) &&
            (imm == 0) &&
            (addr == 0)
            ) begin
            $display("Test 1 Passed");
        end
        else begin
            $display("Test 1 Failed");
        end

        PC = 1; #1;
        if ((Rs == 5'b11111) &&
            (Rd == 5'b11111) &&
            (Rt == 5'b11111) &&
            (imm == 16'hFFFF) &&
            (addr == 26'b11111111111111111111111111)
            ) begin
            $display("Test 2 Passed");
        end
        else begin
            $display("Test 2 Failed");
        end

        // Addr = 1;
        // if (DataOut == 32'hFFFF_FFFF) begin
        //     $display("Test 2 Passed");
        // end
        // else begin
        //     $display("Test 2 Failed");
        // end

        // Addr = 3;
        // if (DataOut == 32'h0F0F_0F0F) begin
        //     $display("Test 3 Passed");
        // end
        // else begin
        //     $display("Test 3 Failed");
        // end
    end

endmodule
