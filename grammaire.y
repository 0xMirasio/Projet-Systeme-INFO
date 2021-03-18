%{
#include <stdio.h>
#include <stdlib.h>

%}

%union {int v1; double v2; char * v3;} 
%token <v3> TINT
%token <v3> TFLOAT
%token TMAIN
%token <v3> TPRINTF
%token <v2>TFLOATNBR
%token <v1> TNBR
%token <v3> TVAR
%token TPO
%token TPF
%token <v3>TMUL
%token TIF
%token TELSE
%token <v3>TDIV
%token <v3>TMINUS
%token <v3>TPLUS
%token TENDOP
%token <v3>TEQ
%token TAcoDeb
%token TRETURN
%token TAcoEnd
%token TCOMA
%token TLogicalAnd
%token TLogicalOr
%token TLogicalInf
%token TLogicalSup
%token TLogicalSupEq
%token TLogicalInfEq
%token TLogicalEq
%token TLogicalNorEq

%left TADD TSUB
%left TMUL TDIV
%right TEQ

%type <v1> Data_int
%type <v2> Data_float
%type <v3> Entree Ope

%%

debut : TINT TMAIN TAcoDeb Programme TAcoEnd { printf("[MAIN]");};


Programme : Instructions {printf("[Instruction]\n") ; }
        | 
        ;


Instructions : Instruction Instructions | ;

Instruction : Declaration TENDOP { printf("Declaration\n");}
            | Affectation TENDOP  { printf("Affectation\n");}
            | Call_Function TENDOP  { printf("Call_Function\n");}
            | TRETURN Expression TENDOP { printf("Return\n");} ; 
            | TPRINTF TENDOP {printf("printf\n") ; }
            | Statement {printf("[statement]\n") ; };
 

Declaration : Entree TVAR Declaration_Suite
            | Entree Affectation Declaration_Suite ;

Declaration_Suite : TCOMA TVAR Declaration_Suite
            | TCOMA Affectation Declaration_Suite
            | ;

Affectation: TVAR TEQ Expression;

Call_Function : TVAR TPO Params TPF TENDOP;

Params : Param SuiteParam | ;

Param : Entree TVAR;

SuiteParam : TCOMA Param SuiteParam | ;

Expression : Expression Ope Expression 
            | TPO Expression TPF
            | Data;

Data : TVAR
      | Data_int
      | Data_float;


Statement : TIF Condition Corp SuiteIF ;
Condition : Condition LogicalOperator Condition
            | TPO Condition TPF 
            | Data;

SuiteIF : TELSE TIF Condition Corp SuiteIF | TELSE Corp | ;

Corp : TAcoDeb Instructions TAcoEnd { printf("Corp\n"); };

LogicalOperator : TLogicalAnd
            | TLogicalEq
            | TLogicalInfEq
            | TLogicalNorEq
            | TLogicalOr
            | TLogicalSup
            | TLogicalSupEq
            | TLogicalInf;

Entree : TINT 
      | TFLOAT ;

Ope :  TDIV 
      | TMUL 
      | TMINUS 
      | TPLUS 

Data_int : TNBR;
Data_float : TFLOATNBR ;


%%

int yyerror(char * s) {
    printf("\n%s\n", s);
}


int main(void) {
  yyparse();
}