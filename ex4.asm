.data
    prompt: .asciiz "Digite um número inteiro (ou zero para sair): "
    result: .asciiz "A soma dos números é: "
    novalinha: .asciiz "\n"
    
.text
.globl main
main:
    li $t0, 0
    
loop:
    li $v0, 4
    la $a0, prompt
    syscall
    
    li $v0, 5
    syscall
    move $t1, $v0
    
    beqz $t1, print_result
    
    add $t0, $t0, $t1
    
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
