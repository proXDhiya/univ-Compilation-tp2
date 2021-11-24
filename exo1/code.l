
valid_name              ([a-zA-Z]|"_"){1}("_"|[a-zA-Z0-9])*[a-zA-z]
operators               [\.|=|+|-|*|/]+
string                  ['|"](.*)['|"]
comment                 [/]{2}(.*)
var                     (const|var|lat)[[:space:]]{valid_name}
key_words               (await|break|case|catch|class|continue|debugger|default|delete|do|else|enum|export|extends|false|finally|for|function|if|implements|import|in|instanceof|interface|new|null|package|private|protected|public|return|super|switch|static|this|throw|try|true|typeof|void|while|with|wield)
open_state              [(|{]
close_state             [)|}]

%%

[[:space:]]             ;
{comment}               printf("comment     \t--> %s\n", yytext);
{operators}             printf("operator    \t--> %s\n", yytext);
{open_state}            printf("open state  \t--> %s\n", yytext);
{close_state}           printf("close state \t--> %s\n", yytext);
{key_words}             printf("key_words   \t--> %s\n", yytext);
{var}                   printf("declaration \t--> %s\n", yytext);
{string}                printf("string      \t--> %s\n", yytext);
{valid_name}            printf("correct     \t--> %s\n", yytext);
.                       printf("error       \t--> %s\n", yytext);

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
