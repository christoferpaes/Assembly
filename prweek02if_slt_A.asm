# prweek02if_slt.asm
# Kurt Marley
#
#   int x = 5;
#   int y = 6;
#   if( x < y )
#   cout << "x lt y\n";
#   else
#   cout << "x ge y\n";
#

.data
x:      .word       5
y:      .word       6
ge:     .asciiz "x ge y\n"
lt:     .asciiz "x lt y\n"

.text
main:
        lw  $s0, x
        lw  $s1, y
        slt $t0, $s0, $s1       # x < y?  t0=1(true),0(false)
        beq $t0, $zero, falsge  # no, branch to else-clause
truelt: la  $a0, lt
        j   print
falsge: la  $a0, ge
print:  li  $v0, 4
        syscall
        #-- exit
        li  $v0, 10
        syscall
        
        
