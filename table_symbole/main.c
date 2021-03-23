#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "symbol_table.h"

int main()
{
    Symbol * s = createSymbol(5, "x", 12, 2);
    Symbol * s2 = createSymbol(10, "s", 5, 10);
    Symbol * z = createSymbol(2, "name", 0, 3);
    Symbol_table * head_table = createHead();
    insertSymbol(head_table, s);
    insertSymbol(head_table, s2);
    insertSymbol(head_table,z);
    Symbol * x = getSymbol(head_table, "s");
    setInitialized(x); 
    print_table(head_table);
    printf("addr = %d\n", s->addr);
    printf("Hello World");

    return 0;
}