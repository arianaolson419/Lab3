# Test commands for the CPU
testaddi:
addi $t0, $zero, 1
addi $t1, $zero, 10
j testslt

addi $t1, $zero, 4

testslt:
#sw $t0, 0($sp)
addi $t1, $zero, 4
j end

end:
j end

.data