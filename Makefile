#P=hyperloglog
#OBJECTS=hll.c main.c
#CFLAGS=-Wall -O3
#LDFLAGS=-lm
#CC=gcc

#$(P): $(OBJECTS)
#	$(CC) $(CFLAGS) $(OBJECTS) -o $@ $(LDFLAGS)
#
#clean:
#	rm -f $(P)

all:
	gcc -c -Wall -fpic hll.c
	gcc -shared  -o libhll.so hll.o

clean:
	rm -f *.o *.so htest bench

test:
	gcc -Wall -O3 -o htest test.c -L. -lhll -lm
	LD_LIBRARY_PATH=.:$LD_LIBRARY_PATH; ./generator.py > deleteme
	./htest deleteme
	rm -f deleteme
	
bench:
	gcc -Wall -O3 -o bench bench.c -L. -lhll -lm
