.data
	msg1:.asciiz"\nDigite um número: "
	msg2:.asciiz"\nPar: "
	msg3:.asciiz"\nImpar: "
.text
main:
	#mostrar(msg1)
	li $v0, 4					#v0 <- 4
	la $a0, msg1				#$a0 <- msg1
	Syscall	
		
								#ler($t0)	
	li $v0, 5					#$v0 <- 5
	syscall	
	add $t0, $v0, $zero 		#$t0 <- $v0 + 4
		
	rem $t1, $t0, 2 			#$t1 <- $t0 % 2
	
	beq $t1, 0, se
	j senao
	
	se:
	li $v0, 4
	li $a0, msg2
	syscall
	
	senao:
	li $v0, 4
	li $a0, msg3
	syscall
	
	fimse: