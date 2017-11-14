// DFF is a d flip flop.

module DFF #( parameter W = 1 )
(
    input trigger,
    input enable,
    input      [W-1:0] in,
    output reg [W-1:0] out
);
    always @(posedge trigger) begin
        if(enable) begin
            out <= in;
        end
    end
endmodule
