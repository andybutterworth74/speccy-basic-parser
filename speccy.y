/* simple version of a zx spectrum BASIC parser */
%{
#include <stdio.h>
%}

/* declare tokens */
%token NUMBER
%token STRING
%token ADD SUB MULTIPLY DIVIDE POWER EQUALS
%token LESS_THAN_EQUAL GREATER_THAN_EQUAL NOT_EQUAL GREATER_THAN LESS_THAN
%token REMARK
%token PRINT
%token GOTO
%token NOT
%token AND
%token OR
%token EOL

%%


exp: factor
   | exp ADD factor  { $$ = $1 + $3; }
   | exp SUB factor  { $$ = $1 - $3; }

factor: term
      | factor MULTIPLY term { $$ = $1 * $3; }
      | factor DIVIDE term { $$ = $1 / $3; }


string: STRING
;

term: NUMBER 
;
%%

main(int argc, char **argv) {
  yyparse();
}

yyerror(char *s) {
  fprintf(stderr, "error: %s\n", s);
}
