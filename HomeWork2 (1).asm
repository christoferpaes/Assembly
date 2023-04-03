#constants to use for MARS assembler

.data
    .eqv    SYS_PRINT_WORD   1  #word, byte, character
    .eqv    SYS_PRINT_FLOAT  2  #float  
    .eqv    SYS_PRINT_DOUBLE 3  #double
    .eqv    SYS_PRINT_TEXT   4  #text (zero terminated)
    .eqv    SYS_EXIT        10  #terminate
 
endl: 		.asciiz "\n" 
lblname: 	.asciiz "Name: \t\t"
lblage: 	.asciiz "Age: \t\t"
lblgpa: 	.asciiz "GPA: \t\t"
lblpi: 		.asciiz "PI: \t\t"
lblgender:	.asciiz "Gender: \t\t"
lblprogrammed:	.asciiz "Has programmed \t\t"
gender:		.asciiz  "M \t\t"				#PRINT_TEXT(la addr)
name: 		.asciiz "Christofer Paes \t\t"			#PRINT_TEXT(la addr)
age:		.word	 27					#PRINT_WORD(lw value)
gpa:		.double  3.00					#PRINT_FLOAT(lwcl)
pi:		.float 3.14159265				#PRINT_DOUBLE(ldcl)
programmed:	.word 	3




    
.text
.globl  main
main: 
#PRINT myName
	la $a0, lblname
	li $v0, SYS_PRINT_TEXT
	syscall
	la $a0, name
	li $v0, SYS_PRINT_TEXT
	syscall
	la $a0, endl
	li $v0, SYS_PRINT_TEXT
	syscall
	
##PRINT LBL AGE AND AGE 
	la $a0, lblage
	li $v0, SYS_PRINT_TEXT
	syscall
	lw $a0,age
	li $v0, SYS_PRINT_WORD
	syscall
	la $a0,endl
	li $v0,SYS_PRINT_TEXT
	syscall
	
##PRINT lbl gpa and gpa
	la $a0,lblgpa
	li $v0, SYS_PRINT_TEXT
	syscall
	ldc1 $f12,gpa
	li $v0, SYS_PRINT_DOUBLE
	syscall
	la $a0, endl
	li $v0, SYS_PRINT_TEXT
	syscall
#PRINT LBL FOR PI AND PI
	
	la $a0, lblpi
	li $v0, SYS_PRINT_TEXT
	syscall
	lwc1 $f12, pi
	li $v0, SYS_PRINT_FLOAT
	syscall	
	la $a0, endl
	li $v0, SYS_PRINT_TEXT
	syscall
	
	

##PRINT LBL GENDER AND GENDER
	la $a0, lblgender
	li $v0, SYS_PRINT_TEXT
	syscall
	la $a0, gender
	li $v0, SYS_PRINT_TEXT
	syscall
	la $a0, endl
	li $v0, SYS_PRINT_TEXT
	syscall
	
#PRINT HAS PROGRAMMED LBL AND number of years programming
	la $a0, lblprogrammed
	li $v0, SYS_PRINT_TEXT
	syscall
	lw $a0, programmed
	li $v0, SYS_PRINT_WORD
	syscall
	la $a0, endl
	li $v0,SYS_PRINT_TEXT
	syscall


##EXIT

exit:	li		$v0, SYS_EXIT
	syscall
