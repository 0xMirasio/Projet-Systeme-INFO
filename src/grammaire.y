%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "src/symbol_table.h"
#include "src/opTable.h"
#include "src/memory_z.h"
#include "src/util.h"

#define MAX_SIZE 100

int yylex();
int yyeror();

int global_depth = 0;
int eip = 0;
int lastType = 1;
int cptInstr= 0;
int whileJumpMem;
headMZ *global_pointer_zone, *mem;
Symbol_table *head_table; 

char *arrayInstr[MAX_INSTRUCT];

%}

%union {int v1; double v2; char *v3; int v4;}
%token T_OPEN_BRAC T_CLOSE_BRAC
%token T_CONST_TYPE T_INT_TYPE T_FLOAT_TYPE T_DOUBLE_TYPE
%token T_INT T_FLOAT
%token T_RETURN

%token T_ADD T_SUB T_MUL T_DIV T_EQUALS
%token T_ADD_EQ T_SUB_EQ T_MUL_EQ T_DIV_EQ
%token T_OPEN_PAR T_CLOSE_PAR

%token T_LOGICAL_SUP T_LOGICAL_INF
%token T_LOGICAL_AND T_LOGICAL_OR
%token T_LOGICAL_SUP_EQ T_LOGICAL_INF_EQ
%token T_LOGICAL_EQ T_LOGICAL_NEQ

%token T_IF T_ELSE
%token T_WHILE
%token T_COMA

%token T_END_INSTRUCT
%token T_PRINTF
%token T_VARNAME 

%type <v1> T_INT T_IF T_ELSE T_WHILE
%type <v2> T_FLOAT 
%type <v3> VAR_TYPE T_VARNAME T_CONST_TYPE T_INT_TYPE T_FLOAT_TYPE T_DOUBLE_TYPE
%type <v4> NUMBER EXPR RET_EXPR RETURN DECLARATION CONDITION
%type <v4> AFFECTATION AFFECTATION_EQ
%type <v4> CALL_FUNCTION

%right T_EQUALS

%left T_LOGICAL_OR
%left T_LOGICAL_AND
%left T_LOGICAL_EQ T_LOGICAL_NEQ
%left T_LOGICAL_SUP_EQ T_LOGICAL_INF_EQ T_LOGICAL_SUP T_LOGICAL_INF
%left T_ADD T_SUB
%left T_MUL T_DIV

%%
DEBUT:  
	FUNCTIONS
		{
		printArray(arrayInstr, eip);
		save_all_lines(arrayInstr, cptInstr);
		print_table(head_table);
		printf("EIP : %d\n", eip);
		printf("--------------------------------------------------\n");
		}
	; 


FUNCTIONS:
		DECLARE_FUNCTION FUNCTIONS
		| 
		;

CORPS: 
    T_OPEN_BRAC { global_depth++;} INSTRUCTIONS T_CLOSE_BRAC { global_depth--; }
	;

INSTRUCTIONS: 
		INSTRUCTION INSTRUCTIONS 
		| 
		; 

INSTRUCTION: 
		DECLARATION T_END_INSTRUCT
		| AFFECTATION T_END_INSTRUCT
		| AFFECTATION_EQ T_END_INSTRUCT
		| CALL_FUNCTION T_END_INSTRUCT
		| IF 
		| WHILE
		| T_PRINTF T_END_INSTRUCT
		| RETURN T_END_INSTRUCT
		; 

RETURN:
	T_RETURN RET_EXPR 
		{
		setUpArrayInstr(arrayInstr, MAX_SIZE, cptInstr, &eip);
		sprintf(arrayInstr[cptInstr++], "PRI %d", $2);
		$$ = $2;
		}
	;

