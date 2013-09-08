all: src/heap.c src/mem.c src/interrupt.s src/ioport.s src/keyboard.s src/vdp.s src/interrupt_ROM.s 
	sdasz80 -o lib/interrup.rel src/interrupt.s
	sdasz80 -o lib/ioport.rel src/ioport.s
	sdasz80 -o lib/keyboard.rel src/keyboard.s
	sdasz80 -o lib/vdp.rel src/vdp.s
	sdcc -mz80 -c -o lib/heap.rel src/heap.c -I include
	sdcc -mz80 -c -o lib/mem.rel src/mem.c -I include
clean:
	rm lib/*
