; This is a quine

section .text
extern printf
global main

get_quine:
	lea rdi, [rel fmt]
	mov rsi, 0xa
	mov rdx, 0x22
	lea rcx, [rel fmt]
	xor al, al
	call printf
	ret

main:
	; Prologue
	push rbp
	mov rbp, rsp

	call get_quine
	leave
	mov rax, 60
	xor edi, edi
	syscall

fmt: db "; This is a quine%1$c%1$csection .text%1$cextern printf%1$cglobal main%1$c%1$cget_quine:%1$c	lea rdi, [rel fmt]%1$c	mov rsi, 0xa%1$c	mov rdx, 0x22%1$c	lea rcx, [rel fmt]%1$c	xor al, al%1$c	call printf%1$c	ret%1$c%1$cmain:%1$c	; Prologue%1$c	push rbp%1$c	mov rbp, rsp%1$c%1$c	call get_quine%1$c	leave%1$c	mov rax, 60%1$c	xor edi, edi%1$c	syscall%1$c%1$cfmt: db %2$c%3$s%2$c, 0x0", 0x0
