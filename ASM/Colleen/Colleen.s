; This is a quine

section .rodata
	fmt: db "; This is a quine%1$c%1$csection .rodata%1$c	fmt: db %2$c%3$s%2$c, 0x0%1$c%1$csection .text%1$cextern printf%1$cglobal main%1$c%1$cmain:%1$c	; The output will be the same as the code%1$c	lea rdi, [rel fmt]%1$c	mov esi, 0xa%1$c	mov edx, 0x22%1$c	lea rcx, [rel fmt]%1$c	xor al, al%1$c	call printf%1$c%1$c	mov eax, 0x3c%1$c	xor edi, edi%1$c	syscall", 0x0

section .text
extern printf
global main

main:
	; The output will be the same as the code
	lea rdi, [rel fmt]
	mov esi, 0xa
	mov edx, 0x22
	lea rcx, [rel fmt]
	xor al, al
	call printf

	mov eax, 0x3c
	xor edi, edi
	syscall