%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "symbol_table.h"
#include "util.h"
#include "opTable.h"
#define MAX_MEMORY_SIZE 100

int global_depth = 0;
int global_pointer_INT = 0;
int global_pointer_DOUBLE = 0;
Symbol_table * head_table; 

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
%type <v4> EXPR NUMBER

%right T_EQUALS

%left T_LOGICAL_OR
%left T_LOGICAL_AND
%left T_LOGICAL_EQ T_LOGICAL_NEQ
%left T_LOGICAL_SUP_EQ T_LOGICAL_INF_EQ T_LOGICAL_SUP T_LOGICAL_INF
%left T_ADD T_SUB
%left T_MUL T_DIV

%%
DEBUT : {
		head_table = createHead();
		int * memory_zone_INT = malloc(sizeof(int) * MAX_MEMORY_SIZE);
		int * memory_zone_DOUBLE = malloc(sizeof(int) * MAX_MEMORY_SIZE); 

		/*
		int addr = 5;
		*(memory_zone_INT+sizeof(int)*addr) = 5;
		printf("%d", *(memory_zone_INT+sizeof(int)*addr));
		*/

		} FUNCTIONS
		{
			print_table(head_table);
			save_line("MOV 0 R1\n");
			print_output();
		}
		; 

FUNCTIONS :
		DECLARE_FUNCTION FUNCTIONS
		| ;

CORPS : 
    	T_OPEN_BRAC { global_depth++;} INSTRUCTIONS T_CLOSE_BRAC { global_depth--; }

INSTRUCTIONS : 
		INSTRUCTION INSTRUCTIONS 
		| ; 

INSTRUCTION : 
		DECLARATION T_END_INSTRUCT
		| AFFECTATION T_END_INSTRUCT
		| CALL_FUNCTION T_END_INSTRUCT
		| IF 
		| T_PRINTF T_END_INSTRUCT
		| RETURN T_END_INSTRUCT; 

RETURN :
	T_RETURN EXPR;

DECLARATION : 
		VAR_TYPE T_VARNAME SUITE_DECLARATION {

			int type = getTypeByName($1);
			if (type == 0) {
				printf("ERROR : Type not found !!!\n");
				exit(1);
			}
			Symbol * var;
			if (type == 1) {
				var = createSymbol(type, $2, global_pointer_INT, global_depth);
				global_pointer_INT++;
			}
			if (type == 2) {
				var = createSymbol(type, $2, global_pointer_DOUBLE, global_depth);
				global_pointer_DOUBLE++;	
			}
			
    		insertSymbol(head_table, var);

			}
		| VAR_TYPE AFFECTATION SUITE_DECLARATION {
				int type = getTypeByName($1);
				if (type == 0) {
					printf("ERROR : Type not found !!!\n");
					exit(1);
				}
				Symbol * var;
				if (type == 1) {
					var = createSymbol(type, $2, global_pointer_INT, global_depth);
					global_pointer_INT++;
				}
				if (type == 2) {
					var = createSymbol(type, $2, global_pointer_DOUBLE, global_depth);
					global_pointer_DOUBLE++;	
				}
    			insertSymbol(head_table, var);
			}
		; 

SUITE_DECLARATION :
		T_COMA T_VARNAME SUITE_DECLARATION 
		| T_COMA AFFECTATION SUITE_DECLARATION 
		| ;

AFFECTATION : 
		T_VARNAME T_EQUALS EXPR {$$ = $1;}

VAR_TYPE : 
		T_FLOAT_TYPE {$$ = $1;}
		| T_DOUBLE_TYPE  {$$ = $1;}
		| T_INT_TYPE {$$ = $1;}
		;

/* Function declaration */
DECLARE_FUNCTION : 
		VAR_TYPE T_VARNAME T_OPEN_PAR DECLARE_PARAMETERS T_CLOSE_PAR CORPS;

DECLARE_PARAMETERS : 
		DECLARE_PARAMETER DECLARE_SUITEPARAM
		| ;

DECLARE_PARAMETER :
		VAR_TYPE T_VARNAME ;

DECLARE_SUITEPARAM :
		T_COMA DECLARE_PARAMETER DECLARE_SUITEPARAM
		| ;


/* Function call */
CALL_FUNCTION : 
		T_VARNAME T_OPEN_PAR CALL_PARAMETERS T_CLOSE_PAR;

CALL_PARAMETERS : 
		CALL_PARAMETER CALL_SUITEPARAM
		| ;

CALL_PARAMETER : T_VARNAME;

CALL_SUITEPARAM :
		T_COMA CALL_PARAMETER CALL_SUITEPARAM
		| ;


/* Arithmetic expression*/
EXPR : 
		EXPR T_ADD EXPR
		| EXPR T_SUB EXPR
		| EXPR T_MUL EXPR
		| EXPR T_DIV EXPR
		| T_OPEN_PAR EXPR T_CLOSE_PAR
    	| T_VARNAME
		| CALL_FUNCTION
    	| NUMBER {$$ = $1;}
		;
    

NUMBER :  
    	T_INT {$$=$1;} 
    	| T_FLOAT {$$=$1;}
		 ;



/* Logical condition */
CONDITION :
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
    	| NUMBER;



/* If; Else If; Else */
IF :
    	T_IF CONDITION CORPS SUITE_IF ;

SUITE_IF : 
		T_ELSE T_IF CONDITION CORPS SUITE_IF
		| T_ELSE CORPS
		| ;


%%
int yyerror(void)
{ fprintf(stderr, "erreur de syntaxe\n"); return 1;}

int main(void){
    yyparse();
}
