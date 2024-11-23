%{
#include "parser.tab.h"
int yywrap() { return 1; }  // Substituindo a necessidade da libfl
%}

%%

"let"          { return LET; }
"print"        { return PRINT; }
[0-9]+         { yylval.val = atoi(yytext); return NUMBER; }
[a-zA-Z_][a-zA-Z0-9_]* { yylval.name = strdup(yytext); return IDENTIFIER; }
"="            { return '='; }
";"            { return ';'; }
[ \t\n]+       { /* Ignorar espaços e quebras de linha */ }
.              { return yytext[0]; }

%%