RET_EXPR: 
		RET_EXPR T_ADD RET_EXPR
			{
			setUpArrayInstr(arrayInstr, MAX_SIZE, cptInstr, &eip);
			sprintf(arrayInstr[cptInstr++], "ADD %d %d %d", $1, $1, $3);
			$$ = $1;
			}
        | RET_EXPR T_SUB RET_EXPR
            {
			setUpArrayInstr(arrayInstr, MAX_SIZE, cptInstr, &eip);
			sprintf(arrayInstr[cptInstr++], "SOU %d %d %d", $1, $1, $3);
			$$ = $1;
			}
        | RET_EXPR T_MUL RET_EXPR
            {
			setUpArrayInstr(arrayInstr, MAX_SIZE, cptInstr, &eip);
			sprintf(arrayInstr[cptInstr++], "MUL %d %d %d", $1, $1, $3);
			$$ = $1;
			}
        | RET_EXPR T_DIV RET_EXPR
            {
			setUpArrayInstr(arrayInstr, MAX_SIZE, cptInstr, &eip);
			sprintf(arrayInstr[cptInstr++], "DIV %d %d %d", $1, $1, $3);
			$$ = $1;
			}
        | T_OPEN_PAR RET_EXPR T_CLOSE_PAR
                    {
                     $$ = $2;
                    }
    	| T_VARNAME 
			{
			 Symbol *s = getSymbol(head_table, $1);
			 if(s != NULL && isInitialised(s)){
				int varType = getType(s); 
				int addr = getAddress(s);
				int tmp = getFreeAddress(mem, varType);
				
				setUpArrayInstr(arrayInstr, MAX_SIZE, cptInstr, &eip);
				sprintf(arrayInstr[cptInstr++], "COP %d %d",tmp, addr);
				$$ = tmp;
			 }else{
				printf("Var \"%s\" not initialised\n", $1);
				exit(1);
			 }
			 
			}
		| CALL_FUNCTION
    	| NUMBER 
			{$$ = $1;}
		;

DECLARATION: 
		VAR_TYPE T_VARNAME SUITE_DECLARATION 
			{
				Symbol *s;
				int addr = getFreeAddress(global_pointer_zone, lastType);
				s = createSymbol(lastType, $2, addr, global_depth);
				insertSymbol(head_table, s);
				$$ = addr;
			}
		| VAR_TYPE AFFECTATION SUITE_DECLARATION {$$ = $2;}
		; 

SUITE_DECLARATION:
		T_COMA T_VARNAME SUITE_DECLARATION 
		| T_COMA AFFECTATION SUITE_DECLARATION 
		| 
		;

//Affectation simple, aussi utilisée dans les déclarations
AFFECTATION: 
		T_VARNAME T_EQUALS EXPR
			{
				Symbol *s = getSymbol(head_table, $1);
				if(s == NULL){
					int addrSym = getFreeAddress(global_pointer_zone, lastType);
					s = createSymbol(lastType, $1, addrSym, global_depth);
					insertSymbol(head_table, s);
				}
				setInitialized(s);
				int addr = getAddress(s);
				setUpArrayInstr(arrayInstr, MAX_SIZE, cptInstr, &eip);
				sprintf(arrayInstr[cptInstr++], "COP %d %d", addr, $3);
				$$ = addr;
			}
		;


// opérateurs "+=, -=, *=, /=" 
AFFECTATION_EQ:
		T_VARNAME T_ADD_EQ EXPR
			{
				Symbol *s = getSymbol(head_table, $1);
				if(s == NULL || !isInitialised(s)){
					printf("Var \"%s\" not initialised\n", $1);
					exit(1);
				}

				int addr = getAddress(s);
				setUpArrayInstr(arrayInstr, MAX_SIZE, cptInstr, &eip);
				sprintf(arrayInstr[cptInstr++], "ADD %d %d %d", addr, addr, $3);
				$$ = addr;
			}
		| T_VARNAME T_SUB_EQ EXPR
			{
				Symbol *s = getSymbol(head_table, $1);
				if(s == NULL || !isInitialised(s)){
					printf("Var \"%s\" not initialised\n", $1);
					exit(1);
				}

				int addr = getAddress(s);
				setUpArrayInstr(arrayInstr, MAX_SIZE, cptInstr, &eip);
				sprintf(arrayInstr[cptInstr++], "SOU %d %d %d", addr, addr, $3);
				$$ = addr;
			}
		| T_VARNAME T_MUL_EQ EXPR
			{
				Symbol *s = getSymbol(head_table, $1);
				if(s == NULL || !isInitialised(s)){
					printf("Var \"%s\" not initialised\n", $1);
					exit(1);
				}

				int addr = getAddress(s);
				setUpArrayInstr(arrayInstr, MAX_SIZE, cptInstr, &eip);
				sprintf(arrayInstr[cptInstr++], "MUL %d %d %d", addr, addr, $3);
				$$ = addr;
			}
		| T_VARNAME T_DIV_EQ EXPR
			{
				Symbol *s = getSymbol(head_table, $1);
				if(s == NULL || !isInitialised(s)){
					printf("Var \"%s\" not initialised\n", $1);
					exit(1);
				}

				int addr = getAddress(s);
				setUpArrayInstr(arrayInstr, MAX_SIZE, cptInstr, &eip);
				sprintf(arrayInstr[cptInstr++], "DIV %d %d %d", addr, addr, $3);
				$$ = addr;
			}
		;


