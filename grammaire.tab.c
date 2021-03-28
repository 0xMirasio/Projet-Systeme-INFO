/* A Bison parser, made by GNU Bison 3.7.5.  */

/* Bison implementation for Yacc-like parsers in C

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

/* C LALR(1) parser skeleton written by Richard Stallman, by
   simplifying the original so-called "semantic" parser.  */

/* DO NOT RELY ON FEATURES THAT ARE NOT DOCUMENTED in the manual,
   especially those whose name start with YY_ or yy_.  They are
   private implementation details that can be changed or removed.  */

/* All symbols defined below should begin with yy or YY, to avoid
   infringing on user name space.  This should be done even for local
   variables, as they might otherwise be expanded by user macros.
   There are some unavoidable exceptions within include files to
   define necessary library symbols; they are noted "INFRINGES ON
   USER NAME SPACE" below.  */

/* Identify Bison output, and Bison version.  */
#define YYBISON 30705

/* Bison version string.  */
#define YYBISON_VERSION "3.7.5"

/* Skeleton name.  */
#define YYSKELETON_NAME "yacc.c"

/* Pure parsers.  */
#define YYPURE 0

/* Push parsers.  */
#define YYPUSH 0

/* Pull parsers.  */
#define YYPULL 1




/* First part of user prologue.  */
#line 1 "grammaire.y"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "symbol_table.h"
#include "util.h"
#include "opTable.h"
#include "memory_z.h"

#define MAX_MEMORY_SIZE 100

int global_depth = 0;
int global_pointer_INT = 0;
int global_pointer_DOUBLE = 0;
Symbol_table * head_table; 
headMZ * mem;
int * memory_zone_INT;
int * memory_zone_DOUBLE;


#line 92 "grammaire.tab.c"

# ifndef YY_CAST
#  ifdef __cplusplus
#   define YY_CAST(Type, Val) static_cast<Type> (Val)
#   define YY_REINTERPRET_CAST(Type, Val) reinterpret_cast<Type> (Val)
#  else
#   define YY_CAST(Type, Val) ((Type) (Val))
#   define YY_REINTERPRET_CAST(Type, Val) ((Type) (Val))
#  endif
# endif
# ifndef YY_NULLPTR
#  if defined __cplusplus
#   if 201103L <= __cplusplus
#    define YY_NULLPTR nullptr
#   else
#    define YY_NULLPTR 0
#   endif
#  else
#   define YY_NULLPTR ((void*)0)
#  endif
# endif


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

#line 174 "grammaire.tab.c"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);


/* Symbol kind.  */
enum yysymbol_kind_t
{
  YYSYMBOL_YYEMPTY = -2,
  YYSYMBOL_YYEOF = 0,                      /* "end of file"  */
  YYSYMBOL_YYerror = 1,                    /* error  */
  YYSYMBOL_YYUNDEF = 2,                    /* "invalid token"  */
  YYSYMBOL_T_OPEN_BRAC = 3,                /* T_OPEN_BRAC  */
  YYSYMBOL_T_CLOSE_BRAC = 4,               /* T_CLOSE_BRAC  */
  YYSYMBOL_T_CONST_TYPE = 5,               /* T_CONST_TYPE  */
  YYSYMBOL_T_INT_TYPE = 6,                 /* T_INT_TYPE  */
  YYSYMBOL_T_FLOAT_TYPE = 7,               /* T_FLOAT_TYPE  */
  YYSYMBOL_T_DOUBLE_TYPE = 8,              /* T_DOUBLE_TYPE  */
  YYSYMBOL_T_INT = 9,                      /* T_INT  */
  YYSYMBOL_T_FLOAT = 10,                   /* T_FLOAT  */
  YYSYMBOL_T_RETURN = 11,                  /* T_RETURN  */
  YYSYMBOL_T_ADD = 12,                     /* T_ADD  */
  YYSYMBOL_T_SUB = 13,                     /* T_SUB  */
  YYSYMBOL_T_MUL = 14,                     /* T_MUL  */
  YYSYMBOL_T_DIV = 15,                     /* T_DIV  */
  YYSYMBOL_T_EQUALS = 16,                  /* T_EQUALS  */
  YYSYMBOL_T_OPEN_PAR = 17,                /* T_OPEN_PAR  */
  YYSYMBOL_T_CLOSE_PAR = 18,               /* T_CLOSE_PAR  */
  YYSYMBOL_T_LOGICAL_SUP = 19,             /* T_LOGICAL_SUP  */
  YYSYMBOL_T_LOGICAL_INF = 20,             /* T_LOGICAL_INF  */
  YYSYMBOL_T_LOGICAL_AND = 21,             /* T_LOGICAL_AND  */
  YYSYMBOL_T_LOGICAL_OR = 22,              /* T_LOGICAL_OR  */
  YYSYMBOL_T_LOGICAL_SUP_EQ = 23,          /* T_LOGICAL_SUP_EQ  */
  YYSYMBOL_T_LOGICAL_INF_EQ = 24,          /* T_LOGICAL_INF_EQ  */
  YYSYMBOL_T_LOGICAL_EQ = 25,              /* T_LOGICAL_EQ  */
  YYSYMBOL_T_LOGICAL_NEQ = 26,             /* T_LOGICAL_NEQ  */
  YYSYMBOL_T_IF = 27,                      /* T_IF  */
  YYSYMBOL_T_ELSE = 28,                    /* T_ELSE  */
  YYSYMBOL_T_COMA = 29,                    /* T_COMA  */
  YYSYMBOL_T_END_INSTRUCT = 30,            /* T_END_INSTRUCT  */
  YYSYMBOL_T_PRINTF = 31,                  /* T_PRINTF  */
  YYSYMBOL_T_VARNAME = 32,                 /* T_VARNAME  */
  YYSYMBOL_YYACCEPT = 33,                  /* $accept  */
  YYSYMBOL_DEBUT = 34,                     /* DEBUT  */
  YYSYMBOL_35_1 = 35,                      /* $@1  */
  YYSYMBOL_FUNCTIONS = 36,                 /* FUNCTIONS  */
  YYSYMBOL_CORPS = 37,                     /* CORPS  */
  YYSYMBOL_38_2 = 38,                      /* $@2  */
  YYSYMBOL_INSTRUCTIONS = 39,              /* INSTRUCTIONS  */
  YYSYMBOL_INSTRUCTION = 40,               /* INSTRUCTION  */
  YYSYMBOL_RETURN = 41,                    /* RETURN  */
  YYSYMBOL_DECLARATION = 42,               /* DECLARATION  */
  YYSYMBOL_SUITE_DECLARATION = 43,         /* SUITE_DECLARATION  */
  YYSYMBOL_AFFECTATION = 44,               /* AFFECTATION  */
  YYSYMBOL_VAR_TYPE = 45,                  /* VAR_TYPE  */
  YYSYMBOL_DECLARE_FUNCTION = 46,          /* DECLARE_FUNCTION  */
  YYSYMBOL_DECLARE_PARAMETERS = 47,        /* DECLARE_PARAMETERS  */
  YYSYMBOL_DECLARE_PARAMETER = 48,         /* DECLARE_PARAMETER  */
  YYSYMBOL_DECLARE_SUITEPARAM = 49,        /* DECLARE_SUITEPARAM  */
  YYSYMBOL_CALL_FUNCTION = 50,             /* CALL_FUNCTION  */
  YYSYMBOL_CALL_PARAMETERS = 51,           /* CALL_PARAMETERS  */
  YYSYMBOL_CALL_PARAMETER = 52,            /* CALL_PARAMETER  */
  YYSYMBOL_CALL_SUITEPARAM = 53,           /* CALL_SUITEPARAM  */
  YYSYMBOL_EXPR = 54,                      /* EXPR  */
  YYSYMBOL_NUMBER = 55,                    /* NUMBER  */
  YYSYMBOL_CONDITION = 56,                 /* CONDITION  */
  YYSYMBOL_IF = 57,                        /* IF  */
  YYSYMBOL_SUITE_IF = 58                   /* SUITE_IF  */
};
typedef enum yysymbol_kind_t yysymbol_kind_t;




