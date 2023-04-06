# File: week01play.asm
# Kurt Marley
#   f = ( g + h ) - ( i + j )
.data
        .eqv        SYS_PRINT_WORD  1
        .eqv        SYS_PRINT_TEXT  4
        .eqv        SYS_EXIT        10
f:      .word       5
g:      .word       10
h:      .word       13
i:      .word       1
j:      .word       2
endl:       .asciiz "\n"

.text
.globl main
main:
        lw  $t0, g
        lw  $t1, h
        lw  $t2, i
        lw  $t3, j
        add $s0, $t0, $t1 # g + h
        add $s1, $t2, $t3 # i + j
        sub $s2, $s0, $s1 # (g+h) - (i+j)
        sw  $s2, f        # save in f
        lw  $a0, f
        li  $v0, SYS_PRINT_WORD
        syscall
        la  $a0, endl
        li  $v0, SYS_PRINT_TEXT
        syscall
        # -- exit
        li  $v0, SYS_EXIT
        syscall
        