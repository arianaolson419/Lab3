// 32 bit decoder with enable signal
//   enable=0: all output bits are 0
//   enable=1: out[address] is 1, all other outputs are 0
module decoder1to32
(
output[31:0]	out,
input		enable,
input[4:0]	address
);

    assign out = enable<<address; 

endmodule

// Enable is set to be the least significant bit of out. The
// value of address (which can be between 0 and 31) indicates
// the number of bits out should be be shifted left by.

// So, the decoder selects the register which is being written to (if any)
// by using the value of adress.
