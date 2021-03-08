%{
    #include "y.tab.h"
%}

%%
int { return(TINT); }
float { return(TFLOAT); }
main\(\) { return(TMAIN); }
printf\(.*\) { return(TPRINTF); }
([0-9])+[,]([0-9])+ { return(TFLOATNBR); }
[0-9]+ { return(TNBR); }
[a-zA-Z1-9\_]+ { return(TVAR); }
[\(] { return(TPO);}
[\)] { return(TPF);}
[\+] { return(TPLUS);}
[\-] { return(TMINUS);}
[\/] { return(TDIV);}
[\*] { return(TMUL);}
[\t ]+ { return(TSPACE); }
"\n"+ { return(TRET); }
";" { return(TENDOP); }
"," { return(TVIR); }
"=" { return(TEQ); }
"{" { return(TAcoDeb); }
"}" { return(TAcoEnd); }
%%

int yywrap(){return 1;}