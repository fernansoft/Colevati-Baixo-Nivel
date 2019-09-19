.data
	msg1:.asciiz"\nDigite um número:"
	msg2:.asciiz"\n"
.text
main:
	li $v0, 4
	la $a0, msg1
	syscall
	
	li $v0, 5
	syscall
	add $t0, $v0, $zero
	
	li $t1, 0
	
	dowhile:
	mul $t2, $t0, $t1
	
	#show($t2)
	li $v0, 1
	add $a0, $t2, $zero
	syscall
	
	li $v0, 4
	la $a0, msg2
	syscall
	
	add $t1, $t1, 1
	
	ble $t1, 10, dowhile