#    File: mlModulusAND.asm
#  Author: ************
#    Date: mm/dd/yyyy
# Purpose: Practice using AND for modulus
#----------------------------------------------
# WRITE MIPS CODE FOR THE FOLLOWING C++ CODE:
#include <iostream>
#include <string>
#using namespace std;
# void main()
# {
#   //declare variables
#   int x = 0;
#
#   //loop 3 times thru 0..3
#   for(int i=0; i<=12; i++)
#   {
#       cout << x;
#       x++;
#       x = x & 0x03;  //modulus 4
#   }
#
# }//end main()
#
# OUTPUT: 0 1 2 3 0 1 2 3 0 1 2 3
#

.data
    .eqv    SYS_PRINT_WORD   1  #word, byte, character
    .eqv    SYS_PRINT_FLOAT    2    #float  
    .eqv    SYS_PRINT_DOUBLE   3    #double
    .eqv    SYS_PRINT_TEXT   4  #text (zero terminated)
    .eqv    SYS_INPUT_WORD   5  #input word
    .eqv    SYS_EXIT        10  #terminate

#   //declare variables
#   int x = 0;
    x:      .word       0
    endl:   .asciiz     "\n"
    blank:  .asciiz     " "
    
.text
.globl main
main:

#   //loop 3 times thru 0..3
#   for(int i=0; i<=12; i++)
#   {


#       cout << x;
loop:

#       x++;


#       x = x & 0x03;  //modulus 4
	div 
		
#   }


#---- terminate ---
exit:
    li  $v0, SYS_EXIT
    syscall
    
#.end main
    
