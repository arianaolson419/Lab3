// Single-bit D Flip-Flop with enable
//   Positive edge triggered
module register
(
output reg	q,
input		d,
input		wrenable,
input		clk
);

    always @(posedge clk) begin
        if(wrenable) begin
            q = d;
        end
    end
endmodule // register

// 32 bits of D Flip-Flops with enable.
// Positive edge triggered
module register32
(
output [31:0] q,
input[31:0] d,
input wrenable, 
input clk
);

	genvar i;
	for (i = 0; i < 32; i = i + 1) begin
		register singleRegister (q[i], d[i], wrenable, clk);
	end
endmodule // register32


// 1 bit register with constant output 0.
// Inputs are ignored.
module register32zero 
(
output [31:0] q,
input[31:0] d,
input wrenable, 
input clk
);
	genvar i;
	for (i = 0; i < 32; i = i + 1) begin
		assign q[i] = 1'b0;
	end
endmodule // register32zero