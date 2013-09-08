/* Sample program for testing crt0 advanced:
   prints out all the passed parameters */

char* s="Soy una variable global!!\r\n";
char* s2="Y yo otra!!\r\n\r\n";

#ifdef _MSX_CROSS_COMPILER
void print(char* str) __naked;
#else
#include <stdio.h>
void print(char* str);
#endif

#include "func.h"
#include "func2.h"

/*--- Main function, returns error 34 if no params are passed ---*/

#ifdef _MSX_CROSS_COMPILER
int main(char** argv, int argc)
#else
int main(int argc, char** argv)
#endif
{
	int i;
	unsigned char a;

	a=10;
	a=sum1(a);
	a=subtract1(a);
	print(s);
	print(s2);

	if(argc==0)
	{
		print("No parameters were passed.\r\n");
		return 34;
	}

	print("Parameters passed:\r\n\r\n");

	for(i=0;i<argc;i++)
	{
		print(argv[i]);
                print("\r\n");
	}

	return 0;
}


#ifdef _MSX_CROSS_COMPILER
/*--- Simple screen print function ---*/

void print(char* str) __naked
{
	__asm
        ld      hl,#2
        add     hl,sp
	ld	a,(hl)
	inc     hl
	ld      h,(hl)
	ld	l,a

LOOP:	ld	a,(hl)
	or	a
        ret     z
	ld	e,a
	ld	c,#2
	push	hl
	call	#5
	pop	hl
	inc	hl
	jr	LOOP
	__endasm;
}
#else
void print(char* str){
	printf("%s",str);
}
#endif

