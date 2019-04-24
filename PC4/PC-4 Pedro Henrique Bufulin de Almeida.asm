	
#autor: Pedro Henrique Bufulin de Almeida
#número de matrícula: 11711BCC028
#Quarto período


########
#esse programa calcula os dígitos verificadores do cpf


.data
	cpf: .space  44 #36 bytes, pois são 9 inteiros e cada um ocupa 4 bytes
	numerox:  .asciiz "\nNumero "
	quebralinha: .asciiz "\n"
	mensagem: .asciiz "\n Seu cpf eh "
	traco: .asciiz "-"

.text
	main:	
	#construindo o primeiro valor para o loop
	addi $t0,$zero,1
	#construindo o primeiro índice do array
	addi $t1,$zero,0


	while:
		bgt $t0 ,9 ,exit
	
	
	#escrever "número x: " na tela (pra pode facilitar entrada de dados)
	#isso ajuda a organizar os valores
		li $v0, 4
		la $a0, numerox
		syscall
		li $v0, 1
		move $a0, $t0
		syscall
		li $v0, 4
		la $a0, quebralinha
		syscall
	
	#recebendo o número do teclado e guardando ele no registrador s0
	
		li $v0, 5
		syscall 	
		move $s0,$v0		
	
	#salvando cada número do cpf	
		sw $s0, cpf($t1)
		
		#incrementando o contador do array
		addi $t1, $t1, 4
		
		
		#incrementa uma instrução no loop
		addi $t0,$t0, 1
		#instrução para repetir se não fizer a condição de saída
		j while
	exit:
	
	jal calculadecimo
	jal calcula_decimo_primeiro

		
	#printando o array:
	#zerar o contador e o array antes:
	addi $t0,$zero,1
	addi $t1,$zero,0
	
	#escreve "seu cpf eh "
	li $v0, 4
	la $a0, mensagem
	syscall
	#escreve os números até o nono
	while2:
		#condição de saída (>9)
		bgt $t0,9,exit2
		
		#guarda o valor em t2
		lw $t2,cpf($t1)
		
		#incrementa o índice do array
		addi $t1, $t1, 4
		
		#printa o valor
		li $v0, 1
		move $a0, $t2
		syscall
		
		#incrementa uma instrução no loop
		addi $t0,$t0, 1
		j while2
	exit2:
	
	#printa um "-"
		li $v0, 4
		la $a0, traco
		syscall
	#escreve os dois ultimos depois do traço
	
		#guarda o valor em t2
		lw $t2,cpf($t1)
		
		#incrementa o índice do array
		addi $t1, $t1, 4
		
		#printa o valor
		li $v0, 1
		move $a0, $t2
		syscall
		
		#guarda o valor em t2
		lw $t2,cpf($t1)
		
		
		#printa o valor
		li $v0, 1
		move $a0, $t2
		syscall	


		
	
	
	#FINALIZA O PROGRAMA
	li $v0,10
	syscall
	
	
	
	
	calculadecimo:
		#vou usar o contador para multiplicar o array
		#registradores usandos para armazenar os valores
		#contador
		addi $t0,$zero,1
		#indice do array
		addi $t4,$zero,0
		#valores de 10 a 2
		addi $t1,$zero,10
		# t5 guarda a soma das multiplicações pelos núemros do cpf
		addi $t5, $zero,0
		#guarda as multiplicações parciaais 
		addi $t3,$zero,0
		while3:
			bgt $t0, 9,exit3
			

			#guarda o valor do array em t2
			lw $t2, cpf($t4)
			#multiplica e guarda em t3
			mul $t3, $t2, $t1
			
			#guarda os valores das multiplicaçoes
			add $t5,$t5,$t3
			
			#decrementa o valor que vai multiplicar
			subi $t1,$t1,1
			#incrementa o índice
			addi $t4,$t4,4
			#incrementa o contador
			addi $t0,$t0, 1
			j while3
		exit3:

		
		#agora basta pegar o valor em t5 multiplicar por 10 e dividir por 11
		mul $t5, $t5, 10
		div $t5, $t5, 11
		#e colcoar o valor do décimo número sendo o resto dessa divisão por 11
		addi $t6,$zero,0
		mfhi $t6
	 	
	 	#explicação dessa condição no final do código
	 	beq $t6, 10,restozero
	 	
		
		sw $t6, cpf($t4)
		
	jr $ra
		
			
	
		
		
	#reutilizei o anterior e mudei alguns comentários e alguns índices:
		
	calcula_decimo_primeiro:
	#vou usar o contador para multiplicar o array
		#registradores usandos para armazenar os valores
		#contador
		addi $t0,$zero,1
		#indice do array
		addi $t4,$zero,0
		#valores de 11 a 2
		addi $t1,$zero,11
		# t5 guarda a soma das multiplicações pelos núemros do cpf
		addi $t5, $zero,0
		#guarda as multiplicações parciaais 
		addi $t3,$zero,0
		#t2 guarda o valor do array naquele instante do loop
		addi $t2,$zero,0
		while4:
			bgt $t0, 10,exit3
			

			#guarda o valor do array em t2
			lw $t2, cpf($t4)
			#multiplica e guarda em t3
			mul $t3, $t2, $t1
			
			#guarda os valores das multiplicaçoes
			add $t5,$t5,$t3
			
			#decrementa o valor que vai multiplicar
			subi $t1,$t1,1
			#incrementa o índice
			addi $t4,$t4,4
			#incrementa o contador
			addi $t0,$t0, 1
			j while4
		exit4:
		

		#agora basta pegar o valor em t5 multiplicar por 10 e dividir por 11
		mul $t5, $t5, 10
		div $t5, $t5, 11
		#e colcoar o valor do décimo número sendo o resto dessa divisão por 11
		addi $t6,$zero,0
		mfhi $t6
		
		#explicação dessa condição no final do código
		beq $t6, 10,restozero
		#armazena o valor no array
		sw $t6, cpf($t4)
	jr $ra
	
	
	
	#se o resto da divisão do numero por 10 der 10 tem que setar pra 0
	restozero:
	addi $t6,$zero,0
	jr $ra



