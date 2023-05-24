.data
    prompt: .asciiz "Digite um número inteiro positivo: "
    result_prime: .asciiz "O número é primo."
    result_not_prime: .asciiz "O número não é primo."
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
    
    li $t1, 2
    move $t2, $zero
    
    loop:
        div $t0, $t1
        mfhi $t3
        beqz $t3, not_prime
        
        addi $t1, $t1, 1
        slt $t4, $t1, $t0
        bnez $t4, loop
        
        j prime
        
    not_prime:
        li $t2, 1
        
    prime:
        beqz $t2, print_result_prime
        j print_result_not_prime
        
    print_result_prime:
        li $v0, 4
        la $a0, result_prime
        syscall
        
        j print_result_exit
        
    print_result_not_prime:
        li $v0, 4
        la $a0, result_not_prime
        syscall
        
    print_result_exit:
        li $v0, 4
        la $a0, novalinha
        syscall
        
        li $v0, 10
        syscall
