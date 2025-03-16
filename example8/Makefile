example8: example8.o printHello.o
	clang *.o -o example8

example8.o:
	clang -c example8.c

printHello.o:
	clang -c printHello.c

run: example8
	./example8

clean::
	rm -f *.o example8
