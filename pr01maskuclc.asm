# upcase lowercase: pr01maskuclc.asm
.data
char:	.byte	'Q',
endl:	.byte	'\n'

.text
main:
	lb	$t0, char
	move	$a0, $t0
	li	$v0, 11	#print char
	syscall

	#make lowercase
	
	#make uppercase again
	
	li	$v0, 10 #exit
	syscall
