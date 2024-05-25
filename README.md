# dr-quine
This C/ASM project is about the principle of self-reproduction and the problems that derive from it. It is a perfect introduction to more complex projects, particularly malware projects.
<br /><br />
A quine is a computer program (a kind of metaprogram) whose output and source code are identical. As a challenge or for fun, some programmers try to write the shortest quine in a given programming language.

* The first executable is named `Colleen`.<br />
The source code contains:<br />
◦ A main function.<br />
◦ Two different comments.<br />
◦ One of the comments is present in the main function<br />
◦ One of the comments is present outside of the program.<br />
◦ Another function in addition to the main function.

* The second executable is named `Grace`.<br />
• When executed, the program writes in a file named `Grace_kid.c`/`Grace_kid.s` the source code of the file used to compile the program.<br />
• The source code contains:<br />
◦ No main declared.<br />
◦ Three defines.<br />
◦ One comment.<br />

## Notes
* printf in ASM:
When not using floating point registers, al needs to be zeroed out before printf is called, otherwise it will segfault.
* The first six integer or pointer arguments are passed in registers as follows:
    - rdi: Used for the first integer or pointer argument.
    - rsi: Used for the second integer or pointer argument.
    - rdx: Used for the third integer or pointer argument.
    - rcx: Used for the fourth integer or pointer argument.
    - r8: Used for the fifth integer or pointer argument.
    - r9: Used for the sixth integer or pointer argument.

* Combining the flags:
	O_RDWR | O_CREAT | O_TRUNC = 02o | 0100o | 01000o = 01102o (octal)
    O_RDWR (2) + O_CREAT (64) + O_TRUNC (512) = 578 (decimal)

## Useful commands
```
// To stop vim from adding a newline at end of file,
// add these two lines in .vimrc
:set nofixeol
:set nofixendofline

// Remove new line character at the end of a file
vim -b <file>
// once in vim:
:set noeol
:wq

// Find out the section where the string data is stored
hexdump -C Colleen

// View the details of the .text section of an ELF file
objdump -h -j .text <ELF_file>

```
