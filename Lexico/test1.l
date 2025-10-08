%option noyywrap
%{
	#include<stdio.h>
	#include"test.h"
%}
TOKEN_ENTERO [0-9]+
%%
{TOKEN_ENTERO} { printf("TOKEN_ENTERO=%s\n", yytext);}
%%
int main()
{
	yylex();
	return 0;
}