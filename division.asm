.data
	dividendo: .word 7
	divisor: .word 3
	numerador:  .asciiz "Numerador: "
	denominador: .asciiz "Denominador: "
	quociente: .asciiz "Quociente: "
	resto: .asciiz "Resto: "
	newline: .asciiz "\n"
.text 
	
	#printa "Numerador:" e seu respectivo valor
	li $v0, 4
	la $a0, numerador
	syscall
	li $v0, 1
	lw $a0, dividendo
	syscall
	
	#adiciona uma numa linha
	li $v0, 4
	la $a0, newline
	syscall 
	
	
	#printa "Denominador: " e seu respectivo valor
	li $v0, 4
	la $a0, denominador
	syscall 
	li $v0, 1
	lw $a0, divisor
	syscall
	
	#carrega o valores do divisor e do dividendo nos registradores t0 e t1
	lw $t0, dividendo
	lw $t1,divisor
	
	#realiza a divisão que guarda os valores nos registradores hi e lo por padrão
	div $t0, $t1
	
	
	#adiciona uma numa linha
	li $v0, 4
	la $a0, newline
	syscall 
	
	
	
	#printa "Quociente: "
	li $v0, 4	 
	la $a0, quociente 
	syscall	
	
	#carrega o lo para s0 (o quociente fica em lo)
	mflo $s0 
	
	#coloca o valor de s0 em a0 por meio de uma adição
	li $v0, 1
	add $a0, $zero, $s0
	syscall 
	
	#adiciona uma numa linha
	li $v0, 4
	la $a0, newline
	syscall 

	#printa "Resto: "
	li $v0, 4	 
	la $a0, resto
	syscall	
	
	#carrega o hi para s1 (o resto fica em hi)
	mfhi $s1
	
	li $v0, 1
	add $a0, $zero, $s1
	syscall 
	
	
	  
	    
	
	
	

