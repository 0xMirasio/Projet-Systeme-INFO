%{
#include <stdio.h>
#include <stdlib.h>
%}

%token TINT
%token TFLOAT
%token TMAIN
%token TPRINTF
%token TFLOATNBR
%token TNBR
%token TVAR
%token TPO
%token TPF
%token TMUL
%token TDIV
%token TMINUS
%token TPLUS
%token TSPACE
%token TRET
%token TENDOP
%token TVIR
%token TEQ
%token TAcoDeb
%token TAcoEnd

%%

/*int main() {
[PROGRAMME]
}
*/
debut : Space Retour TINT TSPACE TMAIN Space Retour TAcoDeb Retour Programme Retour TAcoEnd Space Retour
       { printf("[MAIN]\n"); }
       ;

/*
[Entree][Var][Ope][Data];
[Entree][Var];
[Var][Ope][Var][Ope][Var];
[Entree][Var][Ope][Var][Ope][Var]
*/
Programme : Retour Space Entree Space Var Space Ope Space Data Space TENDOP Space Retour Programme
        { printf("[Entree][Var][Ope][Data] : %d \n", $8); }

        | Retour Space Entree Space Var Space TENDOP Space Retour Programme
         { printf("[Entree][Var];\n"); }

        | Retour Space Var Space Ope Space Var Space Ope Space Var TENDOP Space Retour Programme
        { printf("[Var][Ope][Var][Ope][Var];\n");}

        | Retour Space Entree Space Var Space Ope Space Var Space Ope Space Var TENDOP Space Retour Programme
        { printf("[Entree][Var][Ope][Var][Ope][Var]\n");}

        | 
        ;

Entree : TINT { printf("Entree"); }  
      | TFLOAT
      |
      ;
Var : TVAR { printf("Var\n"); }  
      |
      ;
Ope : TEQ { printf("Ope\n"); }  
      | TDIV
      | TMUL
      | TMINUS
      | TPLUS
      | 
      ;
Data : TNBR { $$=$1; }  
      | TFLOATNBR { $$=$1;}
      | 
      ;

Space : TSPACE { printf("Space\n"); }  
      | 
      ;
Retour : TRET { printf("Ret\n"); }  
      | 
      ;

%%

int yyerror(char * s) {
    printf("\n%s\n", s);
}

int main(void) {
  yyparse();
}