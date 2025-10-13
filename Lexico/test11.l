%option noyywrap
%{
	#include<stdio.h>
	#include"test.h"
	FILE *yyin;
%}

%%
"/*"([^*]|(\*+[^*/]))*\*+"/" { printf("%s %s", TOKEN_COMENTARIO_MULTILINEA, yytext); }
"//".* { printf("%s %s", TOKEN_COMENTARIO_LINEA, yytext); }
printf\s*\([^)]*\"[^"]*\"[^)]*\) { printf("%s %s", TOKEN_TEXTO_PANTALLA, yytext); }
puts\s*\([^)]*\"[^"]*\"[^)]*\) { printf("%s %s", TOKEN_TEXTO_PANTALLA, yytext); }
.      { printf("%s", yytext); }
%%

int main()
{
	FILE *file_11;
	char name[] = "comentarios_c.txt";
	file_11 = fopen(name, "r");

	if(!file_11){
		printf("Ocurrio un error al abrir el archivo.\n");
		return 1;
	}

	yyin = file_11;
	yylex();

	fclose(file_11);
	return 0;
}