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
    TINT = 258,
    TCHAR = 259,
    TFLOAT = 260,
    TMAIN = 261,
    TPRINTF = 262,
    TFLOATNBR = 263,
    TNBR = 264,
    TVAR = 265,
    TPO = 266,
    TPF = 267,
    TMUL = 268,
    TDIV = 269,
    TMINUS = 270,
    TPLUS = 271,
    TSPACE = 272,
    TRET = 273,
    TENDOP = 274,
    TVIR = 275,
    TEQ = 276,
    TAcoDeb = 277,
    TAcoEnd = 278
  };
#endif
/* Tokens.  */
#define TINT 258
#define TCHAR 259
#define TFLOAT 260
#define TMAIN 261
#define TPRINTF 262
#define TFLOATNBR 263
#define TNBR 264
#define TVAR 265
#define TPO 266
#define TPF 267
#define TMUL 268
#define TDIV 269
#define TMINUS 270
#define TPLUS 271
#define TSPACE 272
#define TRET 273
#define TENDOP 274
#define TVIR 275
#define TEQ 276
#define TAcoDeb 277
#define TAcoEnd 278

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
