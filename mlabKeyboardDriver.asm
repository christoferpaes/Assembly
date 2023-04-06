# Program: mlKeyboardDriver.asm
#  Author: Christofer Paes
#    Date: 12/08/21
# Purpose: Practice using XOR, random
#-------------------------------------------------------------------
# The left column is random keys depressed on a keyboard.
# A zero means the key is not pressed, a one means the key is pressed.
# You need to determine the CHANGES from one left-hand row to the next.
#    PREVIOUS ==>  0         1            1               0
#         NEW ==>  0         1            0               1
#     MEANING ==>  No      Key Still     Key            New Key
#                 Change    Pressed     Released        Depressed
# If a New Key is depressed, that bit should apprear on the Right.
#-------------------------------------------------------------------
# SAMPLE OUTPUT:
# 00000000000000000000000001101011  00000000000000000000000001101011
# 00000000000000000000000000100111  00000000000000000000000000000100
# 00000000000000000000000000110001  00000000000000000000000000010000
# 00000000000000000000000011011111  00000000000000000000000011001110
# 00000000000000000000000011001001  00000000000000000000000000000000
# 00000000000000000000000010101100  00000000000000000000000000100100
# 00000000000000000000000010000111  00000000000000000000000000000011
# 00000000000000000000000010001001  00000000000000000000000000001000
# 00000000000000000000000011001011  00000000000000000000000001000010
# 00000000000000000000000010110110  00000000000000000000000000110100
# 00000000000000000000000011100111  00000000000000000000000001000001
# 00000000000000000000000011110110  00000000000000000000000000010000
# 00000000000000000000000001001000  00000000000000000000000000001000
# 00000000000000000000000001101011  00000000000000000000000000100011
# 00000000000000000000000000011010  00000000000000000000000000010000
# 00000000000000000000000011001101  00000000000000000000000011000101

.data
    .eqv    SYS_PRINT_WORD   1  #word, byte, character
    .eqv    SYS_PRINT_FLOAT  2  #float  
    .eqv    SYS_PRINT_DOUBLE 3  #double
    .eqv    SYS_PRINT_TEXT   4  #text (zero terminated)
    .eqv    SYS_EXIT        10  #terminate
    .eqv    SYS_PRINT_CHAR  11  #print char
    .eqv    SYS_READ_CHAR   12  #read char
    .eqv    SYS_TIME        30  #system time to a1,a0
    .eqv    SYS_SLEEP       32  #delay a0 msec
    .eqv    SYS_PRINT_BIN   35  #print binary
    .eqv    SYS_SET_SEED    40  #set random seed
    .eqv    SYS_RAND_INT    42  #get random int
    
wait:       .word       1000     #1 second
max:        .word       16      #max loops
tab:        .asciiz "\t"
endl:       .asciiz "\n"
last:       .word       0       #last random    

.text
.globl  main
main:
   
    
    # initialize main loop: s7=max, s6=0 (loop counter) 
     lw $s7, max
     li $s6,0
    # main loop 
loop:

 # get system time
     addiu $2, $0 ,0x000000000000001e
          #get system time
    syscall
    # use system time lsb for seed a1, a0=0 for id
    move   $a1, $a0            #time lsw will be seed ##a1 register is loaded with the lower order bits 
    li     $a0, 0              #generator id 0 and now a0 has been zeroed out
    li     $v0, SYS_SET_SEED
    syscall
    
    # pause 'wait' msec using SYS_SLEEP
  #-- could not get the sys_sleep to work on my computer it would crash the program
    lw $a0, wait
    li $v0, 32
    syscall
  
    # get random integer in a0
 ## getting random number into a
    addi $v0, $zero, 42
    add $a0, $zero, $zero
    addi $a1, $zero, 4
    syscall 
   
    
  
     
    # load 'last' into s0
   lw $s0, last

    # zero top 24 bits of a0 random
    andi  $a0, $a0,100
   
    # save a0 new random lsb into 'last' and move a0 into s1
    sw $a0, last
    move $s1, $a0
    # print a0 random lsb as binary
    la $a0, 0($s1)
    li $v0, 35
    syscall
    # print a tab
    la $a0, tab
    li $v0, 4
    syscall
    # XOR s0 'last' with s1 new random lsb, save in a register
    xor $s3, $s1, $s0
    # AND the XOR results with s1 new random lsb, print as binary
    and $s4, $s3, $s1
    la $a0, 0($s4)
    li $v0, 35
    syscall
    # print a new line
    la $a0, endl
    li $v0, 4
    syscall
    addi $s6, $s6, 1 ##increment 
    # end loop: s6++, if s6==s7 then branch to exit:
    beq $s6, $s7, exit
    
    #           else branch to loop:
    jal loop

#------------------------
# terminate program.
exit:
    li  $v0, SYS_EXIT   # call code for terminate
    syscall             # system call
#.end main


