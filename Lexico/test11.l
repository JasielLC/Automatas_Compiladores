%option noyywrap
%{
	#include<stdio.h>
	#include"test.h"
	FILE *yyin;
%}

%%
"/*"([^*]|(\*+[^*/]))*\*+"/" { printf("TOKEN_COMENTARIO_MULTILINEA_C=%s\n", yytext); }
"//".* { printf("TOKEN_COMENTARIO_LINEA=%s\n", yytext); }
printf\s*\([^)]*\"[^"]*\"[^)]*\) { printf("TOKEN_TEXTO_PANTALLA=%s\n", yytext); }
puts\s*\([^)]*\"[^"]*\"[^)]*\) { printf("TOKEN_TEXTO_PANTALLA=%s\n", yytext); }
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