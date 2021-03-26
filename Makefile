PG = main
PGT = test

GFN = grammaire.y
RFN = regle.lex

default: compiler
	./$(PG) < example.c

test: compiler
	gcc $(PGT).c symbol_table.o -o $(PGT)
	./$(PGT)

compiler:
	gcc -c symbol_table.c 
	gcc -c opTable.c
	gcc -c util.c
	yacc -d $(GFN)
	yacc $(GFN)
	flex $(RFN)
	gcc y.tab.c symbol_table.o opTable.o util.o lex.yy.c -o $(PG)

clean:
	rm *.o $(PGT) y.tab.* $(PG) lex.yy.c
