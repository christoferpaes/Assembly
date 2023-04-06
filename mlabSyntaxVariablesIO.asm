# Program: mlSyntaxVariablesIO.asm
#  Author: **********
#    Date: mm/dd/yy
# Purpose: Practice printing data types
#-----------------------------------------------------------------
# Create assembler for the following C program:
# #include <iostream>
# #include <string>
# using namespace std;
#
#   void main()
#   {
#       string myname = "Your Name";
#       int age = 23;
#       float gpa = 3.5;
#       double pi = 3.1415926535897;
#       char gender = 'F';
#       bool hasProgrammed = 1; //true
#
#       cout << "Name:\t\t" << myname << endl;
#       cout << "Age:\t\t" << age << endl;
#       cout << "GPA:\t\t" << gpa << endl;
#       cout << "PI:\t\t" << pi << endl;
#       cout << "Gender:\t\t" << gender << endl;
#       cout << "Has Programmed:\t" << hasProgrammed << endl;
#   }
# OUTPUT:
#   Name:       My Name
#   Age:        23
#   GPA:        3.5
#   PI:     3.1415926535897
#   Gender:     F
#   Has Programmed: 1

.data
    .eqv    SYS_PRINT_WORD   1  #word, byte, character
    .eqv    SYS_PRINT_FLOAT  2  #float  
    .eqv    SYS_PRINT_DOUBLE 3  #double
    .eqv    SYS_PRINT_TEXT   4  #text (zero terminated)
    .eqv    SYS_EXIT    10  #terminate

.text
.globl  main
main:
sb 	$zero, ($s4)


p1chk3:
	li	$t1, 3
	beq 	$s5, $t1 plddd ##if(x==3) 
	
p1chk4:
	li 	$t1, 4
	beq 	$s5, $t1 plddd ##if(x==4) go plddd
pleee:
	la	$a0, result
	la	$a1, tx_eee
	jal	concastr
	j	plprt
plddd:
	la $a0, result
	la $1,tx_ddd
	jal concastr
plprt: 
	la	$a0,probl_label
	li	$v0,SYS_PRINT_TEXT
	syscall
	la $a0,endl
	li $v0,SYS_PRINT_TEXT
	syscall
	
	
#------------------------
# terminate program.
    li      $v0, SYS_EXIT   # call code for terminate
    syscall                 # system call
#.end main
