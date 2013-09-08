all: src/conio.c src/dos.s src/dos2.s src/getchar.s src/putchar.s 
	sdasz80 -o lib/dos.rel src/dos.s
	sdasz80 -o lib/dos2.rel src/dos2.s
	sdasz80 -o lib/getchar.rel src/getchar.s
	sdasz80 -o lib/putchar.rel src/putchar.s
	sdcc -mz80 -c -o lib/conio.rel src/conio.c -I include -I ../../system/include
clean:
	rm lib/*
