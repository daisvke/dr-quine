#include <stdio.h>
#define FNAME "Grace_kid.c"
#define S "#include <stdio.h>%1$c#define FNAME %2$cGrace_kid.c%2$c%1$c#define S %2$c%3$s%2$c%1$c#define MAIN() int main() {FILE *f = fopen(FNAME, %2$cw%2$c);if (!f) return 1;fprintf(f, S, 10, 34, S);fclose(f);return 0;}%1$c// Run quine%1$cMAIN();"
#define MAIN() int main() {FILE *f = fopen(FNAME, "w");if (!f) return 1;fprintf(f, S, 10, 34, S);fclose(f);return 0;}
// Run quine
MAIN();