#ifdef short
# undef short
#endif

/* On compilers that do not define __PTRDIFF_MAX__ etc., make sure
   <limits.h> and (if available) <stdint.h> are included
   so that the code can choose integer types of a good width.  */

#ifndef __PTRDIFF_MAX__
# include <limits.h> /* INFRINGES ON USER NAME SPACE */
# if defined __STDC_VERSION__ && 199901 <= __STDC_VERSION__
#  include <stdint.h> /* INFRINGES ON USER NAME SPACE */
#  define YY_STDINT_H
# endif
#endif

/* Narrow types that promote to a signed type and that can represent a
   signed or unsigned integer of at least N bits.  In tables they can
   save space and decrease cache pressure.  Promoting to a signed type
   helps avoid bugs in integer arithmetic.  */

#ifdef __INT_LEAST8_MAX__
typedef __INT_LEAST8_TYPE__ yytype_int8;
#elif defined YY_STDINT_H
typedef int_least8_t yytype_int8;
#else
typedef signed char yytype_int8;
#endif

#ifdef __INT_LEAST16_MAX__
typedef __INT_LEAST16_TYPE__ yytype_int16;
#elif defined YY_STDINT_H
typedef int_least16_t yytype_int16;
#else
typedef short yytype_int16;
#endif

/* Work around bug in HP-UX 11.23, which defines these macros
   incorrectly for preprocessor constants.  This workaround can likely
   be removed in 2023, as HPE has promised support for HP-UX 11.23
   (aka HP-UX 11i v2) only through the end of 2022; see Table 2 of
   <https://h20195.www2.hpe.com/V2/getpdf.aspx/4AA4-7673ENW.pdf>.  */
#ifdef __hpux
# undef UINT_LEAST8_MAX
# undef UINT_LEAST16_MAX
# define UINT_LEAST8_MAX 255
# define UINT_LEAST16_MAX 65535
#endif

#if defined __UINT_LEAST8_MAX__ && __UINT_LEAST8_MAX__ <= __INT_MAX__
typedef __UINT_LEAST8_TYPE__ yytype_uint8;
#elif (!defined __UINT_LEAST8_MAX__ && defined YY_STDINT_H \
       && UINT_LEAST8_MAX <= INT_MAX)
typedef uint_least8_t yytype_uint8;
#elif !defined __UINT_LEAST8_MAX__ && UCHAR_MAX <= INT_MAX
typedef unsigned char yytype_uint8;
#else
typedef short yytype_uint8;
#endif

#if defined __UINT_LEAST16_MAX__ && __UINT_LEAST16_MAX__ <= __INT_MAX__
typedef __UINT_LEAST16_TYPE__ yytype_uint16;
#elif (!defined __UINT_LEAST16_MAX__ && defined YY_STDINT_H \
       && UINT_LEAST16_MAX <= INT_MAX)
typedef uint_least16_t yytype_uint16;
#elif !defined __UINT_LEAST16_MAX__ && USHRT_MAX <= INT_MAX
typedef unsigned short yytype_uint16;
#else
typedef int yytype_uint16;
#endif

#ifndef YYPTRDIFF_T
# if defined __PTRDIFF_TYPE__ && defined __PTRDIFF_MAX__
#  define YYPTRDIFF_T __PTRDIFF_TYPE__
#  define YYPTRDIFF_MAXIMUM __PTRDIFF_MAX__
# elif defined PTRDIFF_MAX
#  ifndef ptrdiff_t
#   include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  endif
#  define YYPTRDIFF_T ptrdiff_t
#  define YYPTRDIFF_MAXIMUM PTRDIFF_MAX
# else
#  define YYPTRDIFF_T long
#  define YYPTRDIFF_MAXIMUM LONG_MAX
# endif
#endif

#ifndef YYSIZE_T
# ifdef __SIZE_TYPE__
#  define YYSIZE_T __SIZE_TYPE__
# elif defined size_t
#  define YYSIZE_T size_t
# elif defined __STDC_VERSION__ && 199901 <= __STDC_VERSION__
#  include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  define YYSIZE_T size_t
# else
#  define YYSIZE_T unsigned
# endif
#endif

#define YYSIZE_MAXIMUM                                  \
  YY_CAST (YYPTRDIFF_T,                                 \
           (YYPTRDIFF_MAXIMUM < YY_CAST (YYSIZE_T, -1)  \
            ? YYPTRDIFF_MAXIMUM                         \
            : YY_CAST (YYSIZE_T, -1)))

#define YYSIZEOF(X) YY_CAST (YYPTRDIFF_T, sizeof (X))


/* Stored state numbers (used for stacks). */
typedef yytype_int8 yy_state_t;

/* State numbers in computations.  */
typedef int yy_state_fast_t;

#ifndef YY_
# if defined YYENABLE_NLS && YYENABLE_NLS
#  if ENABLE_NLS
#   include <libintl.h> /* INFRINGES ON USER NAME SPACE */
#   define YY_(Msgid) dgettext ("bison-runtime", Msgid)
#  endif
# endif
# ifndef YY_
#  define YY_(Msgid) Msgid
# endif
#endif


#ifndef YY_ATTRIBUTE_PURE
# if defined __GNUC__ && 2 < __GNUC__ + (96 <= __GNUC_MINOR__)
#  define YY_ATTRIBUTE_PURE __attribute__ ((__pure__))
# else
#  define YY_ATTRIBUTE_PURE
# endif
#endif

#ifndef YY_ATTRIBUTE_UNUSED
# if defined __GNUC__ && 2 < __GNUC__ + (7 <= __GNUC_MINOR__)
#  define YY_ATTRIBUTE_UNUSED __attribute__ ((__unused__))
# else
#  define YY_ATTRIBUTE_UNUSED
# endif
#endif

/* Suppress unused-variable warnings by "using" E.  */
#if ! defined lint || defined __GNUC__
# define YY_USE(E) ((void) (E))
#else
# define YY_USE(E) /* empty */
#endif

#if defined __GNUC__ && ! defined __ICC && 407 <= __GNUC__ * 100 + __GNUC_MINOR__
/* Suppress an incorrect diagnostic about yylval being uninitialized.  */
# define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN                            \
    _Pragma ("GCC diagnostic push")                                     \
    _Pragma ("GCC diagnostic ignored \"-Wuninitialized\"")              \
    _Pragma ("GCC diagnostic ignored \"-Wmaybe-uninitialized\"")
