#    File: mlIfElse.asm
# Kurt Marley
#  Author: Christofer Patrick Paes 
#    Date: 09/22/2021
# Purpose: Practice if-else logic

.data
    .eqv    SYS_PRINT_WORD   1  #word, byte, character
    .eqv    SYS_PRINT_FLOAT  2  #float  
    .eqv    SYS_PRINT_DOUBLE 3  #double
    .eqv    SYS_PRINT_TEXT   4  #text (zero terminated)
    .eqv    SYS_INPUT_WORD   5  #input word
    .eqv    SYS_EXIT        10  #terminate

#   //declare variables
#   string result;
#   int x;
    result:         .asciiz "0123456789012345"  #max of 16 chars
    x:              .word   0  # copy of $s5
    endl:           .asciiz "\n"
    tx_prompt:      .asciiz "Please enter a value for x (integer): "
    tx_bbb:         .asciiz "bbb"
    tx_ccc:         .asciiz "ccc"
    tx_ddd:         .asciiz "ddd"
    tx_eee:         .asciiz "eee"
    prob1_label:    .asciiz "1.\t"
    prob2_label:    .asciiz "2.\t"
    prob3_label:    .asciiz "3.\t"
    prob4_label:    .asciiz "4.\t"

.text
.globl main
main:


		

#   //prompt for, read in a value for x
#   cout << "Please enter a value for x (integer): ";
#   cin >> x;  
 
    la  $a0, tx_prompt       # load address of prompt for syscall
    li  $v0, SYS_PRINT_TEXT  # specify Print String service
    syscall                  # print the prompt string
    li  $v0, SYS_INPUT_WORD  # specify Read Integer service
    syscall                  # Read the number. After this instruction, the number read is in $v0.
    add $s5, $v0, $zero      # transfer the number to s5
    la  $t0, x
    sw  $s5, 0($t0)          # s5 = x = input word number
    la  $s4, result          # s4 = address of result string

#   //PROBLEM1 


	sb	$zero, ($s4)
	
p1chk3:
	li	$t1, 3
	beq	$s5, $t1, p1ddd
	
p1chk4:
	li	$t1, 4
	beq	$s5, $t1, p1ddd

	
p1eee:
	la	$a0, result
	la 	$a1, tx_eee
	jal	concatstr
	j 	plprt
	
p1ddd:	
	la	$a0,result
	la	$a1, tx_ddd
	jal 	concatstr
plprt:
	la	$a0, prob1_label
	li	$v0, SYS_PRINT_TEXT
	syscall
	la	$a0, result
	li	$v0, SYS_PRINT_TEXT
	syscall
	la	$a0,endl
	li	$v0, SYS_PRINT_TEXT
	syscall


#   //PROBLEM2

    la  $a0, tx_prompt       # load address of prompt for syscall
    li  $v0, SYS_PRINT_TEXT  # specify Print String service
    syscall                  # print the prompt string
    li  $v0, SYS_INPUT_WORD  # specify Read Integer service
    syscall                  # Read the number. After this instruction, the number read is in $v0.
    add $s5, $v0, $zero      # transfer the number to s5
    la  $t0, x
    sw  $s5, 0($t0)          # s5 = x = input word number
    la  $s4, result          # s4 = address of result string
    
    


sb	$zero, ($s4)
    ##pseudo instruction below for if(x%2==0)
    #/ li $t2, 2 div $s5, $t2 mfhi $t7 ... beq $t7, $zero /
p2chkEven:

	li	$t2, 2 ## load a constant value into the temporary register#2 and load it with the value 2
	div 	$s5, $t2 #divide the value inputted from the user by 2 or register#2 loaded with value 2
	mfhi	$t7 #load the temporary register#7 with the remainder
	beq	$t7, $zero p2ddd ## branch if equal to zero, which just means if the value is even.. 
	
p2chk3:
	li	$t1, 3
	beq	$s5, $t1, p2ccc #branch to if equal to 3
	
p2chk5:
	li	$t1, 5
	beq	$s5, $t1, p2ccc ##branch to if equal to 5
p2chk4:
	li	$t1, 4
	beq	$s5, $t1, p2ddd ##branch to if equal to 4	
	
p2ccc:
	la	$a0, result # load address 
	la 	$a1, tx_ccc # load address
	jal	concatstr # concat str
	j 	p2prt 
p2ddd:
	la	$a0,result
	la	$a1, tx_ddd
	jal 	concatstr
	j 	p2prt 
	
p2prt:
	la	$a0, prob2_label
	li	$v0, SYS_PRINT_TEXT
	syscall
	la	$a0, result
	li	$v0, SYS_PRINT_TEXT
	syscall
	la	$a0,endl
	li	$v0, SYS_PRINT_TEXT
	syscall



