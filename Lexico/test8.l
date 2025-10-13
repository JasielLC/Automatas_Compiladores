%option noyywrap
%{
	#include<stdio.h>
	#include"test.h"
	FILE *yyin;
%}

%%
[aA]plicar|[cC]ambiar|[cC]omprobar|[cC]onstruir|[cC]onvertir|[dD]emostrar|[dD]esarrollar|[dD]ibujar|[dD]ramatizar|[eE]jemplificar|[eE]mplear|[eE]nsamblar|[eE]ntrevistar|[eE]scoger|[eE]stimar|[eE]xtrapolar|[fF]abricar|[iI]lustrar|[iI]nterpolar|[iI]nterpretar|[hH]acer[uU]so[dD]e|[mM]anipular|[mM]odelar|[mM]odificar|[mM]ostrar|[oO]perar|[oO]rganizar|[pP]lanear|[pP]racticar|[pP]reparar|[pP]roducir|[pP]rogramar|[rR]ealizar|[rR]edactar|[rR]elatar|[rR]esolver|[tT]raducir|[tT]ransformar|[tT]razar|[uU]sar|[uU]tilizar|[eE]sbozar|[sS]olucionar { printf("%s %s", TOKEN_VERBO_APLICACION, yytext); }
.      { printf("%s", yytext); }
%%

int main()
{
	FILE *file_8;
	char name[] = "verbos_aplicacion.txt";
	file_8 = fopen(name, "r");

	if(!file_8){
		printf("Ocurrio un error al abrir el archivo.\n");
		return 1;
	}

	yyin = file_8;
	yylex();

	fclose(file_8);
	return 0;
}