.data
    result: .asciiz "A soma dos números de 1 a 100 é: "
    novalinha: .asciiz "\n"

.text
.globl main
main:
    li $t0, 0
    li $t1, 1

loop:
    add $t0, $t0, $t1
    addi $t1, $t1, 1
    bgt $t1, 100, print_result
    j loop

print_result:
    li $v0, 4
    la $a0, result
    syscall

    li $v0, 1
    move $a0, $t0
    syscall

    li $v0, 4
    la $a0, novalinha
    syscall

    li $v0, 10
    syscall
