

#define MZ_MAX 600

typedef struct headMZ{
    void * begin;
    void * current; 
} headMZ;

headMZ * init(void);
void * getFreeAddress(headMZ * head, int type);