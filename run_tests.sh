#!/bin/bash

make

java -jar ../Mars4_5.jar a dump .text HexText fib.text mc CompactTextAtZero AssemblyPrograms/fibonacci.asm

cat fib.text > mem.dat

./CPU_fib

java -jar ../Mars4_5.jar a dump .text HexText while_loop.text mc CompactTextAtZero AssemblyPrograms/testCPU.asm

cat while_loop.text > mem.dat

./CPU_while

java -jar ../Mars4_5.jar a dump .text HexText combined_unit_tests.text mc CompactTextAtZero AssemblyPrograms/combined_unit_tests.asm

cat combined_unit_tests.text > mem.dat

./CPU_unit

cat Core/file.dat > mem.dat
./Core/core
./Core/ALU/alu
./Core/regfile
./PC_Calc/PC_Calc
./Instruction_Parser/Instruction_Parser