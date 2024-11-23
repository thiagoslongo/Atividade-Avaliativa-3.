CMD
cd.. C:\GnuWin32\bin

flex scanner.l
bison -d parser.y
gcc -o minilang lex.yy.c parser.tab.c main.c

inicia o minilang.exe, executa os comandos abaixo: 
> let x = 5;
resultado: Variável x = 5
> let y = 10;
resultado: Variável y = 10
> print x;
resultado: Resultado: 5
> print y;
resultado: Resultado: 10
