; This is a quine

%define FNAME "Grace_kid.s"
%define FMT "; This is a quine%1$c%1$c%2$cdefine FNAME %3$cGrace_kid.s%3$c%1$c%2$cdefine FMT %3$c%4$s%3$c%1$c%1$csection .data%1$c	filename: db FNAME, 0x0%1$c	fmt: db FMT, 0x0%1$c	fd: dd 0%1$c%1$csection .text%1$c	extern dprintf%1$c	global _start%1$c%1$c%2$cmacro OPEN 0x0%1$c	lea rdi, [rel filename]%1$c	mov esi, 01102o%1$c	mov edx, 0666o%1$c	mov rax, 2%1$c	syscall%1$c%2$cendmacro%1$c%1$c%2$cmacro DPRINTF 0x1%1$c	mov rdi, %2$c1%1$c	lea rsi, [rel fmt]%1$c	mov edx, 0xa%1$c	mov ecx, 0x25%1$c	mov r8d, 0x22%1$c	lea r9, [rel fmt]%1$c	call dprintf%1$c%2$cendmacro%1$c%1$c%2$cmacro MAIN 0x0%1$cmain:%1$c	OPEN%1$c%1$c	test rax, rax%1$c	js return%1$c	mov [fd], rax%1$c%1$c	DPRINTF rax%1$c%1$c	mov rdi, [fd]%1$c	mov eax, 3%1$c	syscall%1$c%1$creturn:%1$c	xor edi, edi%1$c	mov eax, 0x3c%1$c	syscall%1$c%2$cendmacro%1$c%1$c_start:%1$c	MAIN"

section .data
	filename: db FNAME, 0x0
	fmt: db FMT, 0x0
	fd: dd 0

section .text
	extern dprintf
	global _start

%macro OPEN 0x0
	lea rdi, [rel filename]
	mov esi, 01102o
	mov edx, 0666o
	mov rax, 2
	syscall
%endmacro

%macro DPRINTF 0x1
	mov rdi, %1
	lea rsi, [rel fmt]
	mov edx, 0xa
	mov ecx, 0x25
	mov r8d, 0x22
	lea r9, [rel fmt]
	call dprintf
%endmacro

%macro MAIN 0x0
main:
	OPEN

	test rax, rax
	js return
	mov [fd], rax

	DPRINTF rax

	mov rdi, [fd]
	mov eax, 3
	syscall

return:
	xor edi, edi
	mov eax, 0x3c
	syscall
%endmacro

_start:
	MAIN