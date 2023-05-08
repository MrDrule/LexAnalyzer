/* Periorismos enos mono arxeio san eisodo */
%option noyywrap

/* Count grammwn gia na gnwrizoyme se poia grammh einai oi kanones kai ekfraseis poy vrsikoyme */
%option yylineno

%{
    #include <stdio.h>
    int lineno = 1;
    void token_print(char *token_type);

%}

nzdigit[1-9]
digit(0|{nzdigit})
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

"printf" 					{token_print("T_PRINTF");}
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
"\\n"						{token_print("T_NEWLINE");}

[/][*][^*]*[*]+([^*/][^*]*[*]+)*[/]    	/*Comment Pollaplwn Seirwn*/
"//".* 					/* Comment mias seiras */
[/][*]  					{token_print("T_UNTERMINATEDCOMMENT");} 
[ \n\t\r]+ 					/* Kena */

{digit} 				 	{token_print("T_DIGIT"); }  
{id} 					    {token_print("T_IDENTIFIER");}
. 						    {printf( "T_UNRECOGNIZEDCHAR: %s\n", yytext);}

%%
void token_print(char *token_type)
{

	fprintf(yyout,"%s\t%s, L:%d\n", yytext, token_type, yylineno);
}
int main(int argc,char *argv[])
{
	yyin= fopen(argv[1], "r");
	yyout= fopen("test_pantazisdidos4601.txt","w");
	yylex();
	fclose(yyin);
	fclose(yyout);
	return 0;
}


