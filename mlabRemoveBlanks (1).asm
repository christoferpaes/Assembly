#    File: mlRemoveBlanks
#  Author: Christofer Patrick Paes 
#    Date: 10/07/2021
# Purpose: Practice rotate & AND to remove spare blanks
#--------------------------------------------------------------
# Write a MIPS assembler program to remove the extra blanks from
# a string: 
# INPUT: "Two  bee ore  knot too  Bea that"
# PATTERN:
#00011000 =  24
#00110001 = 
#10001100 = 140 
#00011000 = 48 
#00100011 = 35
#01000110 = 70 -- rotate
#00010000 = 16
#00110001 = 49 -- rotate
# ROTATE: 
# AND:    00010000000010000000001000000000
# RESULT:"Two bee ore knot too Bea that   "

.data
    .eqv    SYS_PRINT_WORD   1  #word, byte, character
    .eqv    SYS_PRINT_FLOAT  2  #float  
    .eqv    SYS_PRINT_DOUBLE 3  #double
    .eqv    SYS_PRINT_TEXT   4  #text (zero terminated)
    .eqv    SYS_INPUT_WORD   5  #input word
    .eqv    SYS_INPUT_FLOAT  6      #input float
    .eqv    SYS_PRINT_BIN   35  #print binary
    .eqv    SYS_EXIT        10  #terminate

#   declare variables
    .eqv    BLANK       32
                        #12345678901234567890123456789012
    text:       .ascii  "Two  bee ore  knot too  Bea that"
			#
    end_text:   .asciiz "\n"
    result:     .ascii  "                                "
    end_result: .asciiz "\n"
    blank:      .byte   ' '
    endl:       .asciiz "\n"
    endl2:      .asciiz "\n\n"
	ix: 	.word 32
	test:  .ascii "test one " 
	aest:  .ascii "test two " 
	test2: .ascii "test on 2"
	test3: .ascii "test on 3"
    
.text

.globl main
main:

# Print starting text
    la  $a0, text
    li  $v0, SYS_PRINT_TEXT
    lw  $t8, ix 
    lb $t7,blank
    move $t0, $zero
    syscall

# ---------------------------------------------------------------
# Create the bit pattern with a 1 where each blanks exists
# ----------------------------------------------------------------
    # s7 = ending address for loop
    # s1 = text address
    # s0 = the bit pattern
loop1: 
	
	
 	add     $t2,$a0,$t1  #$t2 =  &array[index]
 	beq     $t2,$t8, blan1
 	la 	$a0, test2
 	li 	$v0, SYS_PRINT_TEXT
 	syscall
 		la $a0, endl
	li $v0, SYS_PRINT_TEXT
	syscall
 	sb	$t2,  0($t2)
 	sb	$t2,result
 	la 	$a0, test3
 	li 	$v0, SYS_PRINT_TEXT
 	syscall
 	
 	addi    $t0, $t0, 1 ## this is i = i +1 ;
 	blt 	$t0, $t8, loop1
 	bgt     $t0, $t8, exit
 	
 	 
  	 # shift pattern left
 	 # get 'text' byte
  	 # compare with BLANK
 	 # set s0 bit0 for BLANK, else skip to noBlank, not setting bit0
blan1:

	la $a0 , test
	li $v0, SYS_PRINT_TEXT
	syscall
	
	sb	$t2,result
	la $a0 , aest
	li $v0, SYS_PRINT_TEXT
	syscall
	la $a0, endl
	li $v0, SYS_PRINT_TEXT
	syscall
	la $a0, result
	li $v0, SYS_PRINT_TEXT
	syscall
	blt $t0, $s0, loop1
	bgt $t0, $s0, exit
	
noBlank:
    # move to next character
    # loop1 if not done (s1 != s7)
    # print s0 pattern
# ----------------------------------------------------------------
# Duplicate bit pattern, Rotate left, AND the two patterns
#   should be where extra blanks exist
# ----------------------------------------------------------------
    # duplicate s0 pattern into s2
    # rotate s2 left one bit
    # print s2 rotate
    # AND the two patterns: s2 & s0
    # print the AND pattern
# ----------------------------------------------------------------
# Copy 'text' into 'result' for each zero bit in s3 pattern
# ----------------------------------------------------------------
    # ending s7 'end_text' address
    # source address 'text' in s0
    # destination address 'result' in s1
loop2:
    # rotate high bit to bit0
    # test bit0
    # skip if bit0 is 1
    # get character at (s0)
    # save character in (s1)
    # advance s1 'result' address
skip:
    # advance s0 'text' address
    # loop2 if not done (s0 != s7)
    # print 'result'
    
#---- terminate ---
exit:
la $a0, result
 	li  $v0, SYS_PRINT_TEXT
    li  $v0, SYS_EXIT
    syscall
        
#.end main
