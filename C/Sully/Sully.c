#include <stdio.h>
#include <stdlib.h>
#define FNAME "Sully"
#define COUNTER 5
#define S "#include <stdio.h>%c#include <stdlib.h>%c#define FNAME %cSully%c#define COUNTER 5%c#define S %c%s%c%c#define MAIN() int main() {char *filename[100]; char *cmd[100]; if (COUNTER < 1) return 0;sprintf(filename, %c%cs_%cd.c%c, FNAME, --COUNTER);FILE *f = fopen(FNAME, %cw%c);if (!f) return 1;fprintf(f, S, 10, 10, 34, 34, 10, 34, S, 34, 10, 34, 37, 37, 34, 34, 34, 10, 10, 10);return 0;}%c// Run quine%cMAIN();%c"
#define MAIN() int main() {char *filename[100]; char *cmd[100]; if (COUNTER < 1) return 0;sprintf(filename, "%s_%d.c", FNAME, --COUNTER); FILE *f = fopen(filename, "w");if (!f) return 1; sprintf(cmd, "gcc %s_%d.c -o %s", FNAME, COUNTER, filename);fprintf(f, S, 10, 34, 34, 10, 34, S, 34, 10, 34, 34, 10, 10, 10, FNAME);return 0;}
// Run quine
MAIN();
