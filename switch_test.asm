

.data
			 .eqv    SYS_PRINT_WORD   1  #word, byte, character
   			 .eqv    SYS_PRINT_FLOAT  2  #float  
   			 .eqv    SYS_PRINT_DOUBLE 3  #double
  			 .eqv    SYS_PRINT_TEXT   4  #text (zero terminated)
    			 .eqv    SYS_EXIT        10  #terminate
    			 
    			 
    			 
    			 
JUMP_TABLE:		.word case0, case1, case2


			.text
			
			
main: 

case0: 	
	
	la	$a0, 0($s0)
	li	$v0, SYS_PRINT_WORD
	b	END_SWITCH
		
		
case1:
	la	$a0, 0($s0)
	li	$v0, SYS_PRINT_WORD
	b 	END_SWITCH
	
case2:
	la	$a0, 0($s0)
	li	$v0, SYS_PRINT_WORD
	b  END_SWITCH
	
	
END_SWITCH:
li  $v0, SYS_EXIT
    syscall