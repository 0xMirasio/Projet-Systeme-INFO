#ifndef MEMORY_Z_H_
#define MEMORY_Z_H_

#define MZ_MAX 600

typedef struct headMZ{
    void * begin;
    void * current; 
} headMZ;

headMZ * initMem(void);
void * getFreeAddress(headMZ * head, int type);

#endif