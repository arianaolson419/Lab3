//------------------------------------------------------------------------------
// MIPS register file
//   width: 32 bits
//   depth: 32 words (reg[0] is static zero register)
//   2 asynchronous read ports
//   1 synchronous, positive edge triggered write port
//------------------------------------------------------------------------------

`include "Core/register.v"
`include "Core/multiplexer.v"
`include "Core/decoders.v"

module regfile
(
output[31:0]    ReadData1,  // Contents of first register read
output[31:0]    ReadData2,  // Contents of second register read
input[31:0] WriteData,  // Contents to write to register
input[4:0]  ReadRegister1,  // Address of first register to read
input[4:0]  ReadRegister2,  // Address of second register to read
input[4:0]  WriteRegister,  // Address of register to write
input       RegWrite,   // Enable writing of register when High
input       Clk     // Clock (Positive Edge Triggered)
);

  wire[31:0] decoderOut;  //  Send a wrenable to at most one register.
  wire[31:0] register0out;  // The output data of the register.
  wire[31:0] register1out;
  wire[31:0] register2out;
  wire[31:0] register3out;
  wire[31:0] register4out;
  wire[31:0] register5out;
  wire[31:0] register6out;
  wire[31:0] register7out;
  wire[31:0] register8out;
  wire[31:0] register9out;
  wire[31:0] register10out;
  wire[31:0] register11out;
  wire[31:0] register12out;
  wire[31:0] register13out;
  wire[31:0] register14out;
  wire[31:0] register15out;
  wire[31:0] register16out;
  wire[31:0] register17out;
  wire[31:0] register18out;
  wire[31:0] register19out;
  wire[31:0] register20out;
  wire[31:0] register21out;
  wire[31:0] register22out;
  wire[31:0] register23out;
  wire[31:0] register24out;
  wire[31:0] register25out;
  wire[31:0] register26out;
  wire[31:0] register27out;
  wire[31:0] register28out;
  wire[31:0] register29out;
  wire[31:0] register30out;
  wire[31:0] register31out;

  // The decoder block.
  decoder1to32 decoder(decoderOut, RegWrite, WriteRegister);

  // The 32 register blocks.
  register32zero reg0 (register0out, WriteData, decoderOut[0], Clk); // The zero register.
  register32 reg1 (register1out, WriteData, decoderOut[1], Clk);
  register32 reg2 (register2out, WriteData, decoderOut[2], Clk);
  register32 reg3 (register3out, WriteData, decoderOut[3], Clk);
  register32 reg4 (register4out, WriteData, decoderOut[4], Clk);
  register32 reg5 (register5out, WriteData, decoderOut[5], Clk);
  register32 reg6 (register6out, WriteData, decoderOut[6], Clk);
  register32 reg7 (register7out, WriteData, decoderOut[7], Clk);
  register32 reg8 (register8out, WriteData, decoderOut[8], Clk);
  register32 reg9 (register9out, WriteData, decoderOut[9], Clk);
  register32 reg10 (register10out, WriteData, decoderOut[10], Clk);
  register32 reg11 (register11out, WriteData, decoderOut[11], Clk);
  register32 reg12 (register12out, WriteData, decoderOut[12], Clk);
  register32 reg13 (register13out, WriteData, decoderOut[13], Clk);
  register32 reg14 (register14out, WriteData, decoderOut[14], Clk);
  register32 reg15 (register15out, WriteData, decoderOut[15], Clk);
  register32 reg16 (register16out, WriteData, decoderOut[16], Clk);
  register32 reg17 (register17out, WriteData, decoderOut[17], Clk);
  register32 reg18 (register18out, WriteData, decoderOut[18], Clk);
  register32 reg19 (register19out, WriteData, decoderOut[19], Clk);
  register32 reg20 (register20out, WriteData, decoderOut[20], Clk);
  register32 reg21 (register21out, WriteData, decoderOut[21], Clk);
  register32 reg22 (register22out, WriteData, decoderOut[22], Clk);
  register32 reg23 (register23out, WriteData, decoderOut[23], Clk);
  register32 reg24 (register24out, WriteData, decoderOut[24], Clk);
  register32 reg25 (register25out, WriteData, decoderOut[25], Clk);
  register32 reg26 (register26out, WriteData, decoderOut[26], Clk);
  register32 reg27 (register27out, WriteData, decoderOut[27], Clk);
  register32 reg28 (register28out, WriteData, decoderOut[28], Clk);
  register32 reg29 (register29out, WriteData, decoderOut[29], Clk);
  register32 reg30 (register30out, WriteData, decoderOut[30], Clk);
  register32 reg31 (register31out, WriteData, decoderOut[31], Clk);

  // The multiplexer choosing the data associated with ReadRegister1.
  mux32to1by32 mux1 (ReadData1, ReadRegister1, register0out, register1out,
    register2out, register3out, register4out, register5out, register6out,
    register7out, register8out, register9out, register10out, register11out,
    register12out, register13out, register14out, register15out, register16out,
    register17out, register18out, register19out, register20out, register21out,
    register22out, register23out, register24out, register25out, register26out,
    register27out, register28out, register29out, register30out, register31out);

  // The multiplexer choosing the data associated with ReadREegister2.
  mux32to1by32 mux2 (ReadData2, ReadRegister2, register0out, register1out,
    register2out, register3out, register4out, register5out, register6out,
    register7out, register8out, register9out, register10out, register11out,
    register12out, register13out, register14out, register15out, register16out,
    register17out, register18out, register19out, register20out, register21out,
    register22out, register23out, register24out, register25out, register26out,
    register27out, register28out, register29out, register30out, register31out);

endmodule