/*
The memory used in the CPU
*/

module memory
#(
    parameter addresswidth  = 32,
    parameter depth         = addresswidth,
    parameter width         = 32
)
(
    input 		                clk,
    output reg [width-1:0]      dataOut,
    input [addresswidth-1:0]    address,
    input                       writeEnable,
    input [width-1:0]           dataIn
);


    reg [width-1:0] memory [depth-1:0];

    always @(negedge clk) begin
        if(writeEnable)
            memory[address] <= dataIn;
        dataOut <= memory[address];
    end

    initial $readmemh("Core/data_memory.dat", memory);

endmodule
