/* Periorismos enos mono arxeio san eisodo */
%option noyywrap

/* Count grammwn gia na gnwrizoyme se poia grammh einai oi kanones kai ekfraseis poy vrsikoyme */
%option yylineno

%{
    #include <stdio.h>
	#include <string.h>
    int lineno = 1;
	int cid=0;
	int cif=0;
	int celse=0;
	int cfor=0;
	int cdo=0;
	int cwhile=0;
	int ccase=0;
	int cswitch=0;
	int cbreak=0;
	int cswap=0;
	int cprintf=0;
	int cfprintf=0;
	int cscanf=0;
	int cfopen=0;
	int cfclose=0;
	int cfunct=0;
	int complexfactor=0;
	double ifperc=0.0;
	double whileperc=0.0;
	double printperc=0.0;
	double functperc=0.0;
	double idperc=0.0;
	double forperc=0.0;

    void token_print(char *token_type);
	void incid();
	void incif();
	void incfor();
	void counterprint();
	void incelse();
	void incwhile();
	void incfunct();
	void incdo();
	void inccase();
	void incswitch();
	void incbreak();
	void incswap();
	void incprintf();
	void incfprintf();
	void incscanf();
	void incfopen();
	void incfclose();
	void complexprint();
	void percents();
	
%}

nzdigit [1-9]
digit (0|{nzdigit})
digits {digit}+
optFr (\.{digits})? 
optExp ((E|e)(\+|-)?{digits})?
number ({nzdigit}{digits}*|0){optFr}{optExp}
letter [A-Za-z]
float ([1-9][0-9]*|0)?\.[0-9]+
id {letter}({letter}|{digit})*

/* Keywords */

%%

"#include"					{token_print("T_INCLUDE");}
"using" 					{token_print("T_USING");}
"namespace" 				{token_print("T_NAMESPACE");}
"std" 						{token_print("T_STD");}


"float"                     {token_print("T_FLOAT");}
"long"                      {token_print("T_LONG");}
"short" 					{token_print("T_SHORT");}
"int"                       {token_print("T_INT");}
"double"                    {token_print("T_DOUBLE");}
"char"                      {token_print("T_CHAR");}
&?[A-Za-z_0-9]*"["[A-Za-z_0-9+\0-9]*"]" 	{token_print("T_ARRAY"); }

"if" 						{token_print("T_IF");}
"then" 					    {token_print("T_THEN");}
"else" 					    {token_print("T_ELSE");}
"switch" 					{token_print("T_SWITCH");}

"while" 					{token_print("T_WHILE");}
"for" 					    {token_print("T_FOR");}
"do" 					    {token_print("T_DO");}

"void" 					    {token_print("T_VOID");}
"swap" 					    {token_print("T_SWAP");}

"fopen" 					{token_print("T_FOPEN");}
"fclose" 					{token_print("T_FCLOSE");}
"printf" 					{token_print("T_PRINTF");}
"fprintf" 					{token_print("T_FPRINTF");}
"scanf" 					{token_print("T_SCANF");}
"printArray" 				{token_print("T_PRINTARRAY");}
"return" 					{token_print("T_RETURN");}
"sizeof" 					{token_print("T_SIZEOF");}
"endl" 					    {token_print("T_ENDL");}
"auto" 					    {token_print("T_AUTO");}
"break" 					{token_print("T_BREAK");}
"case" 					    {token_print("T_CASE");}
"const" 					{token_print("T_CONST");}
"default" 					{token_print("T_DEFAULT");}
"enum" 					    {token_print("T_ENUM");}
"extern" 					{token_print("T_EXTERN");}
"register" 					{token_print("T_REGISTER");}
"ctrcmp"                    {token_print("T_STRING_COMP");}

"signed"					{token_print("T_SIGNED");}
"static" 					{token_print("T_STATIC");}
"struct" 					{token_print("T_STRUCT");}
"typedef" 					{token_print("T_TYPEDEF");}
"union" 					{token_print("T_UNION");}
"unsigned" 					{token_print("T_UNSIGNED");}
"volatile" 					{token_print("T_VOLATILE");}


