section .data
	i: dq 5
	buffer: times 100 db 0x0
	filename: db "Sully_%1$d.s", 0x0
	content: db "; This is a quine%1$c%1$c%2$cdefine FNAME %3$cGrace_kid.s%3$c%1$c%2$cdefine FMT %3$c%4$s%3$c%1$c%1$csection .rodata%1$c	filename: db FNAME, 0x0%1$c	fmt: db FMT, 0x0%1$c%1$csection .text%1$c	extern dprintf%1$c	global _start%1$c%1$c%2$cmacro MAIN 0x0%1$cmain:%1$c	push rbp%1$c	mov rbp, rsp%1$c%1$c	lea rdi, [rel filename]%1$c	mov rsi, 0101%1$c	mov rdx, 0666o%1$c	mov rax, 2%1$c	syscall%1$c	push rax%1$c%1$c	test rax, rax%1$c	js _exit%1$c%1$c	mov rdi, rax%1$c	lea rsi, [rel fmt]%1$c	mov rdx, 0xa%1$c	mov rcx, 0x25%1$c	mov r8, 0x22%1$c	lea r9, [rel fmt]%1$c	xor al, al%1$c	call dprintf%1$c%1$c	pop rdi%1$c	mov rax, 3%1$c	syscall%1$c%1$c	leave%1$c	xor edi, edi%1$c	mov rax, 60%1$c	syscall%1$c%1$c_exit:%1$c	leave%1$c	mov edi, 0x1%1$c	mov rax, 60%1$c	syscall%1$c%2$cendmacro%1$c%1$c_start:%1$c	MAIN", 0x0
	compile: db "nasm -f elf64 Sully_%1$d && ld --dynamic-linker=/lib/x86_64-linux-gnu/ld-linux-x86-64.so.2 -lc Sully_%1$d.o -o Sully_%1$d", 0x0
	exec: db "Sully_%1$d", 0x0

section .text
	extern dprintf
	extern sprintf
	extern system
	global _start

%macro SPRINT_FILENAME 0x3
	mov rdi, %1
	mov rsi, %2
	mov rdx, %3
	call sprintf
%endmacro

%macro EXIT 0x1
	leave
	mov edi, %1
	mov rax, 60
	syscall
%endmacro

%macro OPEN_FILE 0x1
	mov rdi, %1
	mov rsi, 0101
	mov rdx, 0666o
	mov rax, 0x2
	syscall
%endmacro

%macro FPRINT_FILECONTENT 0x1
	mov rdi, rax
	lea rsi, %1
	mov rdx, 0xa
	mov rcx, 0x25
	mov r8, 0x22
	mov r9, %1
	xor al, al
	call dprintf
%endmacro

%macro MAIN 0x0
main:
	push rbp
	mov rbp, rsp

	cmp qword [i], 0
	jle EXIT 0x0

	SPRINT_FILENAME buffer, filename, i
	OPEN_FILE buffer
	test rax, rax
	js EXIT 0x1

	FPRINT_FILECONTENT content
	sub rcx, 1

	mov rax, 3
	syscall

	SPRINT_FILENAME buffer, compile, i
	mov rdi, buffer
	call system

	SPRINT_FILENAME buffer, exec, i
	mov rdi, buffer
	call system
%endmacro

_start:
	MAIN
	EXIT 0x0
