GFN = grammaire.y
RFN = regle.lex
GF = out

default: 
	yacc -d $(GFN)
	yacc $(GFN)
	flex $(RFN)
	gcc y.tab.c lex.yy.c -o $(GF)
	./$(GF) < example.c

clean:
	rm lex.yy.c y.* $(GF)

example:
	yacc -d $(GFN)
	yacc $(GFN)
	flex $(RFN)
	gcc y.tab.c lex.yy.c -o $(GF)
	./$(GF) < example2.c
