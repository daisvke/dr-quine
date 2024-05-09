#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define FNAME "Sully"
#define S "#include <stdio.h>%1$c#include <stdlib.h>%1$c#include <string.h>%1$c#define FNAME %2$cSully%2$c%1$c#define S %2$c%3$s%2$c%1$cint i = %5$d;%1$c#define FT(FNAME, S) int main() {char filename[100]; char cmd[100]; char basename[100]; if (i < 1) return 0; sprintf(filename, %2$c%4$cs_%4$cd.c%2$c, FNAME, i); if (!strcmp(filename, __FILE__)) --i; sprintf(filename, %2$c%4$cs_%4$cd.c%2$c, FNAME, i); FILE *f = fopen(filename, %2$cw%2$c); if (!f) return 1; sprintf(basename, %2$c%4$c1$s_%4$c2$d%2$c, FNAME, i); sprintf(cmd, %2$cgcc %4$c1$s.c -o %4$c1$s%2$c, basename); fprintf(f, S, 10, 34, S, 37, i); fclose(f); system(cmd); sprintf(filename, %2$c./%4$cs%2$c, basename); system(filename); return 0;}%1$c/*%1$c	Run quine%1$c*/%1$cFT(FNAME, S);"
int i = 5;
#define FT(FNAME, S) int main() {char filename[100]; char cmd[100]; char basename[100]; if (i < 1) return 0; sprintf(filename, "%s_%d.c", FNAME, i); if (!strcmp(filename, __FILE__)) --i; sprintf(filename, "%s_%d.c", FNAME, i); FILE *f = fopen(filename, "w"); if (!f) return 1; sprintf(basename, "%1$s_%2$d", FNAME, i); sprintf(cmd, "gcc %1$s.c -o %1$s", basename); fprintf(f, S, 10, 34, S, 37, i); fclose(f); system(cmd); sprintf(filename, "./%s", basename); system(filename); return 0;}
/*
	Run quine
*/
FT(FNAME, S);