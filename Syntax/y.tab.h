/* A Bison parser, made by GNU Bison 3.8.2.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2021 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <https://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* DO NOT RELY ON FEATURES THAT ARE NOT DOCUMENTED in the manual,
   especially those whose name start with YY_ or yy_.  They are
   private implementation details that can be changed or removed.  */

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token kinds.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    YYEMPTY = -2,
    T_EOF = 0,                     /* T_EOF  */
    YYerror = 256,                 /* error  */
    YYUNDEF = 257,                 /* "invalid token"  */
    T_DIGIT = 258,                 /* T_DIGIT  */
    T_IDENTIFIER = 259,            /* T_IDENTIFIER  */
    T_IF = 260,                    /* T_IF  */
    T_THEN = 261,                  /* T_THEN  */
    T_ELSE = 262,                  /* T_ELSE  */
    T_WHILE = 263,                 /* T_WHILE  */
    T_FOR = 264,                   /* T_FOR  */
    T_PRINTF = 265,                /* T_PRINTF  */
    T_FPRINTF = 266,               /* T_FPRINTF  */
    T_FOPEN = 267,                 /* T_FOPEN  */
    T_FCLOSE = 268,                /* T_FCLOSE  */
    T_SCANF = 269,                 /* T_SCANF  */
    T_VOID = 270,                  /* T_VOID  */
    T_INT = 271,                   /* T_INT  */
    T_DOUBLE = 272,                /* T_DOUBLE  */
    T_CHAR = 273,                  /* T_CHAR  */
    T_RBRACE = 274,                /* T_RBRACE  */
    T_LBRACE = 275,                /* T_LBRACE  */
    T_LPAREN = 276,                /* T_LPAREN  */
    T_RPAREN = 277,                /* T_RPAREN  */
    T_LESS = 278,                  /* T_LESS  */
    T_GREATER = 279,               /* T_GREATER  */
    T_SEMICOLON = 280,             /* T_SEMICOLON  */
    T_COMMA = 281,                 /* T_COMMA  */
    T_PLUS = 282,                  /* T_PLUS  */
    T_MINUS = 283,                 /* T_MINUS  */
    T_MULTIPLY = 284,              /* T_MULTIPLY  */
    T_DIV = 285,                   /* T_DIV  */
    T_MOD = 286,                   /* T_MOD  */
    T_ASSIGN = 287,                /* T_ASSIGN  */
    T_INCREMENT = 288,             /* T_INCREMENT  */
    T_QMARK = 289                  /* T_QMARK  */
  };
  typedef enum yytokentype yytoken_kind_t;
#endif
/* Token kinds.  */
#define YYEMPTY -2
#define T_EOF 0
#define YYerror 256
#define YYUNDEF 257
#define T_DIGIT 258
#define T_IDENTIFIER 259
#define T_IF 260
#define T_THEN 261
#define T_ELSE 262
#define T_WHILE 263
#define T_FOR 264
#define T_PRINTF 265
#define T_FPRINTF 266
#define T_FOPEN 267
#define T_FCLOSE 268
#define T_SCANF 269
#define T_VOID 270
#define T_INT 271
#define T_DOUBLE 272
#define T_CHAR 273
#define T_RBRACE 274
#define T_LBRACE 275
#define T_LPAREN 276
#define T_RPAREN 277
#define T_LESS 278
#define T_GREATER 279
#define T_SEMICOLON 280
#define T_COMMA 281
#define T_PLUS 282
#define T_MINUS 283
#define T_MULTIPLY 284
#define T_DIV 285
#define T_MOD 286
#define T_ASSIGN 287
#define T_INCREMENT 288
#define T_QMARK 289

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
union YYSTYPE
{
#line 12 "parser.y"

	int intval;
	char* strval;

#line 140 "y.tab.h"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;


int yyparse (void);


#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
