.data
	Mensagem: .asciiz "programo em mips sou profissa demais"
	
.text
	li $v0, 4
	la $a0, Mensagem
	syscall
	
