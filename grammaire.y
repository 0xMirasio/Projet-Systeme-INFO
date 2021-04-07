%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "symbol_table.h"
#include "opTable.h"
#include "memory_z.h"

int yylex();
int yyeror();


int global_depth = 0;
headMZ * global_pointer_zone;
Symbol_table * head_table; 
headMZ * mem;
int lastType;

%}

%union {int v1; double v2; char * v3; void * v4;}
%token T_OPEN_BRAC T_CLOSE_BRAC
%token <v3> T_CONST_TYPE T_INT_TYPE T_FLOAT_TYPE T_DOUBLE_TYPE
%token <v1> T_INT
%token <v2> T_FLOAT 
%token T_RETURN

%token T_ADD T_SUB T_MUL T_DIV T_EQUALS
%token T_OPEN_PAR T_CLOSE_PAR

%token T_LOGICAL_SUP T_LOGICAL_INF
%token T_LOGICAL_AND T_LOGICAL_OR
%token T_LOGICAL_SUP_EQ T_LOGICAL_INF_EQ
%token T_LOGICAL_EQ T_LOGICAL_NEQ

%token T_IF T_ELSE
%token T_COMA

%token T_END_INSTRUCT
%token T_PRINTF
%token <v3> T_VARNAME 


%type <v3> AFFECTATION VAR_TYPE
%type <v4> NUMBER EXPR
%type <v4> DECLARATION

%right T_EQUALS

%left T_LOGICAL_OR
%left T_LOGICAL_AND
%left T_LOGICAL_EQ T_LOGICAL_NEQ
%left T_LOGICAL_SUP_EQ T_LOGICAL_INF_EQ T_LOGICAL_SUP T_LOGICAL_INF
%left T_ADD T_SUB
%left T_MUL T_DIV

%%
DEBUT: {
		head_table = createHead();
		global_pointer_zone = initMem();
		mem = initMem();
		lastType = 1;

		} FUNCTIONS
		{
			print_table(head_table);
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
		| CALL_FUNCTION T_END_INSTRUCT
		| IF 
		| T_PRINTF T_END_INSTRUCT
		| RETURN T_END_INSTRUCT
		; 

RETURN:
	T_RETURN EXPR;

DECLARATION: 
		VAR_TYPE T_VARNAME SUITE_DECLARATION 
			{
				Symbol * s;
				void * addr = getFreeAddress(global_pointer_zone, lastType);
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

AFFECTATION: 
		T_VARNAME T_EQUALS EXPR
			{
				Symbol * s = getSymbol(head_table, $1);
				if(s == NULL){
					void * addrSym = getFreeAddress(global_pointer_zone, lastType);
					s = createSymbol(lastType, $1, addrSym, global_depth);
					insertSymbol(head_table, s);
				}
				setInitialized(s);
				void * addr = getAddress(s);
				printf("COP %p %p\n",addr, $3);
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
                     printf("ADD %p %p %p\n", $1, $1, $3);
                     $$ = $1;
                    }
        | EXPR T_SUB EXPR
                    {
                     printf("SUB %p %p %p\n",  $1, $1, $3);
                     $$ = $1;
                    }
        | EXPR T_MUL EXPR
                    {
                     printf("MUL %p %p %p\n", $1, $1, $3);
                     $$ = $1;
                    }
        | EXPR T_DIV EXPR
                    {
                     printf("DIV %p %p %p\n", $1, $1, $3);
                     $$ = $1;
                    }
        | T_OPEN_PAR EXPR T_CLOSE_PAR
                    {
                     $$ = $2;
                    }
    	| T_VARNAME 
			{
			 Symbol * s = getSymbol(head_table, $1);
			 if(s != NULL && isInitialised(s)){
				int varType = getType(s); 
				void * addr = getAddress(s);
				void * tmp = getFreeAddress(mem, varType);
				printf("COP %p %p\n", tmp, addr);
				$$ = tmp;
			 }else{
				printf("Var %s not initialised\n", $1);
				exit(1);
			 }
			 
			}
		| CALL_FUNCTION
    	| NUMBER 
			{$$ = $1;}
		;
    

NUMBER:  
    	T_INT 
			{ void * addr = getFreeAddress(mem, getTypeByName("int"));
			 printf("AFC %p %d\n", addr, $1);
			 $$ = addr;
			}	 
    	| T_FLOAT
			{ void * addr = getFreeAddress(mem, getTypeByName("float"));
			 printf("AFC %p %f\n", addr, $1);
			 $$ = addr;
			}	
		 ;



/* Logical condition */
CONDITION:
		CONDITION T_LOGICAL_AND CONDITION
		| CONDITION T_LOGICAL_OR CONDITION
		| CONDITION T_LOGICAL_EQ CONDITION
		| CONDITION T_LOGICAL_NEQ CONDITION
		| CONDITION T_LOGICAL_SUP_EQ CONDITION
		| CONDITION T_LOGICAL_INF_EQ CONDITION
		| CONDITION T_LOGICAL_SUP CONDITION
		| CONDITION T_LOGICAL_INF CONDITION
		| T_OPEN_PAR CONDITION T_CLOSE_PAR
		| T_OPEN_PAR AFFECTATION T_CLOSE_PAR
    	| T_VARNAME
    	| NUMBER
		;



/* If; Else If; Else */
IF:
    	T_IF CONDITION CORPS SUITE_IF ;

SUITE_IF: 
		T_ELSE T_IF CONDITION CORPS SUITE_IF
		| T_ELSE CORPS
		| 
		;


%%

int yyerror(void)
{ fprintf(stderr, "erreur de syntaxe\n"); return 1;}

int main(void){
    yyparse();
}
