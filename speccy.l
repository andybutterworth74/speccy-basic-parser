%{
#include "speccy.tab.h"
%}


%%
\"[A-Za-z0-9 ]+\"  { return STRING; }
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
^[0-9]+ { yylval = atoi(yytext); return LINE_NUMBER; }
[0-9]+  { yylval = atoi(yytext); return NUMBER; }
\n      { return EOL; }
[ \t]   { /* whitespace */ }
.       { return("Something else %c\n", *yytext); }
