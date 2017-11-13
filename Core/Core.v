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

    // Regfile wires
    wire[4:0] WriteAddr;
    wire[31:0] databout;
    wire[31:0] datain;
    // ALU operand 2 mux
    wire[31:0] operandb;
    // Sign extend
    wire[31:0] signextimm;
    // ALU
    wire cout;
    wire overflow;
    wire[31:0] finalsignal;
    // Regfile write data mux
    wire[31:0] memout;

    // Register file write address
    mux4input #(.width(5)) RegWriteAddr (Rd, Rt, 5'd31, 5'bx, RegDst, WriteAddr);


    // Register file
    regfile regfile (Da, databout, datain, Rs, Rt, WriteAddr, RegWr, CLK);

    signextend extend (imm, signextimm);

    mux4input #(.width(32)) aluinput (databout, signextimm, 32'bx, 32'bx, {1'b0, ALUSrc}, operandb);


    ALUcontrolLUT aluout (cout, overflow, isZero, finalsignal, ALUCntrl, Da, operandb);


    mux4input #(.width(32)) regdatamux (finalsignal, memout, addedPC, 32'bx, MemToReg, datain);

    // Data Meomory
    memory datamemory (CLK, memout, finalsignal, MemWr, databout);

endmodule
