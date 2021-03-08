%{

#include <stdio.h>
#include <stdlib.h>

%}

%token TINT
%token TCHAR
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

debut : TINT TSPACE TMAIN Space TAcoDeb Programme TAcoEnd 
       { printf("main detecté\n"); }
       ;
Programme : TINT 
        { printf("Int detecté a l'interieur du main\n"); }
        ;

Space : TSPACE | ;

%%

int yyerror(char * s) {
    printf("\n%s\n", s);
}

int main(void) {
  yyparse();
}