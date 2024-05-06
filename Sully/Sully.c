#include <stdio.h>
#define FNAME "Grace_kid.c"
#define S "#include <stdio.h>%c#define FNAME %cGrace_kid.c%c%c#define S %c%s%c%c#define MAIN() int main() {FILE *f = fopen(FNAME, %cw%c);if (!f) return 1;fprintf(f, S, 10, 34, 34, 10, 34, S, 34, 10, 34, 34, 10, 10, 10);return 0;}%c// Run quine%cMAIN();%c"
#define MAIN() int main() {FILE *f = fopen(FNAME, "w");if (!f) return 1;fprintf(f, S, 10, 34, 34, 10, 34, S, 34, 10, 34, 34, 10, 10, 10);return 0;}
// Run quine
MAIN();
