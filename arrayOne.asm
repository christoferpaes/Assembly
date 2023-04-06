#  Example program to sum an array of integers #  and compute the float average.# -------------------------------------------------------
#  Data Declarations.data       

# --------------------------------------------------------
#  Text/code section

.data
iArray: .word   1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 13
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
 
 # ------


la $t0, iArray ## this is the starting address 
lw $t1,length
li $t2,0 
li $t4, 0

loop: 
	lw $t3, ($t0) ## this sets the index to $t3
	sw $t3, iSum ## store the word in memory
	lw $a0, iSum ## load the word from memory 
	li $v0, SYS_PRINT_WORD  # print 
	syscall
	
	la $a0, blank
	li $v0, SYS_PRINT_TEXT ## blank 
	syscall
	
	addu $t0,$t0, 4  ## offset by four because it is a word
	sub $t1, $t1, 1 
	bnez $t1, loop
	
	
exit:	li		$v0, SYS_EXIT
	syscall
