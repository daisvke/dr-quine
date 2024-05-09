#include <stdio.h>

/*
	This is a quine
*/
char	*gets() {
	return "#include <stdio.h>%2$c%2$c/*%2$c	This is a quine%2$c*/%2$cchar	*gets() {%2$c	return %3$c%1$s%3$c;%2$c}%2$c%2$cint main() {%2$c	/*%2$c		The output will be the same as the code%2$c	*/%2$c	char *s = gets();%2$c	printf(s, s, 10, 34);%2$c	return 0;%2$c}";
}

int main() {
	/*
		The output will be the same as the code
	*/
	char *s = gets();
	printf(s, s, 10, 34);
	return 0;
}