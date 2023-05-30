%{
#include <stdio.h>
#include <stdlib.h>
extern FILE *yyin;
extern FILE *yyout;
extern char *yytext;  
extern void yyerror();
extern int yylex();
extern void token_print(char *token_type);
%}

%union{
	int intval;
	char* strval;
}

%token<intval>	T_DIGIT
%token<strval>  T_IDENTIFIER	

%token 	        T_IF
%token		    T_THEN
%token		    T_ELSE
%token		    T_WHILE
%token		    T_FOR	

%token		    T_PRINTF	
%token          T_FPRINTF
%token          T_FOPEN
%token          T_FCLOSE
%token          T_SCANF

%token          T_VOID
%token 	        T_INT
%token 	        T_DOUBLE
%token 	        T_CHAR

%token		    T_RBRACE
%token		    T_LBRACE		
%token       	T_LPAREN		
%token 	        T_RPAREN		
%token 	        T_LESS			
%token       	T_GREATER			
	
%token 	        T_SEMICOLON
%token 	        T_COMMA

%token 	        T_EOF  0
%token		    T_PLUS
%token		    T_MINUS
%token 	        T_MULTIPLY
%token       	T_DIV
%token		    T_MOD
%token		    T_ASSIGN
%token		    T_INCREMENT
%token		    T_QMARK

%start program

%%
program
	: expr
	;

expr
	: function
	| if_else
	| digit
	| identifier
	| insert
	| expr expr
	;

digit
	: T_DIGIT
	| digit digit
	| digit operator digit
	;
operator
	: T_PLUS
	| T_MINUS
	| T_DIV
	| T_MULTIPLY
	| T_MOD
	| T_INCREMENT
	;	
	
boolean 
	: T_LESS
	| T_GREATER
	| T_ASSIGN
	;
identifier
	: T_IDENTIFIER
	;

insert
    : T_IDENTIFIER T_ASSIGN digit T_SEMICOLON
	{printf("A correct syntax inserting value to a variable\n");}
	| T_IDENTIFIER T_ASSIGN T_IDENTIFIER operator T_IDENTIFIER T_SEMICOLON
	{printf("A correct syntax inserting value of 2 variables after the operator praxis \n");}

function
	: T_INT identifier T_LPAREN T_RPAREN T_SEMICOLON
	{printf("A correct syntax of Function has found with return value INT\n");}
	| T_VOID identifier T_LPAREN T_RPAREN T_SEMICOLON
	{printf("A correct syntax of Function has found without return value\n");}
	| T_DOUBLE identifier T_LPAREN T_RPAREN T_SEMICOLON
	{printf("A correct syntax of Function has found with return of double\n");}
	| T_CHAR identifier T_LPAREN T_RPAREN T_SEMICOLON
	{printf("A correct syntax of Function has found with return of character\n");}
	;

if_statement
	: T_IF T_LPAREN identifier boolean digit T_RPAREN
	{printf("A correct syntax of if statement has found \n");}
	| if_statement T_LBRACE loop T_RBRACE
	{printf("A correct syntax of if statement has found with loop statement \n");}
	; 

if_else
	: if_statement
	| else_statement
	| if_else if_else
	;

else_statement
	: T_ELSE T_LBRACE loop T_RBRACE
	{printf("A correct syntax of else statement has found \n");}
	;	

loop	
    : for_loop
	| while_loop
	;

for_loop
	: T_FOR T_LPAREN identifier boolean digit T_SEMICOLON identifier boolean digit T_SEMICOLON T_INCREMENT identifier T_RPAREN
	| for_loop T_LBRACE scan T_RBRACE
	{printf("A correct syntax of for statment has found with scanf  \n");}
	| for_loop T_LBRACE file T_RBRACE
	{printf("A correct syntax of for statment has found with fopen or fclose  \n");}
	;
	
while_loop
	: T_WHILE T_LPAREN identifier boolean digit T_RPAREN
	| while_loop T_LBRACE print T_INCREMENT identifier T_SEMICOLON T_RBRACE 
	{printf("A correct syntax of while statment has found with printf\n");}
	| while_loop T_LBRACE file T_RBRACE 
	{printf("A correct syntax of while statment has found with fopen or fclose\n");}
	;	

print
	: T_PRINTF T_LPAREN T_QMARK identifier T_QMARK T_RPAREN T_SEMICOLON
	{printf("A correct syntax of printf has found  \n");}
	;

scan
    : T_SCANF T_LPAREN T_QMARK identifier T_QMARK T_RPAREN T_SEMICOLON
	{printf("A correct syntax of scanf has found  \n");}
	;

file
    :open
	|close
	;
open
    :T_FOPEN T_LPAREN T_QMARK identifier T_QMARK T_RPAREN T_SEMICOLON
	{printf("A correct syntax of fopen has found  \n");}
	;

close
    :T_FCLOSE T_LPAREN T_QMARK identifier T_QMARK T_RPAREN T_SEMICOLON
	{printf("A correct syntax of fclose has found  \n");}
	;


%%

int main(int argc,char *argv[])
{
	yyin= fopen(argv[1], "r");
	yyout= fopen("parsertest_pantazisdidos4601","w");
	yyparse();
	fclose(yyin);
	fclose(yyout);
	return 0;
}
