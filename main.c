#include <stdio.h>
#include "parser.tab.h"

extern int yyparse();

int main() {
    printf("Digite comandos na linguagem:\n");
    yyparse();
    return 0;
}
