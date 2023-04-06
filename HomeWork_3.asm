#Christofer Patrick Paes
##
###Homework #3 

.data
    .eqv    SYS_PRINT_WORD   1  #word, byte, character
    .eqv    SYS_PRINT_FLOAT  2  #float  
    .eqv    SYS_PRINT_DOUBLE 3  #double
    .eqv    SYS_PRINT_TEXT   4  #text (zero terminated)
    .eqv    SYS_EXIT        10  #terminate
    
    
    
    x:		.word 0
   endl: 	.asciiz "\n"
   blank:	.asciiz "  "

    
        
                
    
    .text
.globl  main
main: 

	li $t0, 0  ##starting point for the loop variable i
	li $t1, 11 ## end counter
	li $t2, 4 ## modulo divsor
	lw  $t3, x
	li $t4, 0 ##
	
	##//loop 3 trimes through 0..3
	## for(int i = 0; i <= 12; i++
	##{
	###cout << x;
	
loop: 	
	
	  
	##Step 3 Implement the loop 	
		bgt $t0, $t1 exit
	
		move $a0, $t0
		move $a1, $t4
		
		#step 4 modify the values
		addi $t0, $t0, 1 ## adding one to the variables
		addi $t4, $t4, 1
		
		la $a0, blank
		li $v0, SYS_PRINT_TEXT	 ##create a space between prints
		syscall
		move $a2, $t2
		syscall
		
		move $a3, $t4 ##MOVE VALUE FROM TEPORARY REGISTER #4 TO ARG REGISTER 3
		syscall
		
		div $t4, $t2 #USING THE DIVIDE INSTRUCTION TO DIVDE THE FIRST BY THE SECOND
		mfhi $t4 ## COPYING FROM SPECIAL HI RREGISTER TO TEMPORARY
		syscall
	
	
	
		la $a0,-1($a3) ##this prints the value from the t4 register before the operation, the fist time through. I use an offset of -1 to achieve the the zero case, which is line 56 "move $a3, $t4"
		li $v0, SYS_PRINT_WORD ## THIS PRINTS THE NUMBER FROM THE MODULO OPERATION
		syscall
	
	
		la $a0, blank
		li $v0, SYS_PRINT_TEXT	 ##create a space between prints
		syscall
		b loop ## jump to 

	
#---- terminate ---
exit:
    li  $v0, SYS_EXIT
    syscall
    
#.end main
    
