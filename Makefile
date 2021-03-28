PG = main
PGT = test

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
	bison -d $(GFN)
	bison $(GFN)
	flex $(RFN)
	gcc y.tab.c symbol_table.o opTable.o util.o lex.yy.c -o $(PG)

clean:
	rm *.o $(PGT) y.tab.* $(PG) lex.yy.c
