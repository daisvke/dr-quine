; This is a quine

%define FNAME "Grace_kid.s"
%define FMT "; This is a quine%1$c%1$c%2$cdefine FNAME %3$cGrace_kid.s%3$c%1$c%2$cdefine FMT %3$c%4$s%3$c%1$c%1$csection .rodata%1$c	filename: db FNAME, 0x0%1$c	fmt: db FMT, 0x0%1$c	mode: db %3$cw%3$c, 0x0%1$c%1$csection .text%1$c	extern fprintf%1$c	extern fopen%1$c	extern fclose%1$c	extern exit%1$c	global main%1$c%1$c%2$cmacro MAIN 0x0%1$cmain:%1$c	push rbp%1$c	mov rbp, rsp%1$c%1$c	lea rdi, [rel filename]%1$c	lea rsi, [rel mode]%1$c	call fopen%1$c	push rax%1$c%1$c	test rax, rax%1$c	js _exit%1$c%1$c	mov rdi, rax%1$c	lea rsi, [rel fmt]%1$c	mov rdx, 0xa%1$c	mov rcx, 0x25%1$c	mov r8, 0x22%1$c	lea r9, [rel fmt]%1$c	xor al, al%1$c	call fprintf%1$c%1$c	pop rdi%1$c	call fclose%1$c%1$c	leave%1$c	xor edi, edi%1$c	call exit%1$c%1$c_exit:%1$c	leave%1$c	mov edi, 0x1%1$c	call exit%1$c%2$cendmacro%1$c%1$cMAIN"

section .rodata
	filename: db FNAME, 0x0
	fmt: db FMT, 0x0
	mode: db "w", 0x0

section .text
	extern dprintf
	extern fopen
	extern fclose
	extern exit
	global _start

%macro MAIN 0x0
main:
	push rbp
	mov rbp, rsp

	lea rdi, [rel filename]
	mov rsi, 0101
    mov rdx, 0666o
	mov rax, 2
	syscall
	push rax

	test rax, rax
	js _exit

	mov rdi, rax
	lea rsi, [rel fmt]
	mov rdx, 0xa
	mov rcx, 0x25
	mov r8, 0x22
	lea r9, [rel fmt]
	xor al, al
	call dprintf

	pop rdi
	mov rax, 3
	syscall

	leave
	mov rax, 60
	xor edi, edi
	syscall

_exit:
	leave
	mov edi, 0x1
	call exit wrt ..plt
%endmacro

_start:
	MAIN
