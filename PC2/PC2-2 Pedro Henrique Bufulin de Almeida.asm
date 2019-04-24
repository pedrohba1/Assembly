#autor: Pedro Henrique Bufulin de Almeida
#número de matrícula: 11711BCC028
#Quarto período

#######
#Esse programa cálcula as raízes de uma função de segundo grau


.data
dois: .double 2.0

str_a:  .asciiz "\nA = "
str_b:  .asciiz "\nB = "
str_c:  .asciiz "\nC = "
out_r1:      .asciiz "r1 = "
out_r2:       .asciiz "\nr2 = "
   	.text

main:
    	jal delta

    	li $v0, 10
    	syscall

delta:
    	
    	#lê A
	li	$v0, 4
	la	$a0, str_a
	syscall
	li	$v0, 5
	syscall
	move	$t0, $v0
	
	#Lê B
	li	$v0, 4
	la	$a0, str_b
	syscall
	li	$v0, 5
	syscall
	move	$t1, $v0
	
	#Lê C
	li	$v0, 4
	la	$a0, str_c
	syscall
	li	$v0, 5
	syscall
	move	$t2, $v0


	#à partir da linha abaixo começam os cálculos
	###################
	#	B ^2
	mult	$t1, $t1	
	mflo	$t3		#resultado guardado em $t3
	
	
	#4*A
	addi	$t7, $zero, 4
	mult	$t0, $t7
	mflo	$t4
	
	#então (4*A)*C
	mult	$t4, $t2
	mflo	$t5
	
	#B^2 - 4*A*C
	sub	$t6, $t3, $t5
	
	#PARA TIRAR A PRIMEIRA RAIZ (POSITIVA):
	#antes de tudo, converter o valor da raiz para float.
	mtc1.d $t6, $f12
	cvt.d.w $f12, $f12
	sqrt.d $f2, $f12 #raiz guardada em $f2
	
	# converter b para float
	mtc1.d $t1 $f12
	cvt.d.w $f4, $f12 # B guardado em $f4
	
	#converter a para float
	mtc1.d $t0, $f12
	cvt.d.w $f6, $f12 #A guardado em $f6
	
	#colocar o valor do numerador num registrador
	add.d $f14, $f4, $f2 #numerador guardado em $f14
	#colocar o valor do denominador num registrador
	l.d $f16, dois # coloca dois em um registrador
	mul.d $f18, $f16, $f6 #guarda o denominador em $f18
	
	div.d $f20, $f14,$f18
	
	#printa o valor da primeira raiz:
	li	$v0, 4
	la	$a0, out_r1
	syscall
	li $v0, 3
,	add.d $f12, $f20,$f0
	syscall 
	
	
		
	#PARA TIRAR A SEGUNDA RAIZ (POSITIVA):
	#raiz guardada em $f2
	# B guardado em $f4
	 #A guardado em $f6
	
	#colocar o valor do numerador num registrador
	sub.d $f14, $f4, $f2 #numerador guardado em $f14
	#colocar o valor do denominador num registrador
	l.d $f16, dois # coloca dois em um registrador
	mul.d $f18, $f16, $f6 #guarda o denominador em $f18
	
	div.d $f20, $f14,$f18
	
	#printa o valor da segunda  raiz:
	li	$v0, 4
	la	$a0, out_r2
	syscall
	li $v0, 3
,	add.d $f12, $f20,$f0
	syscall 
	
	
	
	
	