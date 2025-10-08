%option noyywrap
%{
	#include<stdio.h>
	#include"test.h"
%}
TOKEN_VARIABLE [a-zA-Z]([a-zA-Z0-9]|[_])*
%%
{TOKEN_VARIABLE} { printf("TOKEN_VARIABLE=%s\n", yytext);}
%%
int main()
{
	yylex();
	return 0;
}