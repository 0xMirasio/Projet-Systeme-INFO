#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "util.h"


char output_code[5000][20];
int line_pointer = 0;

void save_line(char* data){
	strcpy(output_code[line_pointer], data);
	line_pointer++;
}

void print_output() {
        printf("Output instructions:\n");
        for(int i=0; i<line_pointer; i++) {
			printf("\t%s\n", output_code[i]);
		}
}
