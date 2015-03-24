/* recognise tokens and print them out */

%%
\"[A-Za-z0-9 ]+\"  { printf("STRING %s\n", yytext ); }
"+"     { printf("PLUS\n" ); }
"-"     { printf("MINUS\n" ); }
"*"     { printf("MULTIPLY\n" ); }
"/"     { printf("DIVIDE\n" ); }
"^"     { printf("POWER\n" ); }
"="     { printf("EQUALS\n" ); }
"<="    { printf("LESS THAN EQUAL\n" ); }
">="    { printf("GREATER THAN EQUAL\n" ); }
"<>"    { printf("NOT EQUAL\n" ); }
">"     { printf("GREATER THAN\n" ); }
"<"     { printf("LESS THAN\n" ); }
"REM"   { printf("REMARK\n"); }
"PRINT" { printf("PRINT\n"); }
"GOTO"  { printf("GOTO\n"); }
"NOT"   { printf("NOT\n" ); }
"AND"   { printf("AND\n" ); }
"OR"    { printf("OR\n" ); }
[0-9]+  { printf("NUMBER %s\n", yytext); }
\n      { printf("NEWLINE\n"); }
[ \t]   { /* whitespace */ }
.       { printf("Something else %s\n", yytext); }
%%
