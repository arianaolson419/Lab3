// Tests the Decoder

`include "Controller.v"

module testController();

    reg[5:0]   Op, funct;
    wire[2:0]  ALUCtrl;
    wire [1:0] MemToReg, RegDst, PCSel;
    wire       MemWr, ALUSrc, RegWr, AddSel;

    Controller ctrlr(
        .Op(Op), .funct(funct),
        .ALUCtrl(ALUCtrl),
        .MemToReg(MemToReg), .RegDst(RegDst),
        .PCSel(PCSel), .AddSel(AddSel),
        .MemWr(MemWr), .ALUSrc(ALUSrc), .RegWr(RegWr)
    );

    // Opcodes
    localparam LW = 6'h23;
    localparam SW = 6'h2b;
    localparam J = 6'h2;
    localparam JAL = 6'h3;
    localparam BNE = 6'h5;
    localparam XORI = 6'he;
    localparam ADDI = 6'h8;

    // These instructions all have opcode 0 and are designated by funct
    localparam JR_f = 6'h08;
    localparam ADD_f = 6'h20;
    localparam SLT_f = 6'h2a;
    localparam SUB_f = 6'h22;

    // ALU Control mapping
    localparam alu_add = 3'd0;
    localparam alu_sub = 3'd1;
    localparam alu_xor = 3'd2;
    localparam alu_slt = 3'd4;

    initial begin
        // $dumpfile("Controller.vcd");
        // $dumpvars;

        // Test all Ops where the func doesn't matter
        funct = 6'bxxxxxx;

        Op = LW; #1
        if ((RegDst == 1) && (ALUSrc == 1) &&
           (RegWr == 1) && (MemWr == 0) &&
           (ALUCtrl == alu_add) && (MemToReg == 1) &&
           (PCSel == 1)) begin
            $display("Test 1 Passed!");
        end
        else begin
            $display("Test 1 Failed!");
        end

        Op = SW; #1
        if ((ALUSrc == 1) &&
           (RegWr == 0) && (MemWr == 1) &&
           (ALUCtrl == alu_add) &&
           (PCSel == 1)) begin
            $display("Test 2 Passed!");
        end
        else begin
            $display("Test 2 Failed!");
        end

        Op = J; #1
        if ((RegWr == 0) && (MemWr == 0) &&
            (PCSel == 0) && (AddSel == 0)) begin
            $display("Test 3 Passed!");
        end
        else begin
            $display("Test 3 Failed!");
            $display("RegWr: %b", RegWr);
            $display("MemWr: %b", MemWr);
            $display("PCSel: %b", PCSel);
            $display("AddSel: %b", AddSel);
        end

        // instr = 32'b11111111111111111111111111111111; #1
        // if ((Op == 6'b111111) && (Rs == 5'b11111) &&
        //    (Rd == 5'b11111) && (Rt == 5'b11111) &&
        //    (imm == 16'b1111111111111111) && (funct == 6'b111111) &&
        //    (addr == 26'b11111111111111111111111111)) begin
        //     $display("Test 2 Passed!");
        // end
        // else begin
        //     $display("Test 2 Failed!");
        // end

        // instr = 32'b11001100110011001100110011001100; #1
        // if ((Op == 6'b110011) && (Rs == 5'b00110) &&
        //    (Rd == 5'b11001) && (Rt == 5'b01100) &&
        //    (imm == 16'b1100110011001100) && (funct == 6'b001100) &&
        //    (addr == 26'b00110011001100110011001100)) begin
        //     $display("Test 3 Passed!");
        // end
        // else begin
        //     $display("Test 3 Failed!");
        // end
    end

endmodule
