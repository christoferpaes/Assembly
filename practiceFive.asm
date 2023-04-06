.data   
   
.eqv SYS_EXIT 10
iArray: .word   1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12
length: .word   12
iSum:   .word   0
fAve:   .float  0.0
nl:  .asciiz "\n"
.text
.globl  main 
main:
	la      $t0, iArray     # array starting addr
    lw      $t1, length     # array length
    li      $t2, 0          # set sum=0
sumLoop:        
    lw      $t3, ($t0)      # get iArray(n)
    add     $t2, $t2, $t3   # sum = sum+iArray(n)
    addu    $t0, $t0, 4     # update iArray addr
    sub     $t1, $t1, 1 
    bnez    $t1, sumLoop    
    sw      $t2, iSum       # save integer sum
    mtc1    $t2, $f6        # move to float reg
    cvt.s.w $f6, $f6        # cvt to float format
    lw  $t1, length 
    mtc1    $t1, $f8        # move to float reg
    cvt.s.w $f8, $f8        # cvt to float format
    div.s   $f10, $f6, $f8  # sum / length
    s.s $f10, fAve
#  Print fAve
    li  $v0, 2
    lwc1    $f12, fAve
    syscall
    li  $v0, 1
    lw    $a0, nl
    syscall
    li  $v0, 1
    lw    $a0, iSum
    syscall
# ----- 
#  Done, terminate program. 
    li  $v0, 10             # call code for terminate
    syscall                 # system call
#.end main