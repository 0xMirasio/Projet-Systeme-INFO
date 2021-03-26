/*
 * symbol_table.h
 *
 *  Created on: 22 mars 2021
 *      Author: Kevin
 */

typedef struct {
	int type;
	char * name;
	unsigned int addr;
	int isInitialized;
	int depth;
} Symbol;

typedef struct Symbol_table {
	Symbol * data;
	struct Symbol_table * next;
} Symbol_table;


Symbol * createSymbol(int type, char * name, unsigned int addr, int depth);


Symbol_table * createHead(void);
void insertSymbol(Symbol_table * table_head, Symbol * s);
Symbol * getSymbol(Symbol_table * table_head, char * name);
void removeSymbol(Symbol_table * table_head, char * name);
void setInitialized(Symbol * s);
int isInitialised(Symbol * s);
int getTypeByName(char * type);
unsigned int getAddress(Symbol * s);
int getType(Symbol * s);
int getDepth(Symbol * s);
void print_table(Symbol_table * table);
