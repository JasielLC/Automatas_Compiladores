%option noyywrap
%{
	#include<stdio.h>
	#include"test.h"
%}
TOKEN_DECIMAL [0-9]+[.][0-9]+
%%
{TOKEN_DECIMAL} { printf("TOKEN_DECIMAL=%s\n", yytext);}
%%
int main()
{
	yylex();
	return 0;
}