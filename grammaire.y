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
%token <v3>TIF
%token <v3>TELSE
%token <v3>TELSEIF
%token <v3>TDIV
%token <v3>TMINUS
%token <v3>TPLUS
%token TSPACE
%token TRET
%token TENDOP
%token <v3>TEQ
%token TAcoDeb
%token TAcoEnd

%left TADD TSUB
%left TMUL TDIV
%right TEQ

%type <v2> Data 
%type <v3> Entree Var Ope Printf

%%

debut : Space Retour TINT TSPACE TMAIN Space Retour TAcoDeb Retour Programme Retour TAcoEnd Space Retour { printf("[MAIN]");};

/*
[Statement]
[Printf]
[Expression]

*/
Programme : Statement {printf("[statement]\n") ; }
        | Expression {printf("[Expression]\n") ; }
        | Printf {printf("[printf]") ; }
        | 
        ;

Expression : Retour Space Entree Space Var Space Ope Space Data Space TENDOP Space Retour Programme
        { printf("%s %s %s %f\n" , $3, $5, $7, $9);}
        | Retour Space Entree Space Var Space TENDOP Space Retour Programme
        { printf("%s %s\n" , $3, $5);}
        | Retour Space Var Space Ope Space Var Space Ope Space Var TENDOP Space Retour Programme
         {printf("%s %s %s %s %s\n" , $3, $5, $7, $9, $11);}
        | Retour Space Entree Space Var Space Ope Space Var Space Ope Space Var TENDOP Space Retour Programme
         {printf("%s %s %s %s $s $s\n" , $3, $5, $7, $9, $11, $13);}
        | 
        ;

Statement : Retour Space TIF Body Retour Space Programme{ printf("%s" , $3); }
            | Retour Space TELSE Body Retour Space Programme{ printf("%s" , $3); }
            | Retour Space TELSEIF Body Retour Space Programme{ printf("%s" , $3); }
            | 
            ;

Body : Retour Space TAcoDeb Retour Space Expression Space Retour TAcoEnd Space Retour Programme{printf("[BODY]\n") ; } 
      | 
      ;
Printf : Retour Space TPRINTF TENDOP Space Retour Programme {printf("%s\n", $3);} 
      | 
      ;

Entree : TINT {printf("[entree]\n"); $$ = $1;}
      | TFLOAT {$$ = $1;}
      |
      ;
Var : TVAR {$$ = $1; printf("[tvar]\n"); $$ = $1;}
      |
      ;
Ope : TEQ {$$ = $1;}
      | TDIV {$$ = $1;}
      | TMUL {$$ = $1;}
      | TMINUS {$$ = $1;}
      | TPLUS {$$ = $1;}
      | 
      ;
Data : TNBR { $$ = $1; }
      | TFLOATNBR { $$ = $1;}
      | 
      ;

Space : TSPACE {printf("[SPACE]\n") ; }
      | 
      ;
Retour : TRET {printf("[RET]\n") ; }
      | 
      ;

%%

int yyerror(char * s) {
    printf("\n%s\n", s);
}


int main(void) {
  yyparse();
}