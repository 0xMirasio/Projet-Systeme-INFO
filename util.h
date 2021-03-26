
#ifndef UTIL_H_
#define UTIL_H_

#define MAX_SIZE 25

typedef struct operation {
    char * str;
    int code;
} operation ;

int getCode(operation table[], char * str);
void print_output();
void save_line(char* data);

#endif