#   //PROBLEM3
   la  $a0, tx_prompt       # load address of prompt for syscall
    li  $v0, SYS_PRINT_TEXT  # specify Print String service
    syscall                  # print the prompt string
    li  $v0, SYS_INPUT_WORD  # specify Read Integer service
    syscall                  # Read the number. After this instruction, the number read is in $v0.
    add $s5, $v0, $zero      # transfer the number to s5
    la  $t0, x
    sw  $s5, 0($t0)          # s5 = x = input word number
    la  $s4, result          # s4 = address of result string
    
    
    

    
    
sb	$zero, ($s4)
p13chk2:
	li	$t1, 2
	beq	$s5, $t1, p3bbb #branch to if equal to 3
	
p13chk3:
	li	$t1, 3
	beq	$s5, $t1, p3ccc ##branch to if equal to 5
p13chk4:
	li	$t1, 4
	beq	$s5, $t1, p3ddd ##branch to if equal to 4	
p3bbb:
	la	$a0, result # load address 
	la 	$a1, tx_bbb # load address
	jal	concatstr # concat str
	j 	pl3prt 	

p3ccc:
	la	$a0, result # load address 
	la 	$a1, tx_ccc # load address
	jal	concatstr # concat str
	j 	pl3prt 
p3ddd:
	la	$a0,result
	la	$a1, tx_ddd
	jal 	concatstr
	j 	pl3prt 
p3eee:
	la	$a0,result
	la	$a1, tx_eee
	jal 	concatstr
	j 	pl3prt 
	
pl3prt:
	la	$a0, prob3_label
	li	$v0, SYS_PRINT_TEXT
	syscall
	la	$a0, result
	li	$v0, SYS_PRINT_TEXT
	syscall
	la	$a0,endl
	li	$v0, SYS_PRINT_TEXT
	syscall





#   //PROBLEM4
#   //PROBLEM4 - if x has a value of 4, print "ddd"
#   //           if x has a value of 3, print "ccc"
#   //           any other value (not 3 or 4), print "eee"
#   result = "";
#   if (x==4) result = result + "ddd";
#   else if (x==3) result = result + "ccc";
#   else           result = result + "eee";
#   cout << "4.\t" << result << endl;
#
# }//end main()


  la  $a0, tx_prompt       # load address of prompt for syscall
    li  $v0, SYS_PRINT_TEXT  # specify Print String service
    syscall                  # print the prompt string
    li  $v0, SYS_INPUT_WORD  # specify Read Integer service
    syscall                  # Read the number. After this instruction, the number read is in $v0.
    add $s5, $v0, $zero      # transfer the number to s5
    la  $t0, x
    sw  $s5, 0($t0)          # s5 = x = input word number
    la  $s4, result          # s4 = address of result string
    
    
    

    
    
sb	$zero, ($s4)

	
p4chk3:
	li	$t1, 3
	beq	$s5, $t1, p4ccc ##branch to if equal to 5
p4chk4:
	li	$t1, 4
	beq	$s5, $t1, p4ddd ##branch to if equal to 4	

p4ccc:
	la	$a0, result # load address 
	la 	$a1, tx_ccc # load address
	jal	concatstr # concat str
	j 	p4prt 
p4ddd:
	la	$a0,result
	la	$a1, tx_ddd
	jal 	concatstr
	j 	p4prt 
p4eee:
	la	$a0,result
	la	$a1, tx_eee
	jal 	concatstr
	j 	p4prt 
	
p4prt:
	la	$a0, prob4_label
	li	$v0, SYS_PRINT_TEXT
	syscall
	la	$a0, result
	li	$v0, SYS_PRINT_TEXT
	syscall
	la	$a0,endl
	li	$v0, SYS_PRINT_TEXT
	syscall




#---- terminate ---
exit:
    li  $v0, SYS_EXIT
    syscall
    
#-------------------------------------------------------------
# concatstr - concatenate $a1 to $a0 string
#     input $a0 - address of result string
#     input $a1 - address of string to concatenate to result
#     output $a0 - address of end of string \0
#     output $a1 - address of end of string \0
#-------------------------------------------------------------
concatstr:
#find \0 in a0 result string
findend:
    lbu     $t0, 0($a0)
    beq     $t0, $zero, docopy  # branch if result.at(a0) == '\0'
    addiu   $a0, $a0, 1
    j       findend         # move to next char and keep looking
# concatenate a1 chars to a0 chars
docopy:
    lbu     $t0, 0($a1)                 # get current char from a1
    sb      $t0, 0($a0)                 # copy current char to a0
    beq     $t0, $zero, concatstr_exit  # if char == '\0', branch & stop if char was '\0'
    addiu   $a0, $a0, 1                 # advance to next char
    addiu   $a1, $a1, 1                 # advance to next char
    j       docopy
concatstr_exit:
    jr      $ra
    
#.end main
    


