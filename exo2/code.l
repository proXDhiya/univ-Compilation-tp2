prefix          [(+)|(-)]{2}(.*)[ \t\n]
postfix         [a-zA-Z0-9]*[(+)|(-)]{2}

%%

[[:space:]]     ;
{postfix}       printf("Postfix --> %s\n", yytext);
{prefix}        printf("Prefix  --> %s\n", yytext);
.               ;

%%

int yywrap(void) {
    return 1;
}

int main(int argc, char *argv[]) {
    yyin = fopen(argv[1], "r");
    yylex();
    fclose(yyin);
    return 0;
}
