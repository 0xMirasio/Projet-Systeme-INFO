%%
int printf("tint, token= %s\n", yytext);
char printf("tchar, token= %s\n", yytext);
float printf("tfloat, token= %s\n", yytext);
main\(\) printf("tmain, token= %s\n", yytext);
printf\(.*\) printf("tprintf, token= %s\n", yytext);
([0-9])+[,]([0-9])+ printf("tnbrfloat, token= %s\n", yytext);
[0-9]+ printf("tnbr, token= %s\n", yytext);
[a-zA-Z1-9\_]+ printf("tvar, token= %s\n", yytext);
[\+\-\*\/\(\)] printf("tope, token= %s\n", yytext);
"\t" printf("ttab, token= %s\n", yytext);
" " printf("tespace, token= %s\n", yytext);
"\n" printf("tret, token= %s\n", yytext);
";" printf("tendI, token= %s\n", yytext);
"," printf("tvir, token= %s\n", yytext);
"=" printf("tequal, token= %s\n", yytext);
"{" printf("tAcoOUV, token= %s\n", yytext);
"}" printf("tAcoFERM, token= %s\n", yytext);
%%

int yywrap(){return 1;}