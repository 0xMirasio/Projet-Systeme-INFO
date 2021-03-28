
#ifndef OPTABLE_H_
#define OPTABLE_H_

typedef struct operation {
    char * str;
    int code;
} operation ;

int getCode(char * str);

#endif
