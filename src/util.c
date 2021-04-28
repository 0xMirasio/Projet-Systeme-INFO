#include "util.h"


void init() {
    FILE *fp = NULL;
    fp = fopen ("input.txt","w");
    fclose(fp);
}
void save_line(char *data) {
    FILE *fp = NULL;
    fp = fopen ("input.txt","a");
    fputs(data, fp);
    fclose(fp);
}

void save_all_lines(char *tab[], int size){
    FILE *fp = NULL;
    fp = fopen ("input.txt","a");
    for(int i=0; i<size;i++){
        fputs(tab[i], fp);
        fputc('\n', fp);
    }
    fclose(fp);
}

void setUpArrayInstr(char *arrayInstr[],  int maxSize, int offset, int *eip){
    arrayInstr[offset] = malloc(sizeof(char) * maxSize);
    (*eip)++;
}

void initArray(char *array[], int size, int maxSize){
	for(int i=0; i<size; i++){
		array[i] = malloc(sizeof(char)*maxSize);
		strcpy(array[i], "rien");
	}
}

void printArray(char *array[], int size){
	for(int i=0; i<size; i++){
		printf("0x%d : %s\n", i, array[i]);
	}
}

void storeJMF(char *array[], int *offset, int addrRes, int *eip,int maxSize){
	if(array[*offset] == NULL){
		setUpArrayInstr(array, maxSize, *offset, eip);
	}

	sprintf(array[*offset],"JMF %d ?", addrRes);
	(*offset)++;
}

void storeJMP(char *array[], int *offset, int *eip, int maxSize){
	if(array[*offset] == NULL){
		setUpArrayInstr(array, maxSize, *offset, eip);
	}
	strncpy(array[*offset],"JMP ?", 6);
	(*offset)++;
}

void patchLine(char *array[], int offset, int jump, char toReplace){
	char *c =  strchr(array[offset], toReplace);
	if(c != NULL){
		sprintf(c,"%d",jump);
	}
}


void patchLines(char *array[], int offset_beg, int offset_end, int jump, char toReplace){
	for(int i=offset_beg; i<offset_end; i++){
		patchLine(array, i, jump, toReplace);
	}
}
