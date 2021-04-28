#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#ifndef UTIL_H
#define UTIL_H

#define MAX_INSTRUCT 1024
#define CHAR_TO_REPLACE '?'

void init();
void save_line(char *data);
void save_all_lines(char *tab[], int size);
void setUpArrayInstr(char *arrayInstr[], int maxSize, int offset, int *eip);

//Not used
void initArray(char *array[], int size, int maxSize);
//Used at the end to print all the instructions
void printArray(char *array[], int size);

/*
Used to store the instruction "JMF @addr ?"
'?' is the char to replace with the line number to jump to
offset and eip are incremented in the function
addr is the address where the result is stored
maxsize is used to malloc the line in the array
*/
void storeJMF(char *array[], int *offset, int addrRes, int *eip,int maxSize);

/*
Used to store the instruction "JMP ?".
'?' is the char to replace with the line number to jump to.
offset and eip are incremented in the function.
maxsize is used to malloc the line in the array.
*/
void storeJMP(char *array[], int *offset, int *eip, int maxSize);

/*
Patch the line array[offset] with the int "jump".
toReplace is the char that is replaced by the int.
The line is modified only if the "toReplace" char exists. 
*/
void patchLine(char *array[], int offset, int jump, char toReplace);

/*
Path all lines in the range [offset_beg, offset_end] in the array
*/
void patchLines(char *array[], int offset_beg, int offset_end, int jump, char toReplace);

#endif