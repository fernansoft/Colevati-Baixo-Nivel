.data
	msg1:.asciiz"\n\n\tDigite um numero inteiro: "
	msg2:.asciiz"\n"
	msg3:.asciiz"\n\tERRO: Insira apenas valores entre 0 e 10"
.text

main:
	
	enquanto:
	la $a0, msg1
	li $v0, 4
	syscall
	
	li $v0, 5
	syscall
	add $t1, $v0, $zero
	
	bge $t1, 0, maior
	
	li $v0, 4
	la $a0, msg3
			
	j enquanto
	
	maior:
	ble $t1, 10, fatorial
	
	fatorial:
	li $t1, 5
	add $t2, $t1, $zero
	sub $t2, $t2, 1
	mul $t1, $t2, $t1
	beq $t1, 1, resultado
	j fatorial
	
	resultado:
	li $v0, 1
	add $a0, $t1, $zero
	syscall