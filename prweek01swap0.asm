# prweek01swap0.asm
# Kurt Marley
#
#   void swap( int v[], int k) {
#       int temp;
#       temp = v[k];
#       v[k] = v[k+1];
#       v[k+1] = temp;
#   }
.data
v:      .word       1,2,3,4,5,6,7,8,9,0
k:      .word       4

.text
main:
swap:
        lw  $s6, k
        la  $s7, v
        sll $t2, $s6, 2     #times 4
        add $t2, $s7, $t2
        lw  $s0, 0($t2)
        lw  $s1, 4($t2)
        sw  $s0, 4($t2)
        sw  $s1, 0($t2)
        
        li  $v0, 10
        syscall
        
        