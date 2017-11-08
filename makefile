all: core

core: core.v
	iverilog -Wall -o core core.v