VAR_TYPE: 
		T_FLOAT_TYPE {lastType = getTypeByName($1);}
		| T_DOUBLE_TYPE  {lastType = getTypeByName($1);}
		| T_INT_TYPE {lastType = getTypeByName($1);}
		;

/* Function declaration */
DECLARE_FUNCTION: 
		VAR_TYPE T_VARNAME T_OPEN_PAR DECLARE_PARAMETERS T_CLOSE_PAR CORPS
		;

DECLARE_PARAMETERS: 
		DECLARE_PARAMETER DECLARE_SUITEPARAM
		| 
		;

DECLARE_PARAMETER:
		VAR_TYPE T_VARNAME 
		;

DECLARE_SUITEPARAM:
		T_COMA DECLARE_PARAMETER DECLARE_SUITEPARAM
		| 
		;


/* Function call */
CALL_FUNCTION: 
		T_VARNAME T_OPEN_PAR CALL_PARAMETERS T_CLOSE_PAR
		{$$ = 0;}
		;

CALL_PARAMETERS: 
		CALL_PARAMETER CALL_SUITEPARAM
		| 
		;

CALL_PARAMETER: T_VARNAME
		;

CALL_SUITEPARAM:
		T_COMA CALL_PARAMETER CALL_SUITEPARAM
		| 
		;


/* Arithmetic expression*/
EXPR: 
		EXPR T_ADD EXPR
			{
			setUpArrayInstr(arrayInstr, MAX_SIZE, cptInstr, &eip);
			sprintf(arrayInstr[cptInstr++], "ADD %d %d %d", $1, $1, $3);
			$$ = $1;
			}
        | EXPR T_SUB EXPR
			{
			setUpArrayInstr(arrayInstr, MAX_SIZE, cptInstr, &eip);
			sprintf(arrayInstr[cptInstr++], "SOU %d %d %d", $1, $1, $3);
			$$ = $1;
			}
        | EXPR T_MUL EXPR
			{
			setUpArrayInstr(arrayInstr, MAX_SIZE, cptInstr, &eip);
			sprintf(arrayInstr[cptInstr++], "MUL %d %d %d", $1, $1, $3);
			$$ = $1;
			}
        | EXPR T_DIV EXPR
			{
			setUpArrayInstr(arrayInstr, MAX_SIZE, cptInstr, &eip);
			sprintf(arrayInstr[cptInstr++], "DIV %d %d %d", $1, $1, $3);
			$$ = $1;
			}
        | T_OPEN_PAR EXPR T_CLOSE_PAR
			{
			$$ = $2;
			}
    	| T_VARNAME 
			{
			 Symbol *s = getSymbol(head_table, $1);
			 if(s != NULL && isInitialised(s)){
				int varType = getType(s); 
				int addr = getAddress(s);
				int tmp = getFreeAddress(mem, varType);
				setUpArrayInstr(arrayInstr, MAX_SIZE, cptInstr, &eip);
				sprintf(arrayInstr[cptInstr++], "COP %d %d",tmp, addr);
				$$ = tmp;
			 }else{
				printf("Var \"%s\" not initialised\n", $1);
				exit(1);
			 }
			 
			}
		| CALL_FUNCTION
    	| NUMBER 
			{$$ = $1;}
		;
    

NUMBER:  
    	T_INT 
			{ int addr = getFreeAddress(mem, getTypeByName("int"));
			 setUpArrayInstr(arrayInstr, MAX_SIZE, cptInstr, &eip);
			 sprintf(arrayInstr[cptInstr++], "AFC %d %d",addr, $1);
			 $$ = addr;
			}	 
    	| T_FLOAT
			{ int addr = getFreeAddress(mem, getTypeByName("float"));
			 setUpArrayInstr(arrayInstr, MAX_SIZE, cptInstr, &eip);
			 sprintf(arrayInstr[cptInstr++], "AFC %d %d",addr, $1);		
			 $$ = addr;
			}	
		 ;