# define YY_IGNORE_MAYBE_UNINITIALIZED_END      \
    _Pragma ("GCC diagnostic pop")
#else
# define YY_INITIAL_VALUE(Value) Value
#endif
#ifndef YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
# define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
# define YY_IGNORE_MAYBE_UNINITIALIZED_END
#endif
#ifndef YY_INITIAL_VALUE
# define YY_INITIAL_VALUE(Value) /* Nothing. */
#endif

#if defined __cplusplus && defined __GNUC__ && ! defined __ICC && 6 <= __GNUC__
# define YY_IGNORE_USELESS_CAST_BEGIN                          \
    _Pragma ("GCC diagnostic push")                            \
    _Pragma ("GCC diagnostic ignored \"-Wuseless-cast\"")
# define YY_IGNORE_USELESS_CAST_END            \
    _Pragma ("GCC diagnostic pop")
#endif
#ifndef YY_IGNORE_USELESS_CAST_BEGIN
# define YY_IGNORE_USELESS_CAST_BEGIN
# define YY_IGNORE_USELESS_CAST_END
#endif


#define YY_ASSERT(E) ((void) (0 && (E)))

#if !defined yyoverflow

/* The parser invokes alloca or malloc; define the necessary symbols.  */

# ifdef YYSTACK_USE_ALLOCA
#  if YYSTACK_USE_ALLOCA
#   ifdef __GNUC__
#    define YYSTACK_ALLOC __builtin_alloca
#   elif defined __BUILTIN_VA_ARG_INCR
#    include <alloca.h> /* INFRINGES ON USER NAME SPACE */
#   elif defined _AIX
#    define YYSTACK_ALLOC __alloca
#   elif defined _MSC_VER
#    include <malloc.h> /* INFRINGES ON USER NAME SPACE */
#    define alloca _alloca
#   else
#    define YYSTACK_ALLOC alloca
#    if ! defined _ALLOCA_H && ! defined EXIT_SUCCESS
#     include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
      /* Use EXIT_SUCCESS as a witness for stdlib.h.  */
#     ifndef EXIT_SUCCESS
#      define EXIT_SUCCESS 0
#     endif
#    endif
#   endif
#  endif
# endif

# ifdef YYSTACK_ALLOC
   /* Pacify GCC's 'empty if-body' warning.  */
#  define YYSTACK_FREE(Ptr) do { /* empty */; } while (0)
#  ifndef YYSTACK_ALLOC_MAXIMUM
    /* The OS might guarantee only one guard page at the bottom of the stack,
       and a page size can be as small as 4096 bytes.  So we cannot safely
       invoke alloca (N) if N exceeds 4096.  Use a slightly smaller number
       to allow for a few compiler-allocated temporary stack slots.  */
#   define YYSTACK_ALLOC_MAXIMUM 4032 /* reasonable circa 2006 */
#  endif
# else
#  define YYSTACK_ALLOC YYMALLOC
#  define YYSTACK_FREE YYFREE
#  ifndef YYSTACK_ALLOC_MAXIMUM
#   define YYSTACK_ALLOC_MAXIMUM YYSIZE_MAXIMUM
#  endif
#  if (defined __cplusplus && ! defined EXIT_SUCCESS \
       && ! ((defined YYMALLOC || defined malloc) \
             && (defined YYFREE || defined free)))
#   include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#   ifndef EXIT_SUCCESS
#    define EXIT_SUCCESS 0
#   endif
#  endif
#  ifndef YYMALLOC
#   define YYMALLOC malloc
#   if ! defined malloc && ! defined EXIT_SUCCESS
void *malloc (YYSIZE_T); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
#  ifndef YYFREE
#   define YYFREE free
#   if ! defined free && ! defined EXIT_SUCCESS
void free (void *); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
# endif
#endif /* !defined yyoverflow */

#if (! defined yyoverflow \
     && (! defined __cplusplus \
         || (defined YYSTYPE_IS_TRIVIAL && YYSTYPE_IS_TRIVIAL)))

/* A type that is properly aligned for any stack member.  */
union yyalloc
{
  yy_state_t yyss_alloc;
  YYSTYPE yyvs_alloc;
};

/* The size of the maximum gap between one aligned stack and the next.  */
# define YYSTACK_GAP_MAXIMUM (YYSIZEOF (union yyalloc) - 1)

/* The size of an array large to enough to hold all stacks, each with
   N elements.  */
# define YYSTACK_BYTES(N) \
     ((N) * (YYSIZEOF (yy_state_t) + YYSIZEOF (YYSTYPE)) \
      + YYSTACK_GAP_MAXIMUM)

# define YYCOPY_NEEDED 1

/* Relocate STACK from its old location to the new one.  The
   local variables YYSIZE and YYSTACKSIZE give the old and new number of
   elements in the stack, and YYPTR gives the new location of the
   stack.  Advance YYPTR to a properly aligned location for the next
   stack.  */
# define YYSTACK_RELOCATE(Stack_alloc, Stack)                           \
    do                                                                  \
      {                                                                 \
        YYPTRDIFF_T yynewbytes;                                         \
        YYCOPY (&yyptr->Stack_alloc, Stack, yysize);                    \
        Stack = &yyptr->Stack_alloc;                                    \
        yynewbytes = yystacksize * YYSIZEOF (*Stack) + YYSTACK_GAP_MAXIMUM; \
        yyptr += yynewbytes / YYSIZEOF (*yyptr);                        \
      }                                                                 \
    while (0)

#endif

#if defined YYCOPY_NEEDED && YYCOPY_NEEDED
/* Copy COUNT objects from SRC to DST.  The source and destination do
   not overlap.  */
# ifndef YYCOPY
#  if defined __GNUC__ && 1 < __GNUC__
#   define YYCOPY(Dst, Src, Count) \
      __builtin_memcpy (Dst, Src, YY_CAST (YYSIZE_T, (Count)) * sizeof (*(Src)))
#  else
#   define YYCOPY(Dst, Src, Count)              \
      do                                        \
        {                                       \
          YYPTRDIFF_T yyi;                      \
          for (yyi = 0; yyi < (Count); yyi++)   \
            (Dst)[yyi] = (Src)[yyi];            \
        }                                       \
      while (0)
#  endif
# endif
#endif /* !YYCOPY_NEEDED */

/* YYFINAL -- State number of the termination state.  */
#define YYFINAL  3
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   142

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  33
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  26
/* YYNRULES -- Number of rules.  */
#define YYNRULES  63
/* YYNSTATES -- Number of states.  */
#define YYNSTATES  114

/* YYMAXUTOK -- Last valid token kind.  */
#define YYMAXUTOK   287


/* YYTRANSLATE(TOKEN-NUM) -- Symbol number corresponding to TOKEN-NUM
   as returned by yylex, with out-of-bounds checking.  */
#define YYTRANSLATE(YYX)                                \
  (0 <= (YYX) && (YYX) <= YYMAXUTOK                     \
   ? YY_CAST (yysymbol_kind_t, yytranslate[YYX])        \
   : YYSYMBOL_YYUNDEF)

