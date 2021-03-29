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
        cpt = sizeof(int);
    }else if (type == 2){
        cpt = sizeof(double);
    }
    void * ret = head->current;
    void * addr =  head->current + cpt;
    if(addr > head->begin + MZ_MAX){
        printf("impossible d'allouer plus\n");
    }else{
         head->current += cpt;
    }
    return ret;
}