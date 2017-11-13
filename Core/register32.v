`include "Core/register.v"

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
endmodule
