.data



.text
	addi $t0, $zero, 20000
	add $t1, $zero, 10
	#usando mult para multiplicação é possível multiplicar valores maiores que 16 bits
	
	mult $t0, $t1
	#os valores são guardados em lo e hi
	
	mflo $s0
	#mostrar o resultado:
	
	li $v0, 1
	add $a0, $zero, $s0
	syscall