/* YYTRANSLATE[TOKEN-NUM] -- Symbol number corresponding to TOKEN-NUM
   as returned by yylex.  */
static const yytype_int8 yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     1,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    28,    29,    30,    31,    32
};

#if YYDEBUG
  /* YYRLINE[YYN] -- Source line where rule number YYN was defined.  */
static const yytype_uint8 yyrline[] =
{
       0,    56,    56,    56,    77,    78,    81,    81,    84,    85,
      88,    89,    90,    91,    92,    93,    96,    99,   119,   139,
     140,   141,   144,   147,   148,   149,   154,   157,   158,   161,
     164,   165,   170,   173,   174,   176,   179,   180,   185,   186,
     187,   188,   189,   190,   191,   192,   197,   200,   207,   208,
     209,   210,   211,   212,   213,   214,   215,   216,   217,   218,
     224,   227,   228,   229
};
#endif

/** Accessing symbol of state STATE.  */
#define YY_ACCESSING_SYMBOL(State) YY_CAST (yysymbol_kind_t, yystos[State])

#if YYDEBUG || 0
/* The user-facing name of the symbol whose (internal) number is
   YYSYMBOL.  No bounds checking.  */
static const char *yysymbol_name (yysymbol_kind_t yysymbol) YY_ATTRIBUTE_UNUSED;

/* YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals.  */
static const char *const yytname[] =
{
  "\"end of file\"", "error", "\"invalid token\"", "T_OPEN_BRAC",
  "T_CLOSE_BRAC", "T_CONST_TYPE", "T_INT_TYPE", "T_FLOAT_TYPE",
  "T_DOUBLE_TYPE", "T_INT", "T_FLOAT", "T_RETURN", "T_ADD", "T_SUB",
  "T_MUL", "T_DIV", "T_EQUALS", "T_OPEN_PAR", "T_CLOSE_PAR",
  "T_LOGICAL_SUP", "T_LOGICAL_INF", "T_LOGICAL_AND", "T_LOGICAL_OR",
  "T_LOGICAL_SUP_EQ", "T_LOGICAL_INF_EQ", "T_LOGICAL_EQ", "T_LOGICAL_NEQ",
  "T_IF", "T_ELSE", "T_COMA", "T_END_INSTRUCT", "T_PRINTF", "T_VARNAME",
  "$accept", "DEBUT", "$@1", "FUNCTIONS", "CORPS", "$@2", "INSTRUCTIONS",
  "INSTRUCTION", "RETURN", "DECLARATION", "SUITE_DECLARATION",
  "AFFECTATION", "VAR_TYPE", "DECLARE_FUNCTION", "DECLARE_PARAMETERS",
  "DECLARE_PARAMETER", "DECLARE_SUITEPARAM", "CALL_FUNCTION",
  "CALL_PARAMETERS", "CALL_PARAMETER", "CALL_SUITEPARAM", "EXPR", "NUMBER",
  "CONDITION", "IF", "SUITE_IF", YY_NULLPTR
};

static const char *
yysymbol_name (yysymbol_kind_t yysymbol)
{
  return yytname[yysymbol];
}
#endif

#ifdef YYPRINT
/* YYTOKNUM[NUM] -- (External) token number corresponding to the
   (internal) symbol number NUM (which must be that of a token).  */
static const yytype_int16 yytoknum[] =
{
       0,   256,   257,   258,   259,   260,   261,   262,   263,   264,
     265,   266,   267,   268,   269,   270,   271,   272,   273,   274,
     275,   276,   277,   278,   279,   280,   281,   282,   283,   284,
     285,   286,   287
};
#endif

#define YYPACT_NINF (-56)

#define yypact_value_is_default(Yyn) \
  ((Yyn) == YYPACT_NINF)

#define YYTABLE_NINF (-1)

#define yytable_value_is_error(Yyn) \
  0

  /* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
     STATE-NUM.  */
static const yytype_int8 yypact[] =
{
     -56,    13,    59,   -56,   -56,   -56,   -56,   -56,    -9,    59,
       4,   -56,    59,     3,    35,    25,   -56,    39,    59,   -56,
     -56,   -56,    25,     9,   -56,     2,    47,    48,   -10,    51,
       9,    52,    53,    55,    64,    57,   -56,   -56,   -56,     2,
      80,   -56,   115,   -56,    67,   -56,   -56,    49,   -56,     2,
      79,   -56,   -56,   -56,   -56,   -56,   -11,    83,   -56,   105,
       2,     2,     2,     2,    65,   106,    82,    47,    47,    47,
      47,    47,    47,    47,    47,   103,   115,   -56,   114,   104,
     107,   -56,   -56,   -56,    24,    24,   -56,   -56,   -56,   -56,
     -56,   -56,    90,    69,   -56,   -56,   102,   102,     6,   -56,
     -56,    79,   -56,   -11,    83,    47,   -56,   104,   -56,   -56,
      49,   -56,   103,   -56
};

  /* YYDEFACT[STATE-NUM] -- Default reduction number in state STATE-NUM.
     Performed when YYTABLE does not specify something else to do.  Zero
     means the default is an error.  */
static const yytype_int8 yydefact[] =
{
       2,     0,     5,     1,    25,    23,    24,     3,     0,     5,
       0,     4,    28,     0,     0,    31,    29,     0,     0,    27,
       6,    26,    31,     9,    30,     0,     0,     0,     0,     0,
       9,     0,     0,     0,     0,     0,    13,    46,    47,     0,
      43,    44,    16,    45,     0,    58,    59,     0,    14,     0,
      34,     7,     8,    15,    10,    11,    21,    21,    12,     0,
       0,     0,     0,     0,    58,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    63,    22,    35,     0,    37,
       0,    17,    18,    42,    38,    39,    40,    41,    57,    56,
      54,    55,    48,    49,    52,    53,    50,    51,     0,    60,
      32,     0,    33,    21,    21,     0,    62,    37,    19,    20,
       0,    36,    63,    61
};

  /* YYPGOTO[NTERM-NUM].  */
static const yytype_int8 yypgoto[] =
{
     -56,   -56,   -56,   125,   -47,   -56,   108,   -56,   -56,   -56,
     -55,   -30,    68,   -56,   -56,   117,   118,   -20,   -56,    36,
      29,    -2,   -17,   -43,   -56,    30
};

  /* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int8 yydefgoto[] =
{
       0,     1,     2,     7,    21,    23,    29,    30,    31,    32,
      81,    33,     8,     9,    14,    15,    19,    41,    78,    79,
     102,    42,    46,    47,    36,    99
};

  /* YYTABLE[YYPACT[STATE-NUM]] -- What to do in state STATE-NUM.  If
     positive, shift that token.  If negative, reduce the rule whose
     number is the opposite.  If YYTABLE_NINF, syntax error.  */
