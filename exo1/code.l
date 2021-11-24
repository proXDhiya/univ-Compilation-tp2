%%

[[:space:]]                         ;
^[/]{2}(.*)                         printf("comment \t--> %s\n", yytext);
[(\.)|(=)|(+)|(-)|(*)|(/)]          printf("operator\t--> %s\n", yytext);
['|"](.*)['|"]                      printf("string  \t--> %s\n", yytext);
([a-zA-Z]|"_"){1}[a-zA-Z0-9]*       printf("correct \t--> %s\n", yytext);


%%

int yywrap(void) {
    return 1;
}

int main(int argc, char *argv[]) {
    yyin = fopen(argv[1], "r");
    yylex();
    fclose(yyin);
    printf("\n");
    return 0;
}
