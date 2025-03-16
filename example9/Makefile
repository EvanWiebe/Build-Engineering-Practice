example9: example9.o printStuff.a
	clang example9.o printStuff.a -o example9

example9.o:
	clang -c example9.c

printStuff.a: printGoodbye.o printHello.o
	ar -rs printStuff.a printGoodbye.o printHello.o

printGoodbye.o:
	clang -c printGoodbye.c

printHello.o:
	clang -c printHello.c

run: example9
	./example9

clean::
	rm -f *.o *.a example9
