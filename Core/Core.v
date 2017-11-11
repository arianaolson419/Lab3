// Core controls the central registor and memory storage and manipulation

`include "Core/ALU/alu.v"
`include "Core/memory.v"
`include "Core/regfile.v"
`include "Core/signextend.v"

module Core
(
    input CLK,
    // Decoded Instruction Values
    input[4:0] Rd, Rt, Rs,
    input[15:0] imm,
    input[31:0] addedPC,
    // Control Signals
    input[1:0] RegDst,
    input RegWr, MemWr, ALUSrc,
    input[1:0] MemToReg,
    input[2:0] ALUCntrl,
    // Outputs
    output[31:0] Da,
    output isZero
);

    wire[4:0] WriteAddr;

    // Register file write address
    mux4input #(.width(5)) RegWriteAddr (Rd, Rt, 5'd31, 5'bx, RegDst, WriteAddr);

    // wire[31:0] dataaout;
    wire[31:0] databout;
    wire[31:0] datain;

    // Register file
    regfile regfile (Da, databout, datain, Rs, Rt, WriteAddr, RegWr, CLK);

    // Sign extend

    wire[31:0] signextimm;
    signextend extend (imm, signextimm);

    // ALU operand 2 mux
    wire[31:0] operandb;

    mux4input #(.width(32)) aluinput (databout, signextimm, 32'bx, 32'bx, {1'b0, ALUSrc}, operandb);

    // ALU
    wire cout;
    wire overflow;
    wire[31:0] finalsignal;

    ALUcontrolLUT aluout (cout, overflow, isZero, finalsignal, ALUCntrl, Da, operandb);

    // Regfile write data mux
    wire[31:0] memout;

    mux4input #(.width(32)) regdatamux (finalsignal, memout, addedPC, 32'bx, MemToReg, datain);

    // Data Meomory
    memory datamemory (CLK, memout, finalsignal, MemWr, databout);

endmodule
