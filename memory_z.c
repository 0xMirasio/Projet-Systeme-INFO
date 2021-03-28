#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "memory_z.h"

headMZ * initMem(void){
    headMZ * head = malloc(sizeof(headMZ));
    head->begin = malloc(MZ_MAX);
    head->current = head->begin;
    return head;
}

void * getFreeAddress(headMZ * head, int type){
    int cpt = 0;
    if(type == 1){
        cpt = 4;
    }else if (type == 2){
        cpt = 8;
    }
    void * ret = head->current;
    int addr = head->current + cpt;
    if(addr > ((int) head->begin) + MZ_MAX){
        printf("impossible d'allouer plus\n");
    }else{
         head->current += cpt;
    }
    return ret;
}