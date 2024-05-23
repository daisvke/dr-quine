section .data
	i: dq 5
	buffer: times 100 db 0
	filename: db "Sully_%1$d.s", 0x0
	content: db "section .data%1$c	i: dq 5%1$c	buffer: times 100 db 0x0%1$c	filename: db %2$cSully_%1$c%d.s%2$c, 0x0%1$c	content: db %2$c%4$s%2$c, 0x0%1$c	compile: db %2$cnasm -f elf64 Sully_%1$c && ld --dynamic-linker=/lib/x86_64-linux-gnu/ld-linux-x86-64.so.2 -lc Sully_%1$c.o -o Sully_%1$c%2$c, 0x0%1$c	exec: db %2$cSully_%1$c%2$c, 0x0%1$c%1$csection .text%1$c	extern dprintf%1$c	extern sprintf%1$c	extern system%1$c	global _start%1$c%1$c%2$cmacro SPRINT_FILENAME 0x3%1$c	mov rdi, %1%1$c	mov rsi, %2%1$c	mov rdx, %3%1$c	call sprintf%1$c%2$c%2$cmacro EXIT 0x1%1$c	leave%1$c	mov edi, %1%1$c	mov rax, 60%1$c	syscall%1$c%2$c%2$cmacro OPEN_FILE 0x1%1$c	mov rdi, %1%1$c	mov rsi, 0101%1$c	mov rdx, 0666o%1$c	mov rax, 0x2%1$c	syscall%1$c%2$c%2$cmacro FPRINT_FILECONTENT 0x1%1$c	mov rdi, rax%1$c	lea rsi, %1%1$c	mov rdx, 0xa%1$c	mov rcx, 0x25%1$c	mov r8, 0x22%1$c	mov r9, %1%1$c	xor al, al%1$c	call dprintf%1$c%2$c%2$cmacro MAIN 0x0%1$cmain:%1$c	SPRINT_FILENAME buffer, filename, i%1$c	OPEN_FILE buffer%1$c	test rax, rax%1$c	js EXIT 0x1%1$c	FPRINT_FILECONTENT content%1$c	sub rcx, 1%1$c	mov rax, 3%1$c	syscall%1$c	SPRINT_FILENAME buffer, compile, i%1$c	mov rdi, buffer%1$c	call system%1$c	cmp qword [i], 0%1$c	jle EXIT 0x0%1$c	SPRINT_FILENAME buffer, exec, i%1$c	mov rdi, buffer%1$c	call system%1$c%2$c_start:%1$c	push rbp%1$c	mov rbp, rsp%1$c%1$c	MAIN%1$c	EXIT 0x0%1$c", 0x0
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

%macro OPEN_FILE 0x0
	mov rsi, 0101
	mov rdx, 0666o
	mov rax, 0x2
	syscall
%endmacro

%macro FPRINT_FILECONTENT 0x1
	mov rdi, rax
	mov rsi, %1
	mov rdx, 0xa
	mov rcx, 0x22
	mov r8, 0x25
	mov r9, %1
	xor al, al
	call dprintf
%endmacro

%macro MAIN 0x0
main:
	SPRINT_FILENAME buffer, filename, [i]
	OPEN_FILE
	test rax, rax
	js EXIT 0x1

	FPRINT_FILECONTENT content
	sub rcx, 1

	mov rax, 3
	syscall

	SPRINT_FILENAME buffer, compile, [i]
	mov rdi, buffer
	call system

	cmp qword [i], 0
	jle EXIT 0x0

	SPRINT_FILENAME buffer, exec, [i]
	mov rdi, buffer
	call system
%endmacro

_start:
	push rbp
	mov rbp, rsp

	MAIN
	EXIT 0x0
