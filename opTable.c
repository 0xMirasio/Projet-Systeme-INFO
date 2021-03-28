#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "opTable.h"

#define MAX_SIZE 25


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

int getCode(operation table[], char * str){
    for(int i=0; i<MAX_SIZE;i++){
        if(strcmp( table[i].str, str ) == 0 ){
            return table[i].code;
        }
    }
    return -1;
}