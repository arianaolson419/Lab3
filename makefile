all: core

core: core.v core.t.v
	iverilog -Wall -o core core.t.v