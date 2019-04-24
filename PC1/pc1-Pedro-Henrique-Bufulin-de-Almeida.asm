#autor: Pedro Henrique Bufulin de Almeida
#número de matrícula: 11711BCC028
#Quarto período


#########
# Este programa realiza a divisão entre dois inteiros e
# mostra o quociente e o resto resultados dessa divisão.
# Além disso, o programa também retrocede caso o denominador
# Seja igual à zero

.data
	####
	numerador:  .asciiz "Numerador: "
	denominador: .asciiz "Denominador: "
	quociente: .asciiz "Quociente: "
	resto: .asciiz "Resto: "
	newline: .asciiz "\n"
	error: .asciiz "insira um denominador diferente de zero\n"




.text 

erro:
	li, $v0, 4
	la, $a0, error
	syscall


.globl main
main:	
	#printa "Numerador:" e seu respectivo valor
	li $v0, 4
	la $a0, numerador
	syscall

	#guarda o valor do numerador
	li $v0, 5
	syscall 
	move $t0, $v0
	
	#adiciona uma numa linha
	li $v0, 4
	la $a0, newline
	syscall 
	
	
	#printa "Denominador: " e seu respectivo valor
	li $v0, 4
	la $a0, denominador
	syscall 
	
	
	#guarda o valor do denominador em t1
	li $v0, 5
	syscall 
	move $t1, $v0
	
	
	#verifica se divisor é zero, se for, imprime erro
	beqz $t1, erro	
	
	#realiza a divisão
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
	
	
	#printa o valor do resto:
	li $v0, 1
	add $a0, $zero, $s1
	syscall 
	
	

	   
