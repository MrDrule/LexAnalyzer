/* Periorismos enos mono arxeio san eisodo */
%option noyywrap 
/* Count grammwn gia na gnwrizoyme se poia grammh einai oi kanones kai ekfraseis poy vrsikoyme */
%option yylineno 
/* Aferesi case sensitive (for=FOR)*/
%option case-insensitive 
%{
#include <stdio.h>
#include "y.tab.h"
int line_number= 1;
void token_print(char *token_type);
void yyerror();
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

"long"                      {token_print("T_LONG");}
"short" 					{token_print("T_SHORT");}

"double"                    {token_print("T_DOUBLE");return T_DOUBLE;}
"char"                      {token_print("T_CHAR");return T_CHAR;}
&?[A-Za-z_0-9]*"["[A-Za-z_0-9+\0-9]*"]" 	{token_print("T_ARRAY"); }

"void" 					    {token_print("T_VOID"); return T_VOID;}
"swap" 					    {token_print("T_SWAP"); }

"for" 						{token_print("T_FOR"); return T_FOR;}
"if" 						{token_print("T_IF"); return T_IF;}
"then" 					    {token_print("T_THEN"); return T_THEN;}
"else" 					    {token_print("T_ELSE"); return T_ELSE;}
"printf" 					{token_print("T_PRINTF"); return T_PRINTF;}
"fprintf" 					{token_print("T_PRINTF"); return T_FPRINTF;}
"while" 					{token_print("T_WHILE"); return T_WHILE;}
"int" 						{token_print("T_INT"); return T_INT;}
"fopen"                     {token_print("T_FOPEN"); return T_FOPEN;}
"fclose"                    {token_print("T_FCLOSE"); return T_FCLOSE;}
"scanf"                    {token_print("T_SCANF"); return T_SCANF;}

"(" 						{token_print("T_LPAREN"); return T_LPAREN;}
")" 						{token_print("T_RPAREN"); return T_RPAREN;}
"{" 						{token_print("T_LBRACE"); return T_LBRACE;}
"}" 						{token_print("T_RBRACE"); return T_RBRACE;}
";" 						{token_print("T_SEMICOLON"); return T_SEMICOLON;}
"," 						{token_print("T_COMMA"); return T_COMMA;}
"\""						{token_print("T_QMARK"); return T_QMARK;}
"=" 						{token_print("T_ASSIGN"); return T_ASSIGN;}
"<" 						{token_print("T_LESS"); return T_LESS;}
">" 						{token_print("T_GREATER"); return T_GREATER;}
"++" 						{token_print("T_INCREMENT");return T_INCREMENT;}
"-" 						{token_print("T_MINUS"); return T_MINUS;}
"+" 						{token_print("T_PLUS");return T_PLUS;}
"*" 						{token_print("T_MULTIPLY"); return T_MULTIPLY;}
"/" 						{token_print("T_DIV"); return T_DIV;}
"%"						    {token_print("T_MOD"); return T_MOD;}


"return" 					{token_print("T_RETURN");}
"<".+">" 					{token_print("T_LIBRARY");}
"[" 						{token_print("T_LBRACKET");}
"]" 						{token_print("T_RBRACKET");}
"<<" 						{token_print("T_INSERTIONOP");}
":" 						{token_print("T_COLON");}

"\\n"						{token_print("T_NEWLINE");}
"=="						{token_print("T_EQ");}
"!="|"<>" 					{token_print("T_NOTEQ");}
"=>"|">=" 					{token_print("T_GEQ");}
"<="|"=<" 					{token_print("T_LEQ");}
".." 						{token_print("T_DOUBLEDOT");}
"--"						{token_print("T_DECREMENT");}
"&"						    {token_print("T_BINANDOP");}
"|"						    {token_print("T_BINOROP");}
"&&"					  	{token_print("T_LOGANDOP");}
"||"						{token_print("T_LOGOROP");}
"!"						    {token_print("T_LOGNOTOP");}




[/][*][^*]*[*]+([^*/][^*]*[*]+)*[/]    	/*Comment Pollaplwn Seirwn*/
"//".* 					    /* Comment mias seiras */
[/][*]  					{token_print("T_UNTERMINATEDCOMMENT");} 
[ \n\t\r]+ 					/* Kena */

{float}                     {token_print("T_FLOAT_NUMBER");}
{digit} 				 	{token_print("T_DIGIT"); yylval.intval = atoi(yytext); return T_DIGIT;}  
{id} 					    {token_print("T_IDENTIFIER"); yylval.strval = strdup(yytext); return T_IDENTIFIER;}
. 						     printf( "Unrecognizedcharacter: %s\n", yytext);

%%
void token_print(char *token_type)
{
	fprintf(yyout,"%s\t%s, L:%d\n", yytext, token_type, yylineno);
}

void yyerror(char *message)
{
	printf("[Error in line %d] %s\n", yylineno, message);
}
