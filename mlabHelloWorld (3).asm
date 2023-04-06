# Program: ml00HelloWorld.asm
#  Author: **********
#    Date: mm/dd/yy
# Purpose: First Program
#
# Create assembler for the following C program:
# #include <iostream>
# #include <string>
# using namespace std;
#
#   void main()
#   {
#       cout << "Hello World!\n";
#   }
# OUTPUT:
#   Hello World!

.data
    .eqv    SYS_PRINT_WORD   1  #word, byte, character
    .eqv    SYS_PRINT_FLOAT  2  #float  
    .eqv    SYS_PRINT_DOUBLE 3  #double
    .eqv    SYS_PRINT_TEXT   4  #text (zero terminated)
    .eqv    SYS_EXIT        10  #terminate
    
hello: .asciiz "Hello , World!\n" 
            
.text
.globl  main
main: 	la 		$a0,hello
	li		$v0,SYS_PRINT_TEXT
	syscall
exit:	li		$v0, SYS_EXIT
	syscall

