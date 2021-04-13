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

void save_all_lines(char * tab[], int size){
    FILE * fp = NULL;
    fp = fopen ("input.txt","a");
    for(int i=0; i<size;i++){
        fputs(tab[i], fp);
    }
    fclose(fp);
}