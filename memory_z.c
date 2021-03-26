#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "memory_z.h"

headMZ * init(void){
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
    head->current += cpt;
    return ret;
}

int main(){
    headMZ * head = init();
    printf("addr debut = %p, addr current = %p\n", head->begin, head->current);
    void * addr = getFreeAddress(head, 1);
    printf("addr debut = %p, addr current = %p\n", head->begin, addr);
    addr = getFreeAddress(head, 2);
    printf("addr debut = %p, addr current = %p\n", head->begin, addr);
    addr = getFreeAddress(head, 2);
    printf("addr debut = %p, addr current = %p\n", head->begin, addr);
    return 0;
}