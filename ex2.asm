.data
    prompt: .asciiz "Digite um número inteiro positivo: "
    even_numeros: .asciiz "Números pares: "
    novalinha: .asciiz "\n"
    
.text
.globl main
main:
    li $v0, 4
    la $a0, prompt
    syscall
    
    li $v0, 5
    syscall
    move $t0, $v0
    
    li $v0, 4
    la $a0, even_numeros
    syscall
    
    li $t1, 0
    
loop:
    bgt $t1, $t0, exit
    
    andi $t2, $t1, 1
    beqz $t2, print_numero
    
    addi $t1, $t1, 1
    j loop
    
print_numero:
    li $v0, 1
    move $a0, $t1
    syscall
    
    li $v0, 4
    la $a0, novalinha
    syscall
    
    addi $t1, $t1, 1
    j loop
        
exit:
    li $v0, 10
    syscall
