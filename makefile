all: core alu regfile memory signextend

# Core modules
core: Core/Core.v Core/Core.t.v
	iverilog -Wall -o core Core/Core.t.v

# ALU modules
alu: Core/ALU/alu.v Core/ALU/alu.t.v adder_subtracter and nand nor or slt xor
	iverilog -Wall -o alu Core/ALU/alu.t.v

adder_subtracter: Core/ALU/adder_subtracter.v Core/ALU/adder_subtracter.t.v
	iverilog -Wall -o adder_subtracter Core/ALU/adder_subtracter.t.v

and: Core/ALU/and_32bit.v Core/ALU/and_32bit.t.v
	iverilog -Wall -o and Core/ALU/and_32bit.t.v

nand: Core/ALU/nand_32bit.v Core/ALU/nand_32bit.t.v
	iverilog -Wall -o nand Core/ALU/nand_32bit.t.v

nor: Core/ALU/nor_32bit.v Core/ALU/nor_32bit.t.v
	iverilog -Wall -o nor Core/ALU/nor_32bit.t.v

or: Core/ALU/or_32bit.v Core/ALU/or_32bit.t.v
	iverilog -Wall -o or Core/ALU/or_32bit.t.v

slt: Core/ALU/slt.v Core/ALU/slt.t.v
	iverilog -Wall -o slt Core/ALU/slt.t.v

xor: Core/ALU/xor_32bit.v Core/ALU/xor_32bit.t.v
	iverilog -Wall -o xor Core/ALU/xor_32bit.t.v

# Regfile modules
regfile: Core/regfile.t.v Core/regfile.v decoder mux register
	iverilog -Wall -o regfile Core/regfile.t.v

decoder: Core/decoders.t.v Core/decoders.v
	iverilog -Wall -o decoder Core/decoders.t.v

mux: Core/multiplexer.t.v Core/multiplexer.v
	iverilog -Wall -o mux Core/multiplexer.t.v

register: Core/register.t.v Core/register.v
	iverilog -Wall -o register Core/register.t.v

# Memory modules
memory: Core/memory.v Core/memory.t.v
	iverilog -Wall -o memory Core/memory.t.v

# Concatenation modules
signextend: Core/signextend.v
	iverilog -Wall -o signextend Core/signextend.v 
