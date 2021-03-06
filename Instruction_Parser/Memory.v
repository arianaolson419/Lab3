// Memory is a big d flip flop

module Memory
(
    input clk, regWE,
    input[9:0] Addr,
    input[31:0] DataIn,
    output[31:0]  DataOut
);

    reg [31:0] mem[1023:0];

    always @(posedge clk) begin
        if (regWE) begin
            mem[Addr] <= DataIn;
        end
    end

    // This file will be loaded dynamically. Do not edit mem.dat directly.
    initial $readmemh("mem.dat", mem);

    assign DataOut = mem[Addr];
endmodule
