%option noyywrap
%{
	#include<stdio.h>
	#include"Examen.h"
	FILE *yyin;
	int cont_com = 0;
%}

%%
"//".* { printf("TOKEN_COMENTARIO_LINEA_C= %s\n", yytext); cont_com++; }

"/*"([^*]|(\*+[^*/]))*\*+"/" { printf("TOKEN_COMENTARIO_MULTILINEA_C= %s\n", yytext); cont_com++; }

auto|bool|break|case|catch|char|class|const|continue|default|delete|do|double|else|enum|explicit|export|extern|false|float|for|friend|goto|if|inline|int|long|mutable|namespace|new|operator|private|protected|public|register|return|short|signed|sizeof|static|struct|switch|template|this|throw|true|try|typedef|typename|union|unsigned|using|virtual|void|volatile|while { printf("TOKEN_RESERVADA_C= %s\n", yytext); }

[a-zA-Z]([a-zA-Z0-9]|[_])* { printf("TOKEN_VARIABLE_C= %s\n", yytext); }

[0-9]+|[0-9]+[.][0-9]+ { printf("TOKEN_CONSTANTE_NUMERICA_C= %s\n", yytext); }

"+"|"-"|"*"|"/"|"%"|"++"|"--" { printf("TOKEN_OPERADOR_ARITMETICO_C= %s\n", yytext); }

"="|"#"|"=="|"!="|">"|"<"|">="|"<="|"&&"|"||"|"!" { printf("TOKEN_OPERADOR_LOGICO_C= %s\n", yytext); }

"("|")"|"{"|"}"|"["|"]"|";"|","|":"|"?"|"." { printf("TOKEN_SIMBOLO_ESPECIAL_C= %s\n", yytext); }

. { printf("%s\n", yytext); }
%%

int main()
{
	FILE *file_12;
	char name[] = "codigo_cpp.txt";
	file_12 = fopen(name, "r");

	if(!file_12){
		printf("Ocurrio un error al abrir el archivo.\n");
		return 1;
	}

	yyin = file_12;
	
	printf ("---ANALISIS DEL CONTENIDO DEL CODIGO EN C++ ---\n");
	
	yylex();

	printf("\n---RESUMEN---\n");
	printf ("Total de comentarios encontrados: %d\n", cont_com);
	
	fclose(file_12);
	return 0;
	
}