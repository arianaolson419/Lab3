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
endmodule
