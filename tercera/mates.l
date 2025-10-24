%option noyywrap
%{
	#include<stdio.h>
	#include"mate.h"
	FILE *yyin;
	int lineas = 0;
	int palabras = 0;
	int caracteres = 0;
	int ni_palabras = 0;
	int num_palabras = 0;
	int b_to_palabras = 0;
	int jo_palabras = 0;
	int digitos = 0;
%}

%%
\n { lineas++; caracteres++; }

[Nn][Ii][a-zA-Z]* { ni_palabras++; palabras++; caracteres += yyleng; }

[Nn][Uu][Mm][a-zA-Z]* { num_palabras++; palabras++; caracteres += yyleng; }

[Bb][a-zA-Z]*[Tt][Oo] { b_to_palabras++; palabras++; caracteres += yyleng; }

[a-zA-Z]*[Jj][Oo] { jo_palabras++; palabras++; caracteres += yyleng; }

[0-9]+|[0-9]+[.][0-9]+ { digitos++; caracteres += yyleng; }

[a-zA-Z]+ { palabras++; caracteres += yyleng; }

[ \t]+ { caracteres += yyleng; }

[.,:;"!¡] { caracteres++; }

. { caracteres++; }
%%

int main()
{
	FILE *file_13;
	char name[] = "elbrutodelasmates.txt";
	file_13 = fopen(name, "r");

	if(!file_13){
		printf("Ocurrio un error al abrir el archivo.\n");
		return 1;
	}

	yyin = file_13;
	
	printf("---ANALISIS DEL CONTENIDO DEL ARCHIVO ---\n");
	
	yylex();

	printf("Total de lineas: %d\n", lineas);
	printf("Total de palabras: %d\n", palabras);
	printf("Total de caracteres: %d\n", caracteres);
	printf("Inician con 'ni': %d\n", ni_palabras);
	printf("Inician con 'num': %d\n", num_palabras);
	printf("Inician con 'b' y terminan con 'to': %d\n", b_to_palabras);
	printf("Terminan con 'jo': %d\n", jo_palabras);
	printf("Son digitos: %d\n", digitos);
	
	fclose(file_13);
	return 0;
}