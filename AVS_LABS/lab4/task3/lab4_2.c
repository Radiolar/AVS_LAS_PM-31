#include <stdio.h>

extern int asm3(int, int, int, int, int);

int asm3(int x1, int x2, int x3, int x4, int x5)
{
	printf("1) %d\n2) %d\n3) %d\n4) %d\n5) %d\n", x1, x2, x3, x4, x5);
	return x5;
}
