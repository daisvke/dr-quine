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
