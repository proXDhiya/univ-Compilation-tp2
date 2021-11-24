flex code.l
gcc lex.yy.c -o code.out
rm lex.yy.c
./code.out app.js > output.txt