# dr-quine
This C/ASM project is about the principle of self-reproduction and the problems that derive from it. It is a perfect introduction to more complex projects, particularly malware projects.

A quine is a computer program (a kind of metaprogram) whose output and source code are identical. As a challenge or for fun, some programmers try to write the shortest quine in a given programming language.

* The first executable is named `Colleen`.
The source code contains:
◦ A main function.
◦ Two different comments.
◦ One of the comments is present in the main function
◦ One of the comments is present outside of the program.
◦ Another function in addition to the main function.

* The second executable is named `Grace`.
• When executed, the program writes in a file named `Grace_kid.c`/`Grace_kid.s` the source code of the file used to compile the program.
• The source code contains
◦ No main declared.
◦ Three defines.
◦ One comment.