"=" 						{token_print("T_ASSIGN");}
"<" 						{token_print("T_LESS");}
">" 						{token_print("T_GREATER");}
"+" 						{token_print("T_PLUS");}
"-" 						{token_print("T_MINUS");}
"=="						{token_print("T_EQ");}
"!="|"<>" 					{token_print("T_NOTEQ");}
"=>"|">=" 					{token_print("T_GEQ");}
"<="|"=<" 					{token_print("T_LEQ");}
".." 						{token_print("T_DOUBLEDOT");}
"++" 						{token_print("T_INCREMENT");}
"--"						{token_print("T_DECREMENT");}
"*" 						{token_print("T_MULTIPLY");}
"/" 						{token_print("T_DIV");}
"%"						    {token_print("T_MOD");}
"&"						    {token_print("T_AND");}
"|"						    {token_print("T_OR");}
"&&"						{token_print("T_DAND");}
"||"						{token_print("T_DOR");}
"!"						    {token_print("T_NOT");}

"<".+">" 					{token_print("T_LIBRARY");}
"(" 						{token_print("T_LPAREN");}
")" 						{token_print("T_RPAREN");}
"{" 						{token_print("T_LBRACE");}
"}" 						{token_print("T_RBRACE");}
"[" 						{token_print("T_LBRACKET");}
"]" 						{token_print("T_RBRACKET");}
"<<" 						{token_print("T_LINSERTIONOP");}
">>" 						{token_print("T_RINSERTIONOP");}
";" 						{token_print("T_SEMICOLON");}
":" 						{token_print("T_COLON");}
"," 						{token_print("T_COMMA");}
"\""						{token_print("T_QMARK");}
" "                         {token_print("T_PLAIN");}
"\\n"						{token_print("T_NEWLINE");}

[/][*][^*]*[*]+([^*/][^*]*[*]+)*[/]    	/*Comment Pollaplwn Seirwn*/
"//".* 					    /* Comment mias seiras */
[/][*]  					{token_print("T_UNTERMINATEDCOMMENT");} 
[ \n\t\r]+ 					/* Kena */

{float}                     {token_print("T_FLOAT_NUMBER");}
{digit} 				 	{token_print("T_DIGIT"); }  
{id} 					    {token_print("T_IDENTIFIER");}
. 						    {printf( "T_UNRECOGNIZEDCHAR: %s\n", yytext);}

%%
void token_print(char *token_type)
{

	fprintf(yyout,"%s\t%s, L:%d\n", yytext, token_type, yylineno);

	if (strcmp(token_type,"T_IF")==0){
		incif();
	}
	if (strcmp(token_type,"T_FOR")==0){
		incfor();
	}
	if (strcmp(token_type,"T_ELSE")==0){
		incelse();
	}
	if (strcmp(token_type,"T_DO")==0){
		incdo();
	}
	if (strcmp(token_type,"T_WHILE")==0){
		incwhile();
	}
	if (strcmp(token_type,"T_CASE")==0){
		inccase();
	}
	if (strcmp(token_type,"T_SWITCH")==0){
		incswitch();
	}
	if (strcmp(token_type,"T_BREAK")==0){
		incbreak();
	}
	if (strcmp(token_type,"T_SWAP")==0){
		incswap();
	}
	if (strcmp(token_type,"T_PRINTF")==0){
		incprintf();
	}
	if (strcmp(token_type,"T_FPRINTF")==0){
		incfprintf();
	}
	if (strcmp(token_type,"T_SCANF")==0){
		incscanf();
	}
	if (strcmp(token_type,"T_FOPEN")==0){
		incfopen();
	}
	if (strcmp(token_type,"T_FCLOSE")==0){
		incfclose();
	}
	if ( strcmp(token_type,"T_FUNCT")==0){
	    incfunct();
	}
	if (strcmp(token_type,"T_IDENTIFIER")==0){
		incid();
	}

}
int main(int argc,char *argv[])
{
	yyin= fopen(argv[1], "r");
	yyout= fopen("test_pantazisdidos4601.txt","w");
	yylex();
	percents();
	counterprint();
	complexprint();
	fclose(yyin);
	fclose(yyout);
	return 0;
}

