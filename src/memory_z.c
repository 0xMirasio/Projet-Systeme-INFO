#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "memory_z.h"

headMZ * initMem(int beg_int, int beg_double){
     headMZ * head = malloc(sizeof(headMZ));
     head->cpt_int = beg_int;
     head->cpt_double = beg_double;
     return head;
     //cheh
 }

int getFreeAddress(headMZ * head, int type){
    int general_pointer = 0;
    if(type == 1){
         general_pointer = head->cpt_int;
         head->cpt_int++;
         return general_pointer;
    }else if (type == 2){
         general_pointer = head->cpt_double;
         head->cpt_double++;
         return general_pointer;
    }
    else {
        printf("[error] No type found\n");
        exit(1);
    }
}