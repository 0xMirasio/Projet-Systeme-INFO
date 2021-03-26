#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "util.h"


char output_code[5000][20];
u_int32_t line_pointer = 0;

operation opList[] = {
   {"ADD", 1},
   {"MUL", 2},
   {"SOU", 3},
   {"DIV", 4},
   {"COP", 5},
   {"AFC", 6},
   {"JMP", 7},
   {"JMF", 8},
   {"INF", 9},
   {"SUP", 10},
   {"EQU", 11},
   {"PRI", 12}
};

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

int getCode(operation table[], char * str){
    for(int i=0; i<MAX_SIZE;i++){
        if(strcmp( table[i].str, str ) == 0 ){
            return table[i].code;
        }
    }
    return -1;
}