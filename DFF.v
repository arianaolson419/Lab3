// DFF is a d flip flop.

module DFF #( parameter W = 1 )
(
    input trigger,
    input enable,
    input      [W-1:0] in,
    output reg [W-1:0] out
);
    always @(posedge trigger or negedge enable) begin
        if(enable) begin
            out <= in;
        end
        else begin
            out <= 0;
        end
    end
endmodule
