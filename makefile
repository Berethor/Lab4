.PHONY: clean all
CC=gcc
CFLAGS=-I.


all : parallel_min_max process_memory parallel_sum

process_memory : 
	$(CC) -g process_memory.c -o process_memory
	
utils.o : utils.h
	$(CC) -g -o utils.o -c utils.c $(CFLAGS)

parallel_sum : utils.o utils.h 
	$(CC) -g -pthread -o parallel_sum utils.o parallel_sum.c $(CFLAGS)

parallel_min_max : utils.o find_min_max.o utils.h find_min_max.h
	$(CC) -g -o parallel_min_max utils.o find_min_max.o parallel_min_max.c $(CFLAGS)

find_min_max.o : utils.h find_min_max.h
	$(CC) -g -o find_min_max.o -c find_min_max.c $(CFLAGS)

clean :
	rm utils.o find_min_max.o parallel_min_max process_memory