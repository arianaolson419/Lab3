all: core alu regfile memory signextend

### CPU Module
CPU: CPU.v CPU.t.v
	iverilog -Wall -o CPU CPU.t.v

### PC_Calc Modules
# PC_Calc top level module
PC_Calc: PC_Calc/PC_Calc.v  PC/PC_Calc.t.v addr_concat imm_concat is_zero_and
	iverilog -Wall -o PC_Calc/PC_Calc PC_Calc/PC_Calc.t.v

addr_concat: PC_Calc/addr_concat.v PC_Calc/addr_concat.t.v
	iverilog -Wall -o PC_Calc/addr_concat addr_concat.t.v

imm_concat: PC_Calc/imm_concat.v PC_Calc/imm_concat.t.v
	iverilog -Wall -o PC_Calc/imm_concat imm_concat.t.v

is_zero_and: PC_Calc/is_zero_and.v PC_Calc/is_zero_and.t.v
	iverilog -Wall -o PC_Calc/is_zero_and is_zero_and.t.v

### Instruction Parser Modules
# Instruction Parser top level module
Instruction_Parser: Instruction_Parser.v Instruction_Parser.t.v Controller Decoder Memory
	iverilog -Wall -o Instruction_Parser/Instruction_Parser Instruction_Parser.v

Controller: Controller.v Controller.t.v
	iverilog -Wall -o Instruction_Parser/Controller Instruction_Parser/Controller.t.v

Decoder: Decoder.v Decoder.t.v
	iverilog -Wall -o Instruction_Parser/Decoder Instruction_Parser/Decoder.t.v

Memory: Memory.v Memory.t.v
	iverilog -Wall -o Instruction_Parser/Memory Instruction_Parser/Memory.t.v


### Core Modules
# Core top level module
core: Core/Core.v Core/Core.t.v regfile
	iverilog -Wall -o Core/core Core/Core.t.v

# ALU modules
alu: Core/ALU/alu.v Core/ALU/alu.t.v adder_subtracter and nand nor or slt xor
	iverilog -Wall -o Core/ALU/alu Core/ALU/alu.t.v

adder_subtracter: Core/ALU/adder_subtracter.v Core/ALU/adder_subtracter.t.v
	iverilog -Wall -o Core/ALU/adder_subtracter Core/ALU/adder_subtracter.t.v

and: Core/ALU/and_32bit.v Core/ALU/and_32bit.t.v
	iverilog -Wall -o Core/ALU/and Core/ALU/and_32bit.t.v

nand: Core/ALU/nand_32bit.v Core/ALU/nand_32bit.t.v
	iverilog -Wall -o Core/ALU/nand Core/ALU/nand_32bit.t.v

nor: Core/ALU/nor_32bit.v Core/ALU/nor_32bit.t.v
	iverilog -Wall -o Core/ALU/nor Core/ALU/nor_32bit.t.v

or: Core/ALU/or_32bit.v Core/ALU/or_32bit.t.v
	iverilog -Wall -o Core/ALU/or Core/ALU/or_32bit.t.v

slt: Core/ALU/slt.v Core/ALU/slt.t.v
	iverilog -Wall -o Core/ALU/slt Core/ALU/slt.t.v

xor: Core/ALU/xor_32bit.v Core/ALU/xor_32bit.t.v
	iverilog -Wall -o Core/ALU/xor Core/ALU/xor_32bit.t.v

# Regfile modules
regfile: Core/regfile.t.v Core/regfile.v decoder multiplexer register
	iverilog -Wall -o Core/regfile Core/regfile.t.v

decoder: Core/decoders.t.v Core/decoders.v
	iverilog -Wall -o Core/decoder Core/decoders.t.v

register: Core/register.t.v Core/register.v
	iverilog -Wall -o Core/register Core/register.t.v

# Memory modules
memory: Core/memory.v Core/memory.t.v
	iverilog -Wall -o Core/memory Core/memory.t.v

# Concatenation modules
signextend: Core/signextend.v
	iverilog -Wall -o Core/signextend Core/signextend.v 

### Submodules
multiplexer: submodules/multiplexer.v submodules/multiplexer.t.v
	iverilog -Wall -o multiplexer submodules/multiplexer.t.v