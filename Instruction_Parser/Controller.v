// Controller generates the correct control signals based on the operation

module Controller
(
    input[5:0]      Op, funct,
    output reg[2:0] ALUCtrl,
    output reg[1:0] MemToReg, RegDst, PCSel,
    output reg      MemWr, ALUSrc, RegWr, AddSel
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

    always @ * begin
        case (Op)
            LW: begin
                RegDst = 1;
                ALUSrc = 1;
                RegWr = 1;
                MemWr = 0;
                ALUCtrl = alu_add;
                MemToReg = 1;
                PCSel = 1;
                AddSel = 1'bx;
            end
            SW: begin
                RegDst = 1'bx;
                ALUSrc = 1;
                RegWr = 0;
                MemWr = 1;
                ALUCtrl = alu_add;
                MemToReg = 1'bx;
                PCSel = 1;
                AddSel = 1'bx;
            end
            J: begin
                RegDst = 1'bx;
                ALUSrc = 1'bx;
                RegWr = 0;
                MemWr = 1;
                ALUCtrl = 2'bxx;
                MemToReg = 1'bx;
                PCSel = 0;
                AddSel = 0;
            end
            JAL: begin
                RegDst = 2'd2;
                ALUSrc = 1'bx;
                RegWr = 1;
                MemWr = 0;
                ALUCtrl = 2'bxx;
                MemToReg = 2'd2;
                PCSel = 0;
                AddSel = 0;
            end
            BNE: begin
                RegDst = 2'bxx;
                ALUSrc = 0;
                RegWr = 0;
                MemWr = 0;
                ALUCtrl = alu_sub;
                MemToReg = 2'bxx;
                PCSel = 1;
                AddSel = 1;
            end
            XORI: begin
                RegDst = 1;
                ALUSrc = 1;
                RegWr = 1;
                MemWr = 0;
                ALUCtrl = alu_xor;
                MemToReg = 0;
                PCSel = 1;
                AddSel = 0;
            end
            ADDI: begin
                RegDst = 1;
                ALUSrc = 1;
                RegWr = 1;
                MemWr = 0;
                ALUCtrl = alu_add;
                MemToReg = 0;
                PCSel = 1;
                AddSel = 0;
            end
            // Multiple functions have an Op of 0
            0: begin
                case (funct)
                    JR_f: begin
                        RegDst = 2'bxx;
                        ALUSrc = 1'bx;
                        RegWr = 0;
                        MemWr = 0;
                        ALUCtrl = 2'bxx;
                        MemToReg = 1'bx;
                        PCSel = 2'd2;
                        AddSel = 0;
                    end
                    ADD_f: begin
                        RegDst = 0;
                        ALUSrc = 0;
                        RegWr = 1;
                        MemWr = 0;
                        ALUCtrl = alu_add;
                        MemToReg = 0;
                        PCSel = 1;
                        AddSel = 0;
                    end
                    SLT_f: begin
                        RegDst = 0;
                        ALUSrc = 0;
                        RegWr = 1;
                        MemWr = 0;
                        ALUCtrl = alu_slt;
                        MemToReg = 0;
                        PCSel = 1;
                        AddSel = 0;
                    end
                    SUB_f: begin
                        RegDst = 0;
                        ALUSrc = 0;
                        RegWr = 1;
                        MemWr = 0;
                        ALUCtrl = alu_sub;
                        MemToReg = 0;
                        PCSel = 1;
                        AddSel = 0;
                    end
                    default: begin
                        RegDst = 2'bxx;
                        ALUSrc = 1'bx;
                        RegWr = 1'bx;
                        MemWr = 1'bx;
                        ALUCtrl = 2'bxx;
                        MemToReg = 1'bx;
                        PCSel = 2'bxx;
                        AddSel = 1'bx;
                    end
                endcase
            end
            default: begin
                RegDst = 2'bxx;
                ALUSrc = 1'bx;
                RegWr = 1'bx;
                MemWr = 1'bx;
                ALUCtrl = 2'bxx;
                MemToReg = 1'bx;
                PCSel = 2'bxx;
                AddSel = 1'bx;
            end
        endcase
    end

endmodule
