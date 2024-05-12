; This is a quine

%define FNAME "Grace_kid.s"
%define FMT "; This is a quine%1$c%1$c%2$cdefine FNAME %3$cGrace_kid.s%3$c%1$c%2$cdefine FMT %3$c%4$s%3$c%1$c%1$csection .rodata%1$c	filename: db FNAME, 0x0%1$c	fmt: db FMT, 0x0%1$c%1$csection .text%1$c	extern dprintf%1$c	global _start%1$c%1$c%2$cmacro MAIN 0x0%1$cmain:%1$c	push rbp%1$c	mov rbp, rsp%1$c%1$c	lea rdi, [rel filename]%1$c	mov rsi, 0101%1$c	mov rdx, 0666o%1$c	mov rax, 2%1$c	syscall%1$c	push rax%1$c%1$c	test rax, rax%1$c	js _exit%1$c%1$c	mov rdi, rax%1$c	lea rsi, [rel fmt]%1$c	mov rdx, 0xa%1$c	mov rcx, 0x25%1$c	mov r8, 0x22%1$c	lea r9, [rel fmt]%1$c	xor al, al%1$c	call dprintf%1$c%1$c	pop rdi%1$c	mov rax, 3%1$c	syscall%1$c%1$c	leave%1$c	xor edi, edi%1$c	mov rax, 60%1$c	syscall%1$c%1$c_exit:%1$c	leave%1$c	mov edi, 0x1%1$c	mov rax, 60%1$c	syscall%1$c%2$cendmacro%1$c%1$c_start:%1$c	MAIN"

section .rodata
	filename: db FNAME, 0x0
	fmt: db FMT, 0x0

section .text
	extern dprintf
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
	xor edi, edi
	mov rax, 60
	syscall

_exit:
	leave
	mov edi, 0x1
	mov rax, 60
	syscall
%endmacro

_start:
	MAIN
