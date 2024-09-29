.PHONY: run compile clean
run: item
	./main
compile item: item.o
	gcc -o item item.o
item.o: item.c
	gcc -c item.c
clean:
	rm *.o
	rm item
	rm *.gch
