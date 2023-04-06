#  Example to reverse values in an array #  by using the stack.
# --------------------------------------------------------
#  Data Declarations
.data
array:  .word     1,  3,  5,  7,  9, 11, 13, 15, 17, 19
        .word    21, 23, 25, 27, 29, 31, 33, 35, 37, 39
        .word    41, 43, 45, 47, 49, 51, 53, 55, 57, 59
length: .word    30
   endl: 	.asciiz "\n"
# ---------------------------------------------------------
#  Text/code section
#  Basic approach:
#   - loop to push each element onto the stack 
#   - loop to pop each element off the stack 
#  Final result is all elements reversed.
.text
.globl  main 
main:
# -----
#  Loop to read items from array and push onto stack and place.
    la   $t0, array          # array starting address
    li   $t1, 0              # loop index, i=0
    lw   $t2, length         # length
pushLoop:   
    lw   $t4, ($t0)          # get array[i]
    subu $sp, $sp, 4 
    sw   $t4, ($sp)          # push array[i]
    add  $t1, $t1, 1         # i = i+1
    add  $t0, $t0, 4         # update array address
    blt  $t1, $t2, pushLoop  # if i<length, continue
    
    
# -----
#  Loop to pop items from stack and write into array.
    la   $t0, array          # array starting address
    li   $t1, 0              # loop index, i=0
    lw   $t2, length
popLoop:
    lw   $t4, ($sp)          # length (redundant line)
    addu $sp, $sp, 4         # pop array[i]
    sw   $t4, ($t0)          # set array[i]
    add  $t1, $t1, 1         # i = i+1
    add  $t0, $t0, 4         # update array address
    la  $a0,($t4)
    li  $v0, 1
    syscall
    la $a0, endl
    li $v0, 4
    syscall
    blt  $t1, $t2, popLoop
# -----
#  Done, terminate program.  # if i<length, continue
    li   $v0, 10             # call code for terminate
    syscall                  # system call
.end main
