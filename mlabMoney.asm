#    File: mlMoney.asm
#  Author: ************
#    Date: mm/dd/yyyy
# Purpose: Practice floating point; Break down cash to bills and coins
#----------------------------------------------
# WRITE MIPS CODE FOR THE FOLLOWING C++ CODE:
#
#include <iostream>
#include <string>
#include <math.h>
#using namespace std;
#    void main()
#    {
#        float cash
#    int remainder %, twenty, ten, five, one, quarter, dime, nickel, penny;
#        cout << "Enter amount of cash: ";  //enter 56.68
#        cin >> cash;
#    remainder = (int)(100.0f * cash) //use integers from now on
#        twenty = remainder / 2000;   //$20
#        remainder = remainder % 2000;
#        ten = remainder / 1000;          //$10
#        remainder = remainder %, 1000;
#        five = remainder / 500;          //$5
#        remainder = remainder % 500;
#        one = remainder / 100;           //$1
#        remainder = remainder % 100;
#        quarter = remainder / 25;        //$0.25
#        remainder = remainder % 25;
#        dime = remainder % / 10;         //$0.10
#        remainder = remainder % 10;
#        nickel = remainder / 5;          //$0.05
#        penny = remainder % 5;           //$0.01
#        cout
#            << "\nTwenty  \t" << twenty
#            << "\nTen     \t" << ten
#            << "\nFive    \t" << five
#            << "\nOne     \t" << one
#            << "\nQuarter \t" << quarter
#            << "\nDime    \t" << dime
#            << "\nNickel  \t" << nickel
#            << "\nPenny   \t" << penny << endl;
#    }//end main()

# SAMPLE OUTPUT:
#   Enter amount of cash (56.68): 56.68
#
#   Twenty      2
#   Ten         1
#   Five        1
#   One         1
#   Quarter     2
#   Dime        1
#   Nickel      1
#   Penny       3
    
.data
    .eqv    SYS_PRINT_WORD   1  #word, byte, character
    .eqv    SYS_PRINT_FLOAT  2  #float  
    .eqv    SYS_PRINT_DOUBLE 3  #double
    .eqv    SYS_PRINT_TEXT   4  #text (zero terminated)
    .eqv    SYS_INPUT_WORD   5  #input word
    .eqv    SYS_INPUT_FLOAT  6  #input float
    .eqv    SYS_EXIT        10  #terminate

#   //declare variables
    cash:       .word   0
    remainder:  .word   0
    twenty:     .word   2000    #20.0
    ten:        .word   1000    #10.0
    five:       .word   500     #5.0
    one:        .word   100     #1.0
    quarter:    .word   25      #0.25
    dime:       .word   10      #0.10
    nickel:     .word   5       #0.05
    penny:      .word   1       #0.01
    
    hundred:    .float  100.0

    endl:       .asciiz "\n"
    tx_prompt:  .asciiz "Enter amount of cash (56.68): "
    tx_twenty:  .asciiz "\nTwenty  \t"
    tx_ten:     .asciiz "\nTen     \t"
    tx_five:    .asciiz "\nFive    \t"
    tx_one:     .asciiz "\nOne     \t"
    tx_quarter: .asciiz "\nQuarter \t"
    tx_dime:    .asciiz "\nDime    \t"
    tx_nickel:  .asciiz "\nNickel  \t"
    tx_penny:   .asciiz "\nPenny   \t"
    
.text
.globl main
main:
    la    $a0, tx_prompt          # load address of prompt for syscall
    li    $v0, SYS_PRINT_TEXT     # specify Print String service
    syscall                       # print the prompt string
    li    $v0, SYS_INPUT_FLOAT    # specify Read Integer service
    syscall                       # Read the number. After this instruction, the number read is in $f0.
    s.s   $f0, cash

# TODO: Finish computing remainder,twenty,ten,five,one,quarter,dime,nickel,penny
    
#-----------------------------------------------------------------------    
#---- print results
    la  $a0, tx_twenty
    li  $v0, SYS_PRINT_TEXT
    syscall
    lw  $a0, twenty
    li  $v0, SYS_PRINT_WORD
    syscall
    
# TODO: Finish printing ten,five,one,quarter,dime,nickel,penny

#---- terminate ---
exit:
    li  $v0, SYS_EXIT
    syscall
        
#.end main
    
