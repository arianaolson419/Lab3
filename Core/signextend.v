/*
Implement the sign extend immediate operation defined by the MIPS reference guide.
*/

module signextend
(
input[15:0] immediate,
output[31:0] signextendimmediate
);

	assign signextendimmediate = {{16{immediate[15]}}, {immediate[15:0]}};
endmodule