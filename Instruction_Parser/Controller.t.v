// Tests the Controller

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

        // Test all instructions where the func field doesn't matter
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

        Op = JAL; #1
        if ((RegDst == 2'd2) && (RegWr == 1) &&
            (MemWr == 0) && (MemToReg == 2'd2) &&
            (PCSel == 0) && (AddSel == 0)) begin
            $display("Test 5 Passed!");
        end
        else begin
            $display("Test 5 Failed!");
            $display("RegWr: %b", RegWr);
            $display("MemWr: %b", MemWr);
            $display("PCSel: %b", PCSel);
            $display("AddSel: %b", AddSel);
        end

        Op = BNE; #1
        if ((ALUSrc == 0) && (RegWr == 0) &&
            (MemWr == 0) && (ALUCtrl == alu_sub) &&
            (PCSel == 1) && (AddSel == 1)) begin
            $display("Test 6 Passed!");
        end
        else begin
            $display("Test 6 Failed!");
            $display("RegWr: %b", RegWr);
            $display("MemWr: %b", MemWr);
            $display("PCSel: %b", PCSel);
            $display("AddSel: %b", AddSel);
        end

        Op = XORI; #1
        if ((RegDst == 1) && (ALUSrc == 1) &&
           (RegWr == 1) && (MemWr == 0) &&
           (ALUCtrl == alu_xor) && (MemToReg == 0) &&
           (PCSel == 1) && (AddSel == 0)) begin
            $display("Test 7 Passed!");
        end
        else begin
            $display("Test 7 Failed!");
        end

        Op = ADDI; #1
        if ((RegDst == 1) && (ALUSrc == 1) &&
           (RegWr == 1) && (MemWr == 0) &&
           (ALUCtrl == alu_add) && (MemToReg == 0) &&
           (PCSel == 1) && (AddSel == 0)) begin
            $display("Test 8 Passed!");
        end
        else begin
            $display("Test 8 Failed!");
        end

        // Test all instructions where the op field is 0
        Op = 0;

        funct = JR_f; #1
        if ((RegWr == 0) && (MemWr == 0) &&
            (PCSel == 2'd2) && (AddSel == 0)) begin
            $display("Test 9 Passed!");
        end
        else begin
            $display("Test 9 Failed!");
            $display("RegWr: %b", RegWr);
            $display("MemWr: %b", MemWr);
            $display("PCSel: %b", PCSel);
            $display("AddSel: %b", AddSel);
        end

        funct = ADD_f; #1
        if ((RegDst == 0) && (ALUSrc == 0) &&
           (RegWr == 1) && (MemWr == 0) &&
           (ALUCtrl == alu_add) && (MemToReg == 0) &&
           (PCSel == 1) && (AddSel == 0)) begin
            $display("Test 10 Passed!");
        end
        else begin
            $display("Test 10 Failed!");
            $display("RegDst: %b", RegDst);
            $display("ALUSrc: %b", ALUSrc);
            $display("RegWr: %b", RegWr);
            $display("MemWr: %b", MemWr);
            $display("ALUCtrl: %b", ALUCtrl);
            $display("MemToReg: %b", MemToReg);
            $display("PCSel: %b", PCSel);
            $display("AddSel: %b", AddSel);
        end

        funct = SUB_f; #1
        if ((RegDst == 0) && (ALUSrc == 0) &&
           (RegWr == 1) && (MemWr == 0) &&
           (ALUCtrl == alu_sub) && (MemToReg == 0) &&
           (PCSel == 1) && (AddSel == 0)) begin
            $display("Test 11 Passed!");
        end
        else begin
            $display("Test 11 Failed!");
        end

        funct = SLT_f; #1
        if ((RegDst == 0) && (ALUSrc == 0) &&
           (RegWr == 1) && (MemWr == 0) &&
           (ALUCtrl == alu_slt) && (MemToReg == 0) &&
           (PCSel == 1) && (AddSel == 0)) begin
            $display("Test 12 Passed!");
        end
        else begin
            $display("Test 12 Failed!");
        end
    end

endmodule
