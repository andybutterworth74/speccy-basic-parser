%{
#include "speccy.tab.h"
%}


%%
\"[A-Za-z0-9 ]+\"  { yysval = yytext; return STRING; }
"+"     { return ADD; }
"-"     { return SUB; }
"*"     { return MULTIPLY; }
"/"     { return DIVIDE; }
"^"     { return POWER; }
"="     { return EQUALS; }
"<="    { return LESS_THAN_EQUAL; }
">="    { return GREATER_THAN_EQUAL; }
"<>"    { return NOT_EQUAL; }
">"     { return GREATER_THAN; }
"<"     { return LESS_THAN; }
"REM"   { return REMARK; }
"PRINT" { return PRINT; }
"GOTO"  { return GOTO; }
"NOT"   { return NOT; }
"AND"   { return AND; }
"OR"    { return OR; }
[0-9]+  { yylval = atoi(yytext); return NUMBER; }
\n      { return EOL; }
[ \t]   { /* whitespace */ }
.       { return("Something else %c\n", *yytext); }
%%

main(int arc, char **argv)
{
  int tok;

  while(tok = yylex()) {
    printf("%d", tok);
    if(tok == NUMBER) printf(" = %d\n", yylval);
    else if(tok == STRING) printf(" = %s\n", yysval);
    else printf("\n");
  }
}
