%{
    #include "y.tab.h"
    #include <stdlib.h>
    #include <stdio.h>
%}

%%
int { yylval.v3 = strdup(yytext); return(TINT); }
double { yylval.v3 = strdup(yytext) ; return(TFLOAT); }
main\(\) { return(TMAIN); }
printf\(.*\) { return(TPRINTF); }
([0-9])+[.]([0-9])+ {yylval.v2=atof(yytext); return(TFLOATNBR); }
[0-9]+ {  yylval.v1=atoi(yytext); return(TNBR); }
[a-zA-Z1-9\_]+ { yylval.v3 = strdup(yytext);return(TVAR); }
[\(] { return(TPO);}
[\)] { return(TPF);}
[\+] { yylval.v3 = strdup(yytext);return(TPLUS);}
[\-] { yylval.v3 = strdup(yytext);return(TMINUS);}
[\/] { yylval.v3 = strdup(yytext);return(TDIV);}
[\*] { yylval.v3 = strdup(yytext);return(TMUL);}
[\t ]+ { return(TSPACE); }
"\n"+ { return(TRET); }
";" { return(TENDOP); }
"=" {yylval.v3 = strdup(yytext); return(TEQ); }
"{" { return(TAcoDeb); }
"}" { return(TAcoEnd); }
%%

int yywrap(){return 1;}