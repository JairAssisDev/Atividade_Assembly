.data
    prompt1: .asciiz "Digite o primeiro número: "
    prompt2: .asciiz "Digite o segundo número: "
    result: .asciiz "O maior número é: "
    
.text
.globl main
main:

    li $v0, 4
    la $a0, prompt1
    syscall
    

    li $v0, 5
    syscall
    move $t0, $v0
    

    li $v0, 4
    la $a0, prompt2
    syscall
    

    li $v0, 5
    syscall
    move $t1, $v0
    

    bgt $t0, $t1, first_greater
    move $t2, $t1
    j print_result
    
first_greater:
    move $t2, $t0
    
print_result:
    
    li $v0, 4
    la $a0, result
    syscall
    
    li $v0, 1
    move $a0, $t2
    syscall
    
   
    li $v0, 10
    syscall
