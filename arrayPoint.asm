.data
iArray: .word   1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 13
arEnd:
length: .word   12
iSum:   .word   0


    .eqv    SYS_PRINT_WORD   1  #word, byte, character
    .eqv    SYS_PRINT_FLOAT  2  #float  
    .eqv    SYS_PRINT_DOUBLE 3  #double
    .eqv    SYS_PRINT_TEXT   4  #text (zero terminated)
    .eqv    SYS_EXIT        10  #terminate
    
      blank:  .asciiz     " "
      
      
      
.text
.globl  main
main:
 
 	la $a0, iArray 
 	la $a1, arEnd
 	la $s1, iSum
 	
 loop:
 
 	sw $zero, 0($a0) ## arrray[i] = 0 
 	sw $s1, iSum
 	lw $a0, iSum
 	li $v0, SYS_PRINT_WORD
 	syscall
 	addi $a0, $a0, 4
 	bne $a0, $a1, loop
 	                     # goto loop1       #-- exit    
 	                        li   $v0, 10       
 	                        syscall