static const yytype_int8 yytable[] =
{
      75,    66,    82,    35,    57,    49,    49,    50,    43,    20,
      35,    37,    38,     3,    65,     4,     5,     6,    80,    39,
      25,    12,    43,    10,    90,    91,    92,    93,    94,    95,
      96,    97,    43,   105,    40,    16,    26,    59,    62,    63,
      27,    28,    20,    43,    43,    43,    43,    76,   108,   109,
     104,   106,    20,    17,    18,    51,    37,    38,    84,    85,
      86,    87,   110,   112,    44,     4,     5,     6,    67,    68,
      69,    70,    71,    72,    73,    74,    37,    38,    48,    45,
      13,    49,    53,    54,    44,    55,    13,    58,    67,    68,
      69,    34,    71,    72,    73,    74,    56,    50,    34,    64,
      89,    67,    68,    69,    70,    71,    72,    73,    74,    67,
      68,    77,    80,    71,    72,    73,    74,    60,    61,    62,
      63,    67,    68,    83,    88,    71,    72,    60,    61,    62,
      63,    98,   100,   101,    11,    22,   111,   107,    52,   103,
      24,     0,   113
};

static const yytype_int8 yycheck[] =
{
      47,    44,    57,    23,    34,    16,    16,    17,    25,     3,
      30,     9,    10,     0,    44,     6,     7,     8,    29,    17,
      11,    17,    39,    32,    67,    68,    69,    70,    71,    72,
      73,    74,    49,    27,    32,    32,    27,    39,    14,    15,
      31,    32,     3,    60,    61,    62,    63,    49,   103,   104,
      80,    98,     3,    18,    29,     4,     9,    10,    60,    61,
      62,    63,   105,   110,    17,     6,     7,     8,    19,    20,
      21,    22,    23,    24,    25,    26,     9,    10,    30,    32,
      12,    16,    30,    30,    17,    30,    18,    30,    19,    20,
      21,    23,    23,    24,    25,    26,    32,    17,    30,    32,
      18,    19,    20,    21,    22,    23,    24,    25,    26,    19,
      20,    32,    29,    23,    24,    25,    26,    12,    13,    14,
      15,    19,    20,    18,    18,    23,    24,    12,    13,    14,
      15,    28,    18,    29,     9,    18,   107,   101,    30,    32,
      22,    -1,   112
};

  /* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
     symbol of state STATE-NUM.  */
static const yytype_int8 yystos[] =
{
       0,    34,    35,     0,     6,     7,     8,    36,    45,    46,
      32,    36,    17,    45,    47,    48,    32,    18,    29,    49,
       3,    37,    48,    38,    49,    11,    27,    31,    32,    39,
      40,    41,    42,    44,    45,    50,    57,     9,    10,    17,
      32,    50,    54,    55,    17,    32,    55,    56,    30,    16,
      17,     4,    39,    30,    30,    30,    32,    44,    30,    54,
      12,    13,    14,    15,    32,    44,    56,    19,    20,    21,
      22,    23,    24,    25,    26,    37,    54,    32,    51,    52,
      29,    43,    43,    18,    54,    54,    54,    54,    18,    18,
      56,    56,    56,    56,    56,    56,    56,    56,    28,    58,
      18,    29,    53,    32,    44,    27,    37,    52,    43,    43,
      56,    53,    37,    58
};

  /* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_int8 yyr1[] =
{
       0,    33,    35,    34,    36,    36,    38,    37,    39,    39,
      40,    40,    40,    40,    40,    40,    41,    42,    42,    43,
      43,    43,    44,    45,    45,    45,    46,    47,    47,    48,
      49,    49,    50,    51,    51,    52,    53,    53,    54,    54,
      54,    54,    54,    54,    54,    54,    55,    55,    56,    56,
      56,    56,    56,    56,    56,    56,    56,    56,    56,    56,
      57,    58,    58,    58
};

  /* YYR2[YYN] -- Number of symbols on the right hand side of rule YYN.  */
static const yytype_int8 yyr2[] =
{
       0,     2,     0,     2,     2,     0,     0,     4,     2,     0,
       2,     2,     2,     1,     2,     2,     2,     3,     3,     3,
       3,     0,     3,     1,     1,     1,     6,     2,     0,     2,
       3,     0,     4,     2,     0,     1,     3,     0,     3,     3,
       3,     3,     3,     1,     1,     1,     1,     1,     3,     3,
       3,     3,     3,     3,     3,     3,     3,     3,     1,     1,
       4,     5,     2,     0
};


enum { YYENOMEM = -2 };

#define yyerrok         (yyerrstatus = 0)
#define yyclearin       (yychar = YYEMPTY)

#define YYACCEPT        goto yyacceptlab
#define YYABORT         goto yyabortlab
#define YYERROR         goto yyerrorlab


#define YYRECOVERING()  (!!yyerrstatus)

#define YYBACKUP(Token, Value)                                    \
  do                                                              \
    if (yychar == YYEMPTY)                                        \
      {                                                           \
        yychar = (Token);                                         \
        yylval = (Value);                                         \
        YYPOPSTACK (yylen);                                       \
        yystate = *yyssp;                                         \
        goto yybackup;                                            \
      }                                                           \
    else                                                          \
      {                                                           \
        yyerror (YY_("syntax error: cannot back up")); \
        YYERROR;                                                  \
      }                                                           \
  while (0)

/* Backward compatibility with an undocumented macro.
   Use YYerror or YYUNDEF. */
#define YYERRCODE YYUNDEF


/* Enable debugging if requested.  */
#if YYDEBUG

# ifndef YYFPRINTF
#  include <stdio.h> /* INFRINGES ON USER NAME SPACE */
#  define YYFPRINTF fprintf
# endif

# define YYDPRINTF(Args)                        \
do {                                            \
  if (yydebug)                                  \
    YYFPRINTF Args;                             \
} while (0)

/* This macro is provided for backward compatibility. */
# ifndef YY_LOCATION_PRINT
#  define YY_LOCATION_PRINT(File, Loc) ((void) 0)
# endif


# define YY_SYMBOL_PRINT(Title, Kind, Value, Location)                    \
do {                                                                      \
  if (yydebug)                                                            \
    {                                                                     \
      YYFPRINTF (stderr, "%s ", Title);                                   \
      yy_symbol_print (stderr,                                            \
                  Kind, Value); \
      YYFPRINTF (stderr, "\n");                                           \
    }                                                                     \
} while (0)


/*-----------------------------------.
| Print this symbol's value on YYO.  |
`-----------------------------------*/

static void
yy_symbol_value_print (FILE *yyo,
                       yysymbol_kind_t yykind, YYSTYPE const * const yyvaluep)
{
  FILE *yyoutput = yyo;
  YY_USE (yyoutput);
  if (!yyvaluep)
    return;
# ifdef YYPRINT
  if (yykind < YYNTOKENS)
    YYPRINT (yyo, yytoknum[yykind], *yyvaluep);
# endif
  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  YY_USE (yykind);
  YY_IGNORE_MAYBE_UNINITIALIZED_END
}


/*---------------------------.
| Print this symbol on YYO.  |
`---------------------------*/

static void
yy_symbol_print (FILE *yyo,
                 yysymbol_kind_t yykind, YYSTYPE const * const yyvaluep)
{
  YYFPRINTF (yyo, "%s %s (",
             yykind < YYNTOKENS ? "token" : "nterm", yysymbol_name (yykind));

  yy_symbol_value_print (yyo, yykind, yyvaluep);
  YYFPRINTF (yyo, ")");
}

/*------------------------------------------------------------------.
| yy_stack_print -- Print the state stack from its BOTTOM up to its |
| TOP (included).                                                   |
`------------------------------------------------------------------*/

static void
yy_stack_print (yy_state_t *yybottom, yy_state_t *yytop)
{
  YYFPRINTF (stderr, "Stack now");
  for (; yybottom <= yytop; yybottom++)
    {
      int yybot = *yybottom;
      YYFPRINTF (stderr, " %d", yybot);
    }
  YYFPRINTF (stderr, "\n");
}

# define YY_STACK_PRINT(Bottom, Top)                            \
do {                                                            \
  if (yydebug)                                                  \
    yy_stack_print ((Bottom), (Top));                           \
} while (0)


/*------------------------------------------------.
| Report that the YYRULE is going to be reduced.  |
`------------------------------------------------*/

static void
yy_reduce_print (yy_state_t *yyssp, YYSTYPE *yyvsp,
                 int yyrule)
{
  int yylno = yyrline[yyrule];
  int yynrhs = yyr2[yyrule];
  int yyi;
  YYFPRINTF (stderr, "Reducing stack by rule %d (line %d):\n",
             yyrule - 1, yylno);
  /* The symbols being reduced.  */
  for (yyi = 0; yyi < yynrhs; yyi++)
    {
      YYFPRINTF (stderr, "   $%d = ", yyi + 1);
      yy_symbol_print (stderr,
                       YY_ACCESSING_SYMBOL (+yyssp[yyi + 1 - yynrhs]),
                       &yyvsp[(yyi + 1) - (yynrhs)]);
      YYFPRINTF (stderr, "\n");
    }
}

# define YY_REDUCE_PRINT(Rule)          \
do {                                    \
  if (yydebug)                          \
    yy_reduce_print (yyssp, yyvsp, Rule); \
} while (0)

/* Nonzero means print parse trace.  It is left uninitialized so that
   multiple parsers can coexist.  */
int yydebug;
#else /* !YYDEBUG */
# define YYDPRINTF(Args) ((void) 0)
# define YY_SYMBOL_PRINT(Title, Kind, Value, Location)
# define YY_STACK_PRINT(Bottom, Top)
# define YY_REDUCE_PRINT(Rule)
#endif /* !YYDEBUG */


/* YYINITDEPTH -- initial size of the parser's stacks.  */
#ifndef YYINITDEPTH
# define YYINITDEPTH 200
#endif

/* YYMAXDEPTH -- maximum size the stacks can grow to (effective only
   if the built-in stack extension method is used).

   Do not make this value too large; the results are undefined if
   YYSTACK_ALLOC_MAXIMUM < YYSTACK_BYTES (YYMAXDEPTH)
   evaluated with infinite-precision integer arithmetic.  */

#ifndef YYMAXDEPTH
# define YYMAXDEPTH 10000
#endif






/*-----------------------------------------------.
| Release the memory associated to this symbol.  |
`-----------------------------------------------*/

static void
yydestruct (const char *yymsg,
            yysymbol_kind_t yykind, YYSTYPE *yyvaluep)
{
  YY_USE (yyvaluep);
  if (!yymsg)
    yymsg = "Deleting";
  YY_SYMBOL_PRINT (yymsg, yykind, yyvaluep, yylocationp);

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  YY_USE (yykind);
  YY_IGNORE_MAYBE_UNINITIALIZED_END
}


/* Lookahead token kind.  */
int yychar;

/* The semantic value of the lookahead symbol.  */
YYSTYPE yylval;
/* Number of syntax errors so far.  */
int yynerrs;




/*----------.
| yyparse.  |
`----------*/

int
yyparse (void)
{
    yy_state_fast_t yystate = 0;
    /* Number of tokens to shift before error messages enabled.  */
    int yyerrstatus = 0;

    /* Refer to the stacks through separate pointers, to allow yyoverflow
       to reallocate them elsewhere.  */

    /* Their size.  */
    YYPTRDIFF_T yystacksize = YYINITDEPTH;

    /* The state stack: array, bottom, top.  */
    yy_state_t yyssa[YYINITDEPTH];
    yy_state_t *yyss = yyssa;
    yy_state_t *yyssp = yyss;

    /* The semantic value stack: array, bottom, top.  */
    YYSTYPE yyvsa[YYINITDEPTH];
    YYSTYPE *yyvs = yyvsa;
    YYSTYPE *yyvsp = yyvs;

  int yyn;
  /* The return value of yyparse.  */
  int yyresult;
  /* Lookahead symbol kind.  */
  yysymbol_kind_t yytoken = YYSYMBOL_YYEMPTY;
  /* The variables used to return semantic value and location from the
     action routines.  */
  YYSTYPE yyval;



#define YYPOPSTACK(N)   (yyvsp -= (N), yyssp -= (N))

  /* The number of symbols on the RHS of the reduced rule.
     Keep to zero when no symbol should be popped.  */
  int yylen = 0;

  YYDPRINTF ((stderr, "Starting parse\n"));

  yychar = YYEMPTY; /* Cause a token to be read.  */
  goto yysetstate;


/*------------------------------------------------------------.
| yynewstate -- push a new state, which is found in yystate.  |
`------------------------------------------------------------*/
yynewstate:
  /* In all cases, when you get here, the value and location stacks
     have just been pushed.  So pushing a state here evens the stacks.  */
  yyssp++;


/*--------------------------------------------------------------------.
| yysetstate -- set current state (the top of the stack) to yystate.  |
`--------------------------------------------------------------------*/
yysetstate:
  YYDPRINTF ((stderr, "Entering state %d\n", yystate));
  YY_ASSERT (0 <= yystate && yystate < YYNSTATES);
  YY_IGNORE_USELESS_CAST_BEGIN
  *yyssp = YY_CAST (yy_state_t, yystate);
  YY_IGNORE_USELESS_CAST_END
  YY_STACK_PRINT (yyss, yyssp);

  if (yyss + yystacksize - 1 <= yyssp)
#if !defined yyoverflow && !defined YYSTACK_RELOCATE
    goto yyexhaustedlab;
#else
    {
      /* Get the current used size of the three stacks, in elements.  */
      YYPTRDIFF_T yysize = yyssp - yyss + 1;

# if defined yyoverflow
      {
        /* Give user a chance to reallocate the stack.  Use copies of
           these so that the &'s don't force the real ones into
           memory.  */
        yy_state_t *yyss1 = yyss;
        YYSTYPE *yyvs1 = yyvs;

        /* Each stack pointer address is followed by the size of the
           data in use in that stack, in bytes.  This used to be a
           conditional around just the two extra args, but that might
           be undefined if yyoverflow is a macro.  */
        yyoverflow (YY_("memory exhausted"),
                    &yyss1, yysize * YYSIZEOF (*yyssp),
                    &yyvs1, yysize * YYSIZEOF (*yyvsp),
                    &yystacksize);
        yyss = yyss1;
        yyvs = yyvs1;
      }
# else /* defined YYSTACK_RELOCATE */
      /* Extend the stack our own way.  */
      if (YYMAXDEPTH <= yystacksize)
        goto yyexhaustedlab;
      yystacksize *= 2;
      if (YYMAXDEPTH < yystacksize)
        yystacksize = YYMAXDEPTH;

      {
        yy_state_t *yyss1 = yyss;
        union yyalloc *yyptr =
          YY_CAST (union yyalloc *,
                   YYSTACK_ALLOC (YY_CAST (YYSIZE_T, YYSTACK_BYTES (yystacksize))));
        if (! yyptr)
          goto yyexhaustedlab;
        YYSTACK_RELOCATE (yyss_alloc, yyss);
        YYSTACK_RELOCATE (yyvs_alloc, yyvs);
#  undef YYSTACK_RELOCATE
        if (yyss1 != yyssa)
          YYSTACK_FREE (yyss1);
      }
# endif

      yyssp = yyss + yysize - 1;
      yyvsp = yyvs + yysize - 1;

      YY_IGNORE_USELESS_CAST_BEGIN
      YYDPRINTF ((stderr, "Stack size increased to %ld\n",
                  YY_CAST (long, yystacksize)));
      YY_IGNORE_USELESS_CAST_END

      if (yyss + yystacksize - 1 <= yyssp)
        YYABORT;
    }
#endif /* !defined yyoverflow && !defined YYSTACK_RELOCATE */

  if (yystate == YYFINAL)
    YYACCEPT;

  goto yybackup;


/*-----------.
| yybackup.  |
`-----------*/
yybackup:
  /* Do appropriate processing given the current state.  Read a
     lookahead token if we need one and don't already have one.  */

  /* First try to decide what to do without reference to lookahead token.  */
  yyn = yypact[yystate];
  if (yypact_value_is_default (yyn))
    goto yydefault;

  /* Not known => get a lookahead token if don't already have one.  */

  /* YYCHAR is either empty, or end-of-input, or a valid lookahead.  */
  if (yychar == YYEMPTY)
    {
      YYDPRINTF ((stderr, "Reading a token\n"));
      yychar = yylex ();
    }

  if (yychar <= YYEOF)
    {
      yychar = YYEOF;
      yytoken = YYSYMBOL_YYEOF;
      YYDPRINTF ((stderr, "Now at end of input.\n"));
    }
  else if (yychar == YYerror)
    {
      /* The scanner already issued an error message, process directly
         to error recovery.  But do not keep the error token as
         lookahead, it is too special and may lead us to an endless
         loop in error recovery. */
      yychar = YYUNDEF;
      yytoken = YYSYMBOL_YYerror;
      goto yyerrlab1;
    }
  else
    {
      yytoken = YYTRANSLATE (yychar);
      YY_SYMBOL_PRINT ("Next token is", yytoken, &yylval, &yylloc);
    }

  /* If the proper action on seeing token YYTOKEN is to reduce or to
     detect an error, take that action.  */
  yyn += yytoken;
  if (yyn < 0 || YYLAST < yyn || yycheck[yyn] != yytoken)
    goto yydefault;
  yyn = yytable[yyn];
  if (yyn <= 0)
    {
      if (yytable_value_is_error (yyn))
        goto yyerrlab;
      yyn = -yyn;
      goto yyreduce;
    }

  /* Count tokens shifted since error; after three, turn off error
     status.  */
  if (yyerrstatus)
    yyerrstatus--;

  /* Shift the lookahead token.  */
  YY_SYMBOL_PRINT ("Shifting", yytoken, &yylval, &yylloc);
  yystate = yyn;
  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END

  /* Discard the shifted token.  */
  yychar = YYEMPTY;
  goto yynewstate;


/*-----------------------------------------------------------.
| yydefault -- do the default action for the current state.  |
`-----------------------------------------------------------*/
yydefault:
  yyn = yydefact[yystate];
  if (yyn == 0)
    goto yyerrlab;
  goto yyreduce;


/*-----------------------------.
| yyreduce -- do a reduction.  |
`-----------------------------*/
yyreduce:
  /* yyn is the number of a rule to reduce with.  */
  yylen = yyr2[yyn];

  /* If YYLEN is nonzero, implement the default value of the action:
     '$$ = $1'.

     Otherwise, the following line sets YYVAL to garbage.
     This behavior is undocumented and Bison
     users should not rely upon it.  Assigning to YYVAL
     unconditionally makes the parser a bit smaller, and it avoids a
     GCC warning that YYVAL may be used uninitialized.  */
  yyval = yyvsp[1-yylen];


  YY_REDUCE_PRINT (yyn);
  switch (yyn)
    {
  case 2: /* $@1: %empty  */
#line 56 "grammaire.y"
        {
		head_table = createHead();
		memory_zone_INT = malloc(sizeof(int) * MAX_MEMORY_SIZE);
		memory_zone_DOUBLE = malloc(sizeof(int) * MAX_MEMORY_SIZE); 
		mem = init();

		/*
		int addr = 5;
		*(memory_zone_INT+sizeof(int)*addr) = 5;
		printf("%d", *(memory_zone_INT+sizeof(int)*addr));
		*/

		}
#line 1314 "grammaire.tab.c"
    break;

  case 3: /* DEBUT: $@1 FUNCTIONS  */
#line 69 "grammaire.y"
                {
			print_table(head_table);
			save_line("MOV 0 R1\n");
			print_output();
		}
#line 1324 "grammaire.tab.c"
    break;

  case 6: /* $@2: %empty  */
#line 81 "grammaire.y"
                    { global_depth++;}
#line 1330 "grammaire.tab.c"
    break;

  case 7: /* CORPS: T_OPEN_BRAC $@2 INSTRUCTIONS T_CLOSE_BRAC  */
#line 81 "grammaire.y"
                                                                 { global_depth--; }
#line 1336 "grammaire.tab.c"
    break;

  case 17: /* DECLARATION: VAR_TYPE T_VARNAME SUITE_DECLARATION  */
#line 99 "grammaire.y"
                                                     {

			int type = getTypeByName((yyvsp[-2].v3));
			if (type == 0) {
				printf("ERROR : Type not found !!!\n");
				exit(1);
			}
			Symbol * var;
			if (type == 1) {
				var = createSymbol(type, (yyvsp[-1].v3), global_pointer_INT, global_depth);
				global_pointer_INT++;
			}
			if (type == 2) {
				var = createSymbol(type, (yyvsp[-1].v3), global_pointer_DOUBLE, global_depth);
				global_pointer_DOUBLE++;	
			}
			
    		insertSymbol(head_table, var);

			}
#line 1361 "grammaire.tab.c"
    break;

  case 18: /* DECLARATION: VAR_TYPE AFFECTATION SUITE_DECLARATION  */
#line 119 "grammaire.y"
                                                         {
				int type = getTypeByName((yyvsp[-2].v3));
				if (type == 0) {
					printf("ERROR : Type not found !!!\n");
					exit(1);
				}
				Symbol * var;
				if (type == 1) {
					var = createSymbol(type, (yyvsp[-1].v3), global_pointer_INT, global_depth);
					global_pointer_INT++;
				}
				if (type == 2) {
					var = createSymbol(type, (yyvsp[-1].v3), global_pointer_DOUBLE, global_depth);
					global_pointer_DOUBLE++;	
				}
    			insertSymbol(head_table, var);
			}
#line 1383 "grammaire.tab.c"
    break;

  case 22: /* AFFECTATION: T_VARNAME T_EQUALS EXPR  */
#line 144 "grammaire.y"
                                        {(yyval.v3) = (yyvsp[-2].v3);}
#line 1389 "grammaire.tab.c"
    break;

  case 23: /* VAR_TYPE: T_FLOAT_TYPE  */
#line 147 "grammaire.y"
                             {(yyval.v3) = (yyvsp[0].v3);}
#line 1395 "grammaire.tab.c"
    break;

  case 24: /* VAR_TYPE: T_DOUBLE_TYPE  */
#line 148 "grammaire.y"
                                 {(yyval.v3) = (yyvsp[0].v3);}
#line 1401 "grammaire.tab.c"
    break;

  case 25: /* VAR_TYPE: T_INT_TYPE  */
#line 149 "grammaire.y"
                             {(yyval.v3) = (yyvsp[0].v3);}
#line 1407 "grammaire.tab.c"
    break;

  case 46: /* NUMBER: T_INT  */
#line 197 "grammaire.y"
              {
			printf("%d", (yyvsp[0].v1));
		}
#line 1415 "grammaire.tab.c"
    break;


#line 1419 "grammaire.tab.c"

      default: break;
    }
  /* User semantic actions sometimes alter yychar, and that requires
     that yytoken be updated with the new translation.  We take the
     approach of translating immediately before every use of yytoken.
     One alternative is translating here after every semantic action,
     but that translation would be missed if the semantic action invokes
     YYABORT, YYACCEPT, or YYERROR immediately after altering yychar or
     if it invokes YYBACKUP.  In the case of YYABORT or YYACCEPT, an
     incorrect destructor might then be invoked immediately.  In the
     case of YYERROR or YYBACKUP, subsequent parser actions might lead
     to an incorrect destructor call or verbose syntax error message
     before the lookahead is translated.  */
  YY_SYMBOL_PRINT ("-> $$ =", YY_CAST (yysymbol_kind_t, yyr1[yyn]), &yyval, &yyloc);

  YYPOPSTACK (yylen);
  yylen = 0;

  *++yyvsp = yyval;

  /* Now 'shift' the result of the reduction.  Determine what state
     that goes to, based on the state we popped back to and the rule
     number reduced by.  */
  {
    const int yylhs = yyr1[yyn] - YYNTOKENS;
    const int yyi = yypgoto[yylhs] + *yyssp;
    yystate = (0 <= yyi && yyi <= YYLAST && yycheck[yyi] == *yyssp
               ? yytable[yyi]
               : yydefgoto[yylhs]);
  }

  goto yynewstate;


/*--------------------------------------.
| yyerrlab -- here on detecting error.  |
`--------------------------------------*/
yyerrlab:
  /* Make sure we have latest lookahead translation.  See comments at
     user semantic actions for why this is necessary.  */
  yytoken = yychar == YYEMPTY ? YYSYMBOL_YYEMPTY : YYTRANSLATE (yychar);
  /* If not already recovering from an error, report this error.  */
  if (!yyerrstatus)
    {
      ++yynerrs;
      yyerror (YY_("syntax error"));
    }

  if (yyerrstatus == 3)
    {
      /* If just tried and failed to reuse lookahead token after an
         error, discard it.  */

      if (yychar <= YYEOF)
        {
          /* Return failure if at end of input.  */
          if (yychar == YYEOF)
            YYABORT;
        }
      else
        {
          yydestruct ("Error: discarding",
                      yytoken, &yylval);
          yychar = YYEMPTY;
        }
    }

  /* Else will try to reuse lookahead token after shifting the error
     token.  */
  goto yyerrlab1;


/*---------------------------------------------------.
| yyerrorlab -- error raised explicitly by YYERROR.  |
`---------------------------------------------------*/
yyerrorlab:
  /* Pacify compilers when the user code never invokes YYERROR and the
     label yyerrorlab therefore never appears in user code.  */
  if (0)
    YYERROR;

  /* Do not reclaim the symbols of the rule whose action triggered
     this YYERROR.  */
  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);
  yystate = *yyssp;
  goto yyerrlab1;


