#include <stdio.h>

// This is a quine
char	*gets() {
	return "#include <stdio.h>%c%c// This is a quine%cchar	*gets() {%c	return %c%s%c;%c}%c%cint main() {%c	// The output will be the same as the code%c	char *s = gets();%c	printf(s, 10, 10, 10, 10, 34, s, 34, 10, 10, 10, 10, 10, 10, 10, 10, 10);%c	return 0;%c}%c";
}

int main() {
	// The output will be the same as the code
	char *s = gets();
	printf(s, 10, 10, 10, 10, 34, s, 34, 10, 10, 10, 10, 10, 10, 10, 10, 10);
	return 0;
}
