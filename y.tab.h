/* A Bison parser, made by GNU Bison 3.0.4.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

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

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    T_OPEN_BRAC = 258,
    T_CLOSE_BRAC = 259,
    T_CONST_TYPE = 260,
    T_INT_TYPE = 261,
    T_FLOAT_TYPE = 262,
    T_DOUBLE_TYPE = 263,
    T_INT = 264,
    T_FLOAT = 265,
    T_RETURN = 266,
    T_ADD = 267,
    T_SUB = 268,
    T_MUL = 269,
    T_DIV = 270,
    T_EQUALS = 271,
    T_OPEN_PAR = 272,
    T_CLOSE_PAR = 273,
    T_LOGICAL_SUP = 274,
    T_LOGICAL_INF = 275,
    T_LOGICAL_AND = 276,
    T_LOGICAL_OR = 277,
    T_LOGICAL_SUP_EQ = 278,
    T_LOGICAL_INF_EQ = 279,
    T_LOGICAL_EQ = 280,
    T_LOGICAL_NEQ = 281,
    T_IF = 282,
    T_ELSE = 283,
    T_COMA = 284,
    T_END_INSTRUCT = 285,
    T_PRINTF = 286,
    T_VARNAME = 287
  };
#endif
/* Tokens.  */
#define T_OPEN_BRAC 258
#define T_CLOSE_BRAC 259
#define T_CONST_TYPE 260
#define T_INT_TYPE 261
#define T_FLOAT_TYPE 262
#define T_DOUBLE_TYPE 263
#define T_INT 264
#define T_FLOAT 265
#define T_RETURN 266
#define T_ADD 267
#define T_SUB 268
#define T_MUL 269
#define T_DIV 270
#define T_EQUALS 271
#define T_OPEN_PAR 272
#define T_CLOSE_PAR 273
#define T_LOGICAL_SUP 274
#define T_LOGICAL_INF 275
#define T_LOGICAL_AND 276
#define T_LOGICAL_OR 277
#define T_LOGICAL_SUP_EQ 278
#define T_LOGICAL_INF_EQ 279
#define T_LOGICAL_EQ 280
#define T_LOGICAL_NEQ 281
#define T_IF 282
#define T_ELSE 283
#define T_COMA 284
#define T_END_INSTRUCT 285
#define T_PRINTF 286
#define T_VARNAME 287

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED

union YYSTYPE
{
#line 21 "grammaire.y" /* yacc.c:1909  */
int v1; double v2; char * v3;

#line 121 "y.tab.h" /* yacc.c:1909  */
};

typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