/*-------------------------------------------------------------.
| yyerrlab1 -- common code for both syntax error and YYERROR.  |
`-------------------------------------------------------------*/
yyerrlab1:
  yyerrstatus = 3;      /* Each real token shifted decrements this.  */

  /* Pop stack until we find a state that shifts the error token.  */
  for (;;)
    {
      yyn = yypact[yystate];
      if (!yypact_value_is_default (yyn))
        {
          yyn += YYSYMBOL_YYerror;
          if (0 <= yyn && yyn <= YYLAST && yycheck[yyn] == YYSYMBOL_YYerror)
            {
              yyn = yytable[yyn];
              if (0 < yyn)
                break;
            }
        }

      /* Pop the current state because it cannot handle the error token.  */
      if (yyssp == yyss)
        YYABORT;


      yydestruct ("Error: popping",
                  YY_ACCESSING_SYMBOL (yystate), yyvsp);
      YYPOPSTACK (1);
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
    }

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END


  /* Shift the error token.  */
  YY_SYMBOL_PRINT ("Shifting", YY_ACCESSING_SYMBOL (yyn), yyvsp, yylsp);

  yystate = yyn;
  goto yynewstate;


/*-------------------------------------.
| yyacceptlab -- YYACCEPT comes here.  |
`-------------------------------------*/
yyacceptlab:
  yyresult = 0;
  goto yyreturn;


/*-----------------------------------.
| yyabortlab -- YYABORT comes here.  |
`-----------------------------------*/
yyabortlab:
  yyresult = 1;
  goto yyreturn;


#if !defined yyoverflow
/*-------------------------------------------------.
| yyexhaustedlab -- memory exhaustion comes here.  |
`-------------------------------------------------*/
yyexhaustedlab:
  yyerror (YY_("memory exhausted"));
  yyresult = 2;
  goto yyreturn;
#endif


/*-------------------------------------------------------.
| yyreturn -- parsing is finished, clean up and return.  |
`-------------------------------------------------------*/
yyreturn:
  if (yychar != YYEMPTY)
    {
      /* Make sure we have latest lookahead translation.  See comments at
         user semantic actions for why this is necessary.  */
      yytoken = YYTRANSLATE (yychar);
      yydestruct ("Cleanup: discarding lookahead",
                  yytoken, &yylval);
    }
  /* Do not reclaim the symbols of the rule whose action triggered
     this YYABORT or YYACCEPT.  */
  YYPOPSTACK (yylen);
  YY_STACK_PRINT (yyss, yyssp);
  while (yyssp != yyss)
    {
      yydestruct ("Cleanup: popping",
                  YY_ACCESSING_SYMBOL (+*yyssp), yyvsp);
      YYPOPSTACK (1);
    }
#ifndef yyoverflow
  if (yyss != yyssa)
    YYSTACK_FREE (yyss);
#endif

  return yyresult;
}

#line 232 "grammaire.y"

int yyerror(void)
{ fprintf(stderr, "erreur de syntaxe\n"); return 1;}

int main(void){
    yyparse();
}