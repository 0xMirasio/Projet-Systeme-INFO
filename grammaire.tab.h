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

#ifndef YY_YY_GRAMMAIRE_TAB_H_INCLUDED
# define YY_YY_GRAMMAIRE_TAB_H_INCLUDED
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
    T_OPEN_BRAC = 258,             /* T_OPEN_BRAC  */
    T_CLOSE_BRAC = 259,            /* T_CLOSE_BRAC  */
    T_CONST_TYPE = 260,            /* T_CONST_TYPE  */
    T_INT_TYPE = 261,              /* T_INT_TYPE  */
    T_FLOAT_TYPE = 262,            /* T_FLOAT_TYPE  */
    T_DOUBLE_TYPE = 263,           /* T_DOUBLE_TYPE  */
    T_INT = 264,                   /* T_INT  */
    T_FLOAT = 265,                 /* T_FLOAT  */
    T_RETURN = 266,                /* T_RETURN  */
    T_ADD = 267,                   /* T_ADD  */
    T_SUB = 268,                   /* T_SUB  */
    T_MUL = 269,                   /* T_MUL  */
    T_DIV = 270,                   /* T_DIV  */
    T_EQUALS = 271,                /* T_EQUALS  */
    T_OPEN_PAR = 272,              /* T_OPEN_PAR  */
    T_CLOSE_PAR = 273,             /* T_CLOSE_PAR  */
    T_LOGICAL_SUP = 274,           /* T_LOGICAL_SUP  */
    T_LOGICAL_INF = 275,           /* T_LOGICAL_INF  */
    T_LOGICAL_AND = 276,           /* T_LOGICAL_AND  */
    T_LOGICAL_OR = 277,            /* T_LOGICAL_OR  */
    T_LOGICAL_SUP_EQ = 278,        /* T_LOGICAL_SUP_EQ  */
    T_LOGICAL_INF_EQ = 279,        /* T_LOGICAL_INF_EQ  */
    T_LOGICAL_EQ = 280,            /* T_LOGICAL_EQ  */
    T_LOGICAL_NEQ = 281,           /* T_LOGICAL_NEQ  */
    T_IF = 282,                    /* T_IF  */
    T_ELSE = 283,                  /* T_ELSE  */
    T_COMA = 284,                  /* T_COMA  */
    T_END_INSTRUCT = 285,          /* T_END_INSTRUCT  */
    T_PRINTF = 286,                /* T_PRINTF  */
    T_VARNAME = 287                /* T_VARNAME  */
  };
  typedef enum yytokentype yytoken_kind_t;
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
union YYSTYPE
{
#line 22 "grammaire.y"
int v1; double v2; char * v3; void * v4;

#line 99 "grammaire.tab.h"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_GRAMMAIRE_TAB_H_INCLUDED  */
