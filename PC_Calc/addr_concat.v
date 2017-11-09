module addrConcat
(
	output[31:0] out,
	input[31:0] pc,
	input[25:0] jumpAddr
);
	assign out = {pc[31:28], jumpAddr, 2'b00};
endmodule