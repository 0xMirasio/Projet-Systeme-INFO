PG = main

default: main
	./$(PG)

main: compiler
	gcc main.c symbol_table.o -o $(PG)

compiler:
	gcc -c symbol_table.c 

clean:
	rm *.o $(PG)