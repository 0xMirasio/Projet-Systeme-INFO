#include "util.h"

void init() {
    FILE * fp = NULL;
    fp = fopen ("input.txt","w");
    fclose(fp);
}
void save_line(char * data) {
    FILE * fp = NULL;
    fp = fopen ("input.txt","a");
    fputs(data, fp);
    fclose(fp);
}