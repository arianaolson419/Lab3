all: core alu

core: core.v core.t.v
	iverilog -Wall -o core core.t.v

alu: alu.v alu.t.v
	iverilog -Wall -o alu alu.t.v

adder_subtracter: adder_subtracter.v adder_subtracter.t.v
	iverilog -Wall -o adder_subtracter adder_subtracter.t.v

and: and_32bit.v and_32bit.t.v
	iverilog -Wall -o and and_32bit.t.v

nand: nand_32bit.v nand_32bit.t.v
	iverilog -Wall -o nand nand_32bit

nor: nor_32bit.v nor_32bit.t.v
	iverilog -Wall -o nor nor_32bit

or: or_32bit.v or_32bit.t.v
	iverilog -Wall -o or or_32bit

slt: slt.v slt.t.v
	iverilog -Wall -o slt slt.t.v

xor: xor_32bit.v xor_32bit.t.v
	iverilog -Wall -o xor xor_32bit