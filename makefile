all: core alu regfile memory signextend

# Core modules
core: core.v core.t.v
	iverilog -Wall -o core core.t.v

# ALU modules
alu: alu.v alu.t.v adder_subtracter and nand nor or slt xor
	iverilog -Wall -o alu alu.t.v

adder_subtracter: adder_subtracter.v adder_subtracter.t.v
	iverilog -Wall -o adder_subtracter adder_subtracter.t.v

and: and_32bit.v and_32bit.t.v
	iverilog -Wall -o and and_32bit.t.v

nand: nand_32bit.v nand_32bit.t.v
	iverilog -Wall -o nand nand_32bit.t.v

nor: nor_32bit.v nor_32bit.t.v
	iverilog -Wall -o nor nor_32bit.t.v

or: or_32bit.v or_32bit.t.v
	iverilog -Wall -o or or_32bit.t.v

slt: slt.v slt.t.v
	iverilog -Wall -o slt slt.t.v

xor: xor_32bit.v xor_32bit.t.v
	iverilog -Wall -o xor xor_32bit.t.v

# Regfile modules
regfile: regfile.t.v regfile.v decoder mux register
	iverilog -Wall -o regfile regfile.t.v

decoder: decoders.t.v decoders.v
	iverilog -Wall -o decoder decoders.t.v

mux: multiplexer.t.v multiplexer.v
	iverilog -Wall -o mux multiplexer.t.v

register: register.t.v register.v
	iverilog -Wall -o register register.t.v

# Memory modules
memory: memory.v memory.t.v
	iverilog -Wall -o memory memory.t.v

# Concatenation modules
signextend: signextend.v
	iverilog -Wall -o signextend signextend.v 
