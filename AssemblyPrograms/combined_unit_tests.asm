# Test the addi command
additest:
addi $t0, $zero, 5	# $t0 = 5
addi $t1, $t0, 125	# $t1 = 130
addi $t0, $t0, 4	# $t0 = 9

# Test the xori command
xoritest:
# Reset the designated result register
addi $t0, $zero, 0

addi $t1, $zero, 2
addi $t2, $zero, 11

xori $t0, $t1, 7	# $t0 = 5
xori $t0, $t2, 11	# $t0 = 0

# Test the add command
addtest:
# Reset the designated result register
addi $t0, $zero, 0

# Two positive numbers
addi $t1, $zero, 6
addi $t2, $zero, 57

# One positive and one negative number
addi $t3, $zero, -9
addi $t4, $zero, 20

# Two negative numbers
addi $t5, $zero, -5
addi $t6, $zero, -11

add $t0, $t1, $t2	# $t0 = 57 + 6 = 63
add $t0, $t3, $t4	# $t0 = -9 + 20 = 11
add $t0, $t5, $t6	# $t0 = -5 + -11 = -16

# Test the sub command
subtest:
# Reset the designated result register
addi $t0, $zero, 0

sub $t0, $t1, $t2	# $t0 = 6 - 57 = -51
sub $t0, $t3, $t4	# $t0 = -9 - 20 = -29
sub $t0, $t5, $t6	# $t0 = -5 - -11 = 6

# Test the slt command
slttest:
# Reset the designated result register
addi $t0, $zero, 0

slt $t0, $t1, $t2	# $t0 = 57 < 6 = 1
slt $t0, $t3, $t4	# $t0 = -9 < 20 = 1
slt $t0, $t5, $t6	# $t0 = -5 < 11 = 0

# Test the bne command
breginit:
addi $t3, $zero, 0
addi $t4, $zero, 4

whileloop:
bne $t3, $t4, branchtaken

saveres:
addi $t5, $t3, 0	# $t5 = 4
j swtest

branchtaken:
addi $t3, $t3, 1
j whileloop

swtest:
addi $sp, $zero, 64
addi $t1, $zero, 2
addi $t2, $zero, 169

sw $t1, 0($sp)
sw $t2, -4($sp)

lwtest:
lw $t3, 0($sp)	# $t3 = $t1 = 2
lw $t4, -4($sp)	# $t4 = $t2 = 169

jaltest:
addi $t1, $zero 100	# $t1 = 100
jal jrtest
addi $t1, $t1, 1	# $t1 = 102
j end

jrtest:
addi $t1, $t1, 1	# $t1 = 101
jr $ra

end:
j end
