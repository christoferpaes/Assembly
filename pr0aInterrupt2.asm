
##################################
# Example of exception handling  #
# and memory-mapped I/O          #
##################################

##################################
# Must enable memory-mapped I/O! #
##################################

#######################
# Program Entry Point #
#######################
	.data
title:	.asciiz "==pr0aInterrupt2.asm==\n\n"
        .text
        .globl main
main:
	la    $a0,title
	li    $v0,4
	syscall
        li    $a0, 0xFFFF0000 # Receiver control
        lw    $t0, 0($a0)
        ori   $t0, 0x02       # set bit 1 to enable input interrupts
                              # such a-synchronous I/O (handling of keyboard input in this case) 
                              # this is much more efficient than the "polling" we use for output
                              # In particular, it does not "block" the main program in case there is no input
        sw     $t0, 0($a0)    # update Receiver control

        mfc0   $t0, $12       # load coprocessor0 Status register
        ori    $t0, 0x01      # set interrupt enable bit 
        mtc0   $t0, $12       # move into Status register

        li     $t0, 100
        mtc0   $t0, $11       # coprocessor0 Compare register
                              # value is compared against timer
                              # interrupt when Compare ($11) and Count ($9) match
        mtc0   $zero, $9      # Count = 0
                              # Count (timer) will be incremented every 10ms
                              # hence, a timeout interrupt will occur after
                              # 100 x 10ms = 1s
                              # This should catch an infinite loop ...
                              # ... 1s = 1ns x 10^9

        # divide by zero
        div    $t0, $t0, $zero

        # arithmetic overflow
        li     $t1, 0x7FFFFFFF
        addi   $t1, $t1, 1

        # non-existing memory address -- address error store 
        sw     $t2, 124($zero)

        # non-aligned address -- address error load
        lw     $t2, 125($zero)

        # illegal instruction 
        #.word 0xDEADBEEF  # hexspeak, "magic" value on some platforms :)

# infinite loop

forever:      
        nop
        nop
        j forever

