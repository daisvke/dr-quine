#include <stdio.h>
#define FNAME "Grace_kid.c"
#define S "#include <stdio.h>%c#define FNAME %cGrace_kid.c%c%c#define S %c%s%c%c%cint	main() {%c	FILE	*f = fopen(FNAME, %cw%c);%c	if (!f) return 1;%c	fprintf(f, S, 10, 34, 34, 10, 34, S, 34, 10, 10, 10, 34, 34, 10, 10, 10, 10, 10);%c	return 0;%c}%c"

int	main() {
	FILE	*f = fopen(FNAME, "w");
	if (!f) return 1;
	fprintf(f, S, 10, 34, 34, 10, 34, S, 34, 10, 10, 10, 34, 34, 10, 10, 10, 10, 10);
	return 0;
}
