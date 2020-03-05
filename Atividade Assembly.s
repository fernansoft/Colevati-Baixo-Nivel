.data
	msg1: .asciiz"\nInsira o ano da primeira data: "
	msg2: .asciiz"\nInsira o ano da segunda data! \n(Insira apenas anos com intervalos menores que 1000!): "
	msg3: .asciiz"\nEis a quantidade de anos bissextos (incluindo os extremos) entre os anos inseridos: "
.text
main:
#$t0 sera o contador de anos bissextos
	add $t0, $zero, $zero

enquanto:
#pede o primeiro ano 
	li $v0, 4
	la $a0, msg1
	syscall
#recebe o primeiro ano
	li $v0, 5
	syscall
#$t1 recebe o input do primeiro ano
	add $t1, $v0, $zero

#pede o segundo ano
	li $v0, 4
	la $a0, msg2
	syscall
#recebe o segundo ano
	li $v0, 5
	syscall
#$t2 recebe o input do segundo ano
	add $t2, $v0, $zero
	
#descobrir qual o maior entre os anos inseridos
	bgt $t1, $t2, set1maior
	j set2maior
	
set1maior:
#$t3 recebe o menor
#$t4 recebe o maior
	add $t3, $t2, $zero
	add $t4, $t1, $zero
	j verificarintervalo

set2maior:
#$t3 recebe o menor
#$t4 recebe o maior
	add $t3, $t1, $zero
	add $t4, $t2, $zero

verificarintervalo:
#verifica se o intervalo entre os anos e maior que 1000
	sub $t1, $t4, $t3
	bge $t1, 1000, enquanto

verifanosbissextos:
#verifica se e divisivel por 400, 100 e por 4
	rem $t2, $t3, 400
	beq $t2, $zero, incrementarbissexto
	rem $t2, $t3, 100
	beq $t2, $zero, proximoano
	rem $t2, $t3, 4
	beq $t2, $zero, incrementarbissexto
	j proximoano

incrementarbissexto:
#incrementa mais um no contador de bissextos ($t0)
	add $t0, $t0, 1

proximoano:
	add $t3, $t3, 1
	ble $t3, $t4, verifanosbissextos
	li $v0, 4
	la $a0, msg3
	syscall
	li $v0, 1
	add $a0, $t0, $zero
	syscalls