/* Logical condition */
CONDITION:
		CONDITION T_LOGICAL_AND CONDITION

		| CONDITION T_LOGICAL_OR CONDITION

		| CONDITION T_LOGICAL_EQ CONDITION
			{
				int addr = getFreeAddress(mem, getTypeByName("int"));
				setUpArrayInstr(arrayInstr, MAX_SIZE, cptInstr, &eip);
				sprintf(arrayInstr[cptInstr++], "EQU %d %d %d", addr, $1, $3);		
				$$ = addr;
			}
		| CONDITION T_LOGICAL_NEQ CONDITION
			
		| CONDITION T_LOGICAL_SUP_EQ CONDITION
			
		| CONDITION T_LOGICAL_INF_EQ CONDITION

		| CONDITION T_LOGICAL_SUP CONDITION
			{
				int addr = getFreeAddress(mem, getTypeByName("int"));
				setUpArrayInstr(arrayInstr, MAX_SIZE, cptInstr, &eip);
				sprintf(arrayInstr[cptInstr++], "SUP %d %d %d", addr, $1, $3);		
				$$ = addr;
			}
		| CONDITION T_LOGICAL_INF CONDITION
			{
				int addr = getFreeAddress(mem, getTypeByName("int"));
				setUpArrayInstr(arrayInstr, MAX_SIZE, cptInstr, &eip);
				sprintf(arrayInstr[cptInstr++], "INF %d %d %d", addr, $1, $3);		
				$$ = addr;
			}
		| T_OPEN_PAR CONDITION T_CLOSE_PAR
			{ $$ = $2; }
		| T_OPEN_PAR AFFECTATION T_CLOSE_PAR
			{
				int addr = getFreeAddress(mem, getTypeByName("int")); 
				setUpArrayInstr(arrayInstr, MAX_SIZE, cptInstr, &eip);
				sprintf(arrayInstr[cptInstr++], "AFC %d 1",addr);		
				$$ = addr;
			}
    	| T_VARNAME
			{
				Symbol *s = getSymbol(head_table, $1);
				if(s != NULL && isInitialised(s)){ 
					int addr = getAddress(s);
					$$ = addr;
				}else{
					printf("Var \"%s\" not initialised\n", $1);
					exit(1);
				}
			}
    	| NUMBER
			{ $$ = $1; }
		;



/* If; Else If; Else */
IF:
    T_IF CONDITION 
		{
			$1 = cptInstr;
			storeJMF(arrayInstr, &cptInstr, $2, &eip, MAX_SIZE);
		}
	CORPS
		{
			patchLine(arrayInstr, $1, cptInstr+1, CHAR_TO_REPLACE);
		}
	SUITE_IF 
	;

SUITE_IF: 
	T_ELSE
		{
			$1 = cptInstr;
			storeJMP(arrayInstr, &cptInstr, &eip, MAX_SIZE);
		}
	IF
		{
			patchLine(arrayInstr, $1, cptInstr, CHAR_TO_REPLACE);
		}
	| T_ELSE 
		{
			$1 = cptInstr;
			storeJMP(arrayInstr, &cptInstr, &eip, MAX_SIZE);
		}
		CORPS
		{
			patchLine(arrayInstr, $1, cptInstr, CHAR_TO_REPLACE);
		}
	| 
		{
			setUpArrayInstr(arrayInstr, MAX_SIZE, cptInstr, &eip);
			strncpy(arrayInstr[cptInstr++], "NOP", 4);
		}
	;

WHILE:
	T_WHILE 
		{$1 = cptInstr;}
	CONDITION
		{
			whileJumpMem = cptInstr;
			storeJMF(arrayInstr, &cptInstr, $3, &eip, MAX_SIZE);
		}	
	CORPS 
	 	{
			storeJMP(arrayInstr, &cptInstr, &eip, MAX_SIZE);
			patchLine(arrayInstr, cptInstr-1, $1, CHAR_TO_REPLACE);
			patchLine(arrayInstr, whileJumpMem, cptInstr, CHAR_TO_REPLACE);
	 	}
	;
%%

int yyerror(void)
{ fprintf(stderr, "erreur de syntaxe\n"); return 1;}

int main(void){
	head_table = createHead();
	global_pointer_zone = initMem(2000,3000);
	mem = initMem(0,1000);
	init();
    yyparse();
}
