default:
	yacc -d grammaire.y
	yacc grammaire.y
	flex regle2.lex
	gcc  y.tab.c lex.yy.c -o out
	./out < example.c