void counterprint(){

	fprintf(yyout,"Count if =%d\n",cif);
	fprintf(yyout,"Count for =%d\n",cfor);
	fprintf(yyout,"Count else =%d\n",celse);
	fprintf(yyout,"Count do =%d\n",cdo);
	fprintf(yyout,"Count while =%d\n",cwhile);
	fprintf(yyout,"Count case =%d\n",ccase);
	fprintf(yyout,"Count switch =%d\n",cswitch);
	fprintf(yyout,"Count break =%d\n",cbreak);
	fprintf(yyout,"Count printf =%d\n",cprintf);
	fprintf(yyout,"Count fprintf=%d\n",cfprintf);
	fprintf(yyout,"Count scanf=%d\n",cscanf);
	fprintf(yyout,"Count fopen=%d\n",cfopen);
	fprintf(yyout,"Count fclose=%d\n",cfclose);

}

void incif (){
	cif=cif+1;
}
void incfunc (){
	cfunct=cfunct+1;
}

void incfor (){
	cfor=cfor+1;
}

void incelse (){
	celse=celse+1;
}

void incdo (){
	cdo=cdo+1;
}

void incwhile (){
	cwhile=cwhile+1;
}

void inccase (){
	ccase=ccase+1;
}

void incswitch (){
	cswitch=cswitch+1;
}

void incbreak(){
	cbreak=cbreak+1;
}

void incswap(){
	cswap=cswap+1;
};

void incprintf(){
	cprintf=cprintf+1;
};

void incfprintf(){
	cfprintf=cfprintf+1;
};

void incscanf(){
	cscanf=cscanf+1;
};

void incfopen(){
	cfopen=cfopen+1;
};

void incfclose(){
	cfclose=cfclose+1;
};

void incfunct(){
	cfunct=cfunct+1;
}

void incid (){
	cid=cid+1;
}

void percents(){

    int linesCounter=lineno;
	ifperc=(double)cif/linesCounter*100;
	whileperc=(double)cwhile/linesCounter*100;
	functperc=(double)cfunct/linesCounter*100;
	forperc=(double)cfor/linesCounter*100;
	idperc=(double)cid/linesCounter*100;
	printperc=(double)cprintf/linesCounter*100;
	
	fprintf(yyout,"If statements make up %.2f%% of the code\n",ifperc);
	fprintf(yyout,"While statements make up %.2f%% of the code\n",whileperc);
	fprintf(yyout,"Function statements make up %.2f%% of the code\n",functperc);
	fprintf(yyout,"For statements make up %.2f%% of the code\n",forperc);
	fprintf(yyout,"Identifiers make up %.2f%% of the code\n",idperc);
	fprintf(yyout,"Print statements make up %.2f%% of the code\n",printperc);
}

void complexprint(){

	complexfactor=cif*2;
	complexfactor=complexfactor+celse*3;
	complexfactor=complexfactor+cfor*4;
	complexfactor=complexfactor+cdo*4;
	complexfactor=complexfactor+cwhile*5;
	complexfactor=complexfactor+ccase*3;
	complexfactor=complexfactor+cswitch*3;
	complexfactor=complexfactor+cbreak*2;
	complexfactor=complexfactor+cprintf*2;
	complexfactor=complexfactor+cfprintf*3;
	complexfactor=complexfactor+cscanf*3;

	if (complexfactor<=60){
		fprintf(yyout,"The code has a complex factor of %d so its a basic programm in C\n",complexfactor);
	}else if (complexfactor<=180){
		fprintf(yyout,"The code has a complex factor of %d so its moderate advanced programm in C\n",complexfactor);
	}else if (complexfactor<=300){
		fprintf(yyout,"The code has a complex factor of %d so its highly moderate advanced programm in C\n",complexfactor);
	}else if (complexfactor<=500){
		fprintf(yyout,"The code has a complex factor of %d so its advanced programm in C\n",complexfactor);
	}else{
		fprintf(yyout,"The code has a complex factor of %d so its highly advanced programm in C very complex\n",complexfactor);
	}

	if (cfopen!=cfclose){
		fprintf(yyout,"One or more document did not closed in the programm. We suggest to close the file for safety.\n");
	}

}


