#ifndef MEMORY_Z_H_
#define MEMORY_Z_H_

#define MZ_MAX 600

typedef struct headMZ{
    int cpt_int;
    int cpt_double;
} headMZ;

headMZ * initMem(int cpt_int, int cpt_double);
int getFreeAddress(headMZ * head, int type);

#endif