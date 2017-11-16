main:
addi $t3, $zero, 0
addi $t4, $zero, 4

whileloop:
bne $t3, $t4, branchtaken

saveres:
addi $t5, $t3, 0
j end

branchtaken:
addi $t3, $t3, 1
j whileloop

end:
j end
