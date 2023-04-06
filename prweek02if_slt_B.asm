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
        bne $t0, $zero, truelt  # yes, branch to if-clause
falsge: la  $a0, ge
        j   print
truelt: la  $a0, lt
print:  li  $v0, 4
        syscall
        #-- exit
        li  $v0, 10
        syscall
        
        
