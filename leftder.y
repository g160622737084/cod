%{
#include <stdio.h>
#include <stdlib.h>
%}

%token NUM
%left '+' '-'
%left '*' '/'

%%
expr : expr '+' expr    { printf("Left most derivation \n Reducing: expr + expr\n"); }
     | expr '-' expr    { printf("Reducing: expr - expr\n"); }
     | expr '*' expr    { printf("Reducing: expr * expr\n"); }
     | expr '/' expr    { printf("Reducing: expr / expr\n"); }
     | '(' expr ')'     { printf("Reducing: (expr)\n"); }
     | NUM              { printf("Reducing: NUM\n"); }
     ;

%%
int yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
    return 0;
}

int main() {
    printf("Enter an expression: ");
    yyparse();
    return 0;
}
