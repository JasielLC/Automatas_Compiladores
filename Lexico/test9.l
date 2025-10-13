%option noyywrap
%{
	#include<stdio.h>
	#include"test.h"
	FILE *yyin;
%}

%%
[aA]nalizar|[aA]sociar|[aA]sumir|[cC]alcular|[cC]ategorizar|[cC]lasificar|[cC]omparar|[cC]omponer|[cC]oncluir|[cC]ontrastar|[cC]uestionar|[cC]riticar|[dD]escubrir|[dD]esmenuzar|[dD]estacar|[dD]ibujar|[dD]iagramar|[dD]iferenciar|[dD]iscutir|[dD]iscriminar|[dD]isecar|[dD]istinguir|[dD]ividir|[eE]legir|[eE]ncuestar|[eE]nsamblar|[eE]stimar|[eE]xaminar|[eE]xperimentar|[eE]xplicar|[eE]xtrapolar|[fF]uncionar|[iI]nducir|[iI]nferir|[iI]nspeccionar|[sS]ubdividir { printf("%s %s", TOKEN_VERBO_ANALIZAR, yytext); }
[bB]ueno|[eE]xcelente|[fF]antastico|[gG]enial|[iI]nteligente|[aA]mable|[cC]apaz|[rR]esponsable|[cC]onstante|[eE]ficiente|[oO]rganizado|[pP]ositivo|[pP]aciente|[cC]reativo|[sS]eguro { printf("%s %s", TOKEN_ADJETIVO_POSITIVO, yytext); }
[yY]|[eE]|[nN]i|[aA]si|[cC]omo|[tT]anto|[cC]omo|[lL]o|[mM]ismo|[qQ]ue|[oO]|[uU]|[bB]ien|[pP]ero|[mM]as|[sS]ino|[mM]ientras|[qQ]ue|[aA]unque|[qQ]ue|[sS]i|[cC]omo|[sS]iempre|[cC]uando|[pP]orque|[pP]ues|[yY]a|[qQ]ue|[dD]ado|[qQ]ue|[pP]uesto|[qQ]ue|[vV]isto|[qQ]ue|[aA]|[cC]ausa|[dD]e|[qQ]ue|[lL]uego|[aA]si|[qQ]ue|[dD]e|[mM]odo|[qQ]ue|[dD]e|[mM]anera|[qQ]ue|[dD]e|[fF]orma|[qQ]ue|[cC]onque { printf("%s %s", TOKEN_CONJUNCION, yytext); }
[aA]|[aA]nte|[bB]ajo|[cC]on|[cC]ontra|[dD]e|[dD]esde|[dD]urante|[eE]n|[eE]ntre|[hH]acia|[hH]asta|[mM]ediante|[pP]ara|[pP]or|[sS]egun|[sS]in|[sS]obre|[tT]ras|[vV]ersus|[vV]ia { printf("%s %s", TOKEN_PREPOSICION, yytext); }
[mM]io|[mM]ia|[nN]uestro|[nN]uestra|[mM]ios|[mM]ias|[nN]uestros|[nN]uestras|[tT]uyo|[tT]uya|[vV]uestro|[vV]uestra|[sS]uyo|[sS]uya|[tT]uyos|[tT]uyas|[vV]uestros|[vV]uestras|[eE]ste|[eE]se|[aA]quel|[eE]stos|[eE]sos|[aA]quellos|[eE]sta|[eE]sa|[aA]quella|[eE]stas|[eE]sas|[aA]quellas|[qQ]uien|[qQ]ue|[qQ]uienes|[cC]uanto|[cC]uanta|[cC]uantos|[cC]uantas { printf("%s %s", TOKEN_PRONOMBRE, yytext); }
.      { printf("%s", yytext); }
%%

int main()
{
	FILE *file_9;
	char name[] = "categorias_multiples.txt";
	file_9 = fopen(name, "r");

	if(!file_9){
		printf("Ocurrio un error al abrir el archivo.\n");
		return 1;
	}

	yyin = file_9;
	yylex();

	fclose(file_9);
	return 0;
}