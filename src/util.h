#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#ifndef UTIL_H
#define UTIL_H

#define MAX_INSTRUCT 1024

void init();
void save_line(char * data);
void save_all_lines(char * tab[], int size);

#endif