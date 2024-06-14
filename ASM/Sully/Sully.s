section .data
	i: dq 5
	fd: dq 0
	buffer: times 100 db 0x0
	filename: db "Sully_%1$d.s", 0x0
	content: db "section .data%1$c	i: dq %2$d%1$c	fd: dq 0%1$c	buffer: times 100 db 0x0%1$c	filename: db %3$cSully_%%1$d.s%3$c, 0x0%1$c	content: db %3$c%4$s%3$c, 0x0%1$c	compile: db %3$cnasm -felf64 Sully_%%1$d.s && ld --dynamic-linker=/lib/x86_64-linux-gnu/ld-linux-x86-64.so.2 -lc Sully_%%1$d.o -o Sully_%%1$d && rm -f *.o%3$c, 0x0%1$c	exec: db %3$c./Sully_%%1$d%3$c, 0x0%1$c%1$csection .text%1$c	extern dprintf%1$c	extern sprintf%1$c	extern system%1$c	global _start%1$c%1$c%%macro SPRINT_FILENAME 0x3%1$c	mov rdi, %%1%1$c	mov rsi, %%2%1$c	mov rdx, qword %%3%1$c	call sprintf%1$c%%endmacro%1$c%1$c%%macro OPEN_FILE 0x1%1$c	mov rdi, %%1%1$c	mov esi, 01102o%1$c	mov edx, 0666o%1$c	mov eax, 0x2%1$c	syscall%1$c%%endmacro%1$c%1$c%%macro FPRINT_FILECONTENT 0x1%1$c	mov rdi, qword [fd]%1$c	mov rsi, %%1%1$c	mov edx, 0xa%1$c	mov rcx, qword [i]%1$c	sub rcx, 0x1%1$c	mov r8d, 0x22%1$c	mov r9, %%1%1$c	call dprintf%1$c%%endmacro%1$c%1$c%%macro MAIN 0x0%1$cmain:%1$c	SPRINT_FILENAME buffer, filename, [i]%1$c	OPEN_FILE buffer%1$c	test rax, rax%1$c	js return%1$c%1$c	mov [fd], rax%1$c	FPRINT_FILECONTENT content%1$c%1$c	mov rdi, qword [fd]%1$c	mov eax, 0x3%1$c	syscall%1$c%1$c	SPRINT_FILENAME buffer, compile, [i]%1$c	mov rdi, buffer%1$c	call system%1$c%1$c	cmp qword [i], 0x0%1$c	jle return%1$c%1$c	SPRINT_FILENAME buffer, exec, [i]%1$c	mov rdi, buffer%1$c	call system%1$c%%endmacro%1$c%1$c_start:%1$c	MAIN%1$c%1$creturn:%1$c	mov eax, 0x3c%1$c	xor edi, edi%1$c	syscall", 0x0
	compile: db "nasm -felf64 Sully_%1$d.s && ld --dynamic-linker=/lib/x86_64-linux-gnu/ld-linux-x86-64.so.2 -lc Sully_%1$d.o -o Sully_%1$d && rm -f *.o", 0x0
	exec: db "./Sully_%1$d", 0x0

section .text
	extern dprintf
	extern sprintf
	extern system
	global _start

%macro SPRINT_FILENAME 0x3
	mov rdi, %1
	mov rsi, %2
	mov rdx, qword %3
	call sprintf
%endmacro

%macro OPEN_FILE 0x1
	mov rdi, %1
	mov esi, 01102o
	mov edx, 0666o
	mov eax, 0x2
	syscall
%endmacro

%macro FPRINT_FILECONTENT 0x1
	mov rdi, qword [fd]
	mov rsi, %1
	mov edx, 0xa
	mov rcx, qword [i]
	sub rcx, 0x1
	mov r8d, 0x22
	mov r9, %1
	call dprintf
%endmacro

%macro MAIN 0x0
main:
	SPRINT_FILENAME buffer, filename, [i]
	OPEN_FILE buffer
	test rax, rax
	js return

	mov [fd], rax
	FPRINT_FILECONTENT content

	mov rdi, qword [fd]
	mov eax, 0x3
	syscall

	SPRINT_FILENAME buffer, compile, [i]
	mov rdi, buffer
	call system

	cmp qword [i], 0x0
	jle return

	SPRINT_FILENAME buffer, exec, [i]
	mov rdi, buffer
	call system
%endmacro

_start:
	MAIN

return:
	mov eax, 0x3c
	xor edi, edi
	syscall