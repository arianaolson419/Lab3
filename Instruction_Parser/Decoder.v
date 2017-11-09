// Decoder splits the insruction into its parts

module Decoder
(
  input[31:0] Instr,
  output[5:0] Op,
  output[4:0] Rs, Rd, Rt,
  output[15:0] imm,
  output[25:0] addr
);

  assign Op = Instr[31:26];
  assign Rs = Instr[25:21];
  assign Rt = Instr[20:16];
  assign Rd = Instr[15:11];
  assign imm = Instr[15:0];
  assign addr = Instr[25:0];
endmodule
