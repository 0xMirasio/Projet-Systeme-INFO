PG = main

GFN = grammaire.y
RFN = regle.lex

default: compiler
	./$(PG) < example.c

test: compiler
	gcc $(PGT).c symbol_table.o -o $(PGT)
	./$(PGT)

git: 
	git add *
	git commit -m "automated push via VSCODE"
	git push
	
compiler:
	gcc -c symbol_table.c 
	gcc -c opTable.c
	gcc -c util.c
	gcc -c memory_z.c
	yacc -d $(GFN)
	yacc $(GFN)
	flex $(RFN)
	gcc y.tab.c symbol_table.o util.o memory_z.o lex.yy.c -o $(PG)

clean:
	rm *.o $(PGT) y.tab.* lex.yy.c
