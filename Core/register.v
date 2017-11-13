// Single-bit D Flip-Flop with enable
//   Positive edge triggered
module register
(
output reg	q,
input		d,
input		wrenable,
input		clk
);

    always @(negedge clk) begin
        if(wrenable) begin
            q = d;
        end
    end
endmodule
