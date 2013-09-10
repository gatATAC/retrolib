#ifdef _MSX_CROSS_COMPILER
#include "conio.h"
#include "dos.h"
#else
#include <stdio.h>
#endif

void main(void) {
    puts("Hello, world :-)\r\n");
    exit(0);
}

