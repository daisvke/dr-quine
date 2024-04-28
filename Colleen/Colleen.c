#include <stdio.h>

// This is a quine
int main() {
	// The output will be the same as the code
    char *s = "#include <stdio.h>%c%c// This is a quine%cint main() {%c	// The output will be the same as the code%c    char *s = %c%s%c;%c    printf(s, 10, 10, 10, 10, 10, 34, s, 34, 10, 10, 10, 10);%c    return 0;%c}%c";
    printf(s, 10, 10, 10, 10, 10, 34, s, 34, 10, 10, 10, 10);
    return 0;
}
