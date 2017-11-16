# Set Less Than unit tests
main:
addi $t1, $zero, 6
addi $t2, $zero 57

addi $t3, $zero, -9
addi $t4, $zero, 20

addi $t5, $zero, -5
addi $t6, $zero, -11

slt $t0, $t1, $t2
slt $t0, $t3, $t4
slt $t0, $t5, $t6
j end

end:
j end