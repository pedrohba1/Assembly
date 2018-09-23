.data

.text
	add $s0, $zero, 3
	sll $t0, $s0, 2 #joga os bits pra esquerda duas vezes, mesma coisa que  

	li $v0, 1
	add $a0, $zero, $t0
	syscall 