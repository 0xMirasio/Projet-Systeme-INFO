/*
 * symbol_table.c
 *
 *  Created on: 22 mars 2021
 *      Author: Kevin
 */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "symbol_table.h"

Symbol * createSymbol(int type, char * name, void * addr, int depth){
    Symbol * s = malloc(sizeof(Symbol));
    s->type = type;
    s->name = malloc(strlen(name)+1);
    strcpy(s->name, name);
    s->addr = addr;
    s->depth = depth;
    s->isInitialized = 0;
    return s;
}

Symbol_table * createHead(void){
    Symbol_table * table_head = malloc(sizeof(Symbol_table));
    table_head->data = NULL;
    table_head->next = NULL;
    return table_head;
}

void insertSymbol(Symbol_table * table_head, Symbol * s){
    unsigned int i = 1;
    Symbol_table * current;

    if(table_head->data == NULL){
        table_head->data = s;
    }else{
     
        current = table_head;
        while(current->next != NULL){
           current = current->next;
           i++;
        }
        current->next = malloc(sizeof(Symbol_table));
        current->next->data = s;
        current->next->next = NULL;
    }
}

void removeSymbol(Symbol_table * table_head, char * name) {
    
    Symbol_table * current;
    
    current = table_head;
    while(current != NULL){
        if(strcmp(current->data->name, name) == 0){
            current->data->isInitialized = 0;
            current->data->depth = 0;
            current->data->type = 0;
            current->data->name = "FREE";
        }
        current = current->next;
    }
}

Symbol * getSymbol(Symbol_table * table_head, char * name){
   
    Symbol_table * current;
    
    current = table_head;
    while(current != NULL){
        if(strcmp(current->data->name, name) == 0){
            return current->data;
        }
        current = current->next;
    }

    return NULL;
}

void setInitialized(Symbol * s){
    s->isInitialized = 1;
}


int isInitialised(Symbol * s){
    return s->isInitialized;
}

void * getAddress(Symbol * s){
    return s->addr;
}

/*

type 1 : int
type 2 : char
type 3 : double

si 0 est renvoyé => problème recherche symbol dans table_head, gerer l'erreur
*/
int getType(Symbol * s) {
    s->type;
}

int getTypeByName(char * type) {
    if (strcmp(type, "int")  == 0) {
        return 1;
    }
    if (strcmp(type, "double") == 0) {
        return 2;
    }
    if (strcmp(type, "float") == 0) {
        return 2;
    }
    return 0;
}

int getDepth(Symbol * s) {
    s->depth;
}

void print_table(Symbol_table * table_head){
    Symbol_table * current;
    int i = 0;

    printf("-------------------------------------------------------------------------\n");
    printf("|                               Symbol Table                            |\n");
    printf("-------------------------------------------------------------------------\n");
    printf("| Index |   Type   |    Name    |   Address   | Depth |  IsInitialized  |\n");
    printf("-------------------------------------------------------------------------\n");
    current = table_head;
    while(current != NULL){
        printf("|   %-4d|    %-6d|     %-7s|      %-7d|   %-4d|       %-10d|\n", i, current->data->type, current->data->name,
        current->data->addr, current->data->depth, current->data->isInitialized);
        current = current->next;
        i++;
    }

    printf("-------------------------------------------------------------------------\n");

}
