#include <stdio.h>
#include <stdlib.h>
#define FNAME "Sully"
#define COUNTER 5
#define S "#include <stdio.h>%1$c#include <stdlib.h>%1$c#define FNAME %2$cSully%2$c%1$c#define COUNTER %5$d%1$c#define S %2$c%3$s%2$c%1$c#define MAIN() int main() {char filename[100]; char cmd[100]; if (COUNTER < 1) return 0; sprintf(filename, %2$c%4$cs_%4$cd.c%2$c, FNAME, COUNTER - 1); FILE *f = fopen(filename, %2$cw%2$c); if (!f) return 1; sprintf(cmd, %2$cgcc %4$cs_%4$cd.c -o %4$cs%2$c, FNAME, COUNTER, filename); fprintf(f, S, 10, 34, S, 37, COUNTER - 1); fclose(f); return 0;}%1$c// Run quine%1$cMAIN();"
#define MAIN() int main() {char filename[100]; char cmd[100]; if (COUNTER < 1) return 0; sprintf(filename, "%s_%d.c", FNAME, COUNTER - 1); FILE *f = fopen(filename, "w"); if (!f) return 1; sprintf(cmd, "gcc %s_%d.c -o %s", FNAME, COUNTER, filename); fprintf(f, S, 10, 34, S, 37, COUNTER - 1); fclose(f); return 0;}
// Run quine
MAIN();