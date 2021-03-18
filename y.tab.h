/* A Bison parser, made by GNU Bison 3.7.5.  */

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
    YYEOF = 0,                     /* "end of file"  */
    YYerror = 256,                 /* error  */
    YYUNDEF = 257,                 /* "invalid token"  */
    TINT = 258,                    /* TINT  */
    TFLOAT = 259,                  /* TFLOAT  */
    TMAIN = 260,                   /* TMAIN  */
    TPRINTF = 261,                 /* TPRINTF  */
    TFLOATNBR = 262,               /* TFLOATNBR  */
    TNBR = 263,                    /* TNBR  */
    TVAR = 264,                    /* TVAR  */
    TPO = 265,                     /* TPO  */
    TPF = 266,                     /* TPF  */
    TMUL = 267,                    /* TMUL  */
    TIF = 268,                     /* TIF  */
    TELSE = 269,                   /* TELSE  */
    TDIV = 270,                    /* TDIV  */
    TMINUS = 271,                  /* TMINUS  */
    TPLUS = 272,                   /* TPLUS  */
    TENDOP = 273,                  /* TENDOP  */
    TEQ = 274,                     /* TEQ  */
    TAcoDeb = 275,                 /* TAcoDeb  */
    TRETURN = 276,                 /* TRETURN  */
    TAcoEnd = 277,                 /* TAcoEnd  */
    TCOMA = 278,                   /* TCOMA  */
    TLogicalAnd = 279,             /* TLogicalAnd  */
    TLogicalOr = 280,              /* TLogicalOr  */
    TLogicalInf = 281,             /* TLogicalInf  */
    TLogicalSup = 282,             /* TLogicalSup  */
    TLogicalSupEq = 283,           /* TLogicalSupEq  */
    TLogicalInfEq = 284,           /* TLogicalInfEq  */
    TLogicalEq = 285,              /* TLogicalEq  */
    TLogicalNorEq = 286,           /* TLogicalNorEq  */
    TADD = 287,                    /* TADD  */
    TSUB = 288                     /* TSUB  */
  };
  typedef enum yytokentype yytoken_kind_t;
#endif
/* Token kinds.  */
#define YYEMPTY -2
#define YYEOF 0
#define YYerror 256
#define YYUNDEF 257
#define TINT 258
#define TFLOAT 259
#define TMAIN 260
#define TPRINTF 261
#define TFLOATNBR 262
#define TNBR 263
#define TVAR 264
#define TPO 265
#define TPF 266
#define TMUL 267
#define TIF 268
#define TELSE 269
#define TDIV 270
#define TMINUS 271
#define TPLUS 272
#define TENDOP 273
#define TEQ 274
#define TAcoDeb 275
#define TRETURN 276
#define TAcoEnd 277
#define TCOMA 278
#define TLogicalAnd 279
#define TLogicalOr 280
#define TLogicalInf 281
#define TLogicalSup 282
#define TLogicalSupEq 283
#define TLogicalInfEq 284
#define TLogicalEq 285
#define TLogicalNorEq 286
#define TADD 287
#define TSUB 288

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
union YYSTYPE
{
#line 7 "grammaire.y"
int v1; double v2; char * v3;

#line 136 "y.tab.h"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
