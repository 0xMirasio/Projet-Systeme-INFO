%{
#include <stdio.h>
#include <stdlib.h>

typedef struct Dico Dico;
struct Dico {
  char * var;              
  double h1;
  int h2;
};

Dico dico;

%}

%union {int v1; double v2; char * v3;} 
%token <v3> TINT
%token <v3> TFLOAT
%token TMAIN
%token TPRINTF
%token <v2>TFLOATNBR
%token <v1> TNBR
%token <v3> TVAR
%token TPO
%token TPF
%token <v3>TMUL
%token <v3>TDIV
%token <v3>TMINUS
%token <v3>TPLUS
%token TSPACE
%token TRET
%token TENDOP
%token <v3>TEQ
%token TAcoDeb
%token TAcoEnd

%type <v2> Data 
%type <v3> Entree Var Ope

%%

/*int main() {
[PROGRAMME]
}
*/
debut : Space Retour TINT TSPACE TMAIN Space Retour TAcoDeb Retour Programme Retour TAcoEnd Space Retour;

/*
[Entree][Var][Ope][Data];
[Entree][Var];
[Var][Ope][Var][Ope][Var];
[Entree][Var][Ope][Var][Ope][Var]
*/
Programme : Retour Space Entree Space Var Space Ope Space Data Space TENDOP Space Retour Programme

        { dico.var = $3 ; printf("%s %s %s %f\n" , dico.var, $5, $7, $9);}

        | Retour Space Entree Space Var Space TENDOP Space Retour Programme
        | Retour Space Var Space Ope Space Var Space Ope Space Var TENDOP Space Retour Programme
        | Retour Space Entree Space Var Space Ope Space Var Space Ope Space Var TENDOP Space Retour Programme
        | 
        ;

Entree : TINT {$$ = $1;}
      | TFLOAT {$$ = $1;}
      |
      ;
Var : TVAR {$$ = $1;}
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

Space : TSPACE
      | 
      ;
Retour : TRET
      | 
      ;

%%

int yyerror(char * s) {
    printf("\n%s\n", s);
}

int main(void) {
  yyparse();
}