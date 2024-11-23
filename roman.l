%{
#include <stdio.h>
#include <stdlib.h>

void to_roman(int num) {
    char *thousands[] = {"", "M", "MM", "MMM"};
    char *hundreds[] = {"", "C", "CC", "CCC", "CD", "D", "DC", "DCC", "DCCC", "CM"};
    char *tens[] = {"", "X", "XX", "XXX", "XL", "L", "LX", "LXX", "LXXX", "XC"};
    char *units[] = {"", "I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX"};

    if (num < 1 || num > 3999) {
        printf("Numero fora do intervalo (1-3999).\n");
        return;
    }

    printf("Numero em romano: %s%s%s%s\n", 
           thousands[num / 1000], 
           hundreds[(num % 1000) / 100], 
           tens[(num % 100) / 10], 
           units[num % 10]);
}

%}

%%
[0-9]+      { to_roman(atoi(yytext)); }
\n          { /* Ignorar novas linhas */ }
[ \t]       { /* Ignorar espaços em branco */ }
.           { printf("Caractere inválido: %s\n", yytext); }

%% 

int main() {
    printf("Digite um numero inteiro positivo (1-3999): ");
    yylex();  // Inicia o analisador léxico
    return 0;
}

int yywrap() {
    return 1;
}