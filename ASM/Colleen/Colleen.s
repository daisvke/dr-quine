; This is a quine
extern printf
extern exit
global main

section .data
	str: db "; This is a quine%1$cextern printf%1$cextern exit%1$cglobal main%1$c%1$csection .data%1$c	str: db %2$c%3$s%2$c, 0x0%1$c%1$csection .text%1$cgetq:%1$c	lea rdi, [rel str]%1$c	mov rsi, 0xa%1$c	mov rdx, 0x22%1$c	lea rcx, [rel str]%1$c	xor rax, rax%1$c	call printf wrt ..plt%1$c	xor rax, rax%1$c	leave%1$c	call exit%1$c%1$cmain:%1$c	; Prologue%1$c	push rbp%1$c	mov rbp, rsp%1$c%1$c	call getq%1$c	ret", 0x0

section .text
getq:
	lea rdi, [rel str]
	mov rsi, 0xa
	mov rdx, 0x22
	lea rcx, [rel str]
	xor rax, rax
	call printf wrt ..plt
	xor rax, rax
	leave
	call exit

main:
	; Prologue
	push rbp
	mov rbp, rsp

	call getq
	ret