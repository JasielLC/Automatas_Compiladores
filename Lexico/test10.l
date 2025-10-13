%option noyywrap
%{
	#include<stdio.h>
	#include"test.h"
	FILE *yyin;
%}

%%
auto|break|case|char|const|continue|default|do|double|else|enum|extern|float|for|goto|if|int|long|register|return|short|signed|sizeof|static|struct|switch|typedef|union|unsigned|void|volatile|while { printf("TOKEN_RESERVADA_C=%s\n", yytext); }
int|char|float|double|void|short|long|signed|unsigned { printf("TOKEN_TIPO_DATO_C=%s\n", yytext); }
[a-zA-Z_][a-zA-Z0-9_]* { printf("TOKEN_VARIABLE_C=%s\n", yytext); }
.      { printf("%s", yytext); }
%%

int main()
{
	FILE *file_10;
	char name[] = "codigo_c.txt";
	file_10 = fopen(name, "r");

	if(!file_10){
		printf("Ocurrio un error al abrir el archivo.\n");
		return 1;
	}

	yyin = file_10;
	yylex();

	fclose(file_10);
	return 0;
}