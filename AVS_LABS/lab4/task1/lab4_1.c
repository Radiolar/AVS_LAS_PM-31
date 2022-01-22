#include <stdio.h>

extern int asm1(int, int);

int c1(int x, int y)
{
	return 1234 + x - 5*y;
}

int main()
{
	//task 1
	int x = 1, y = 2;
	printf("Result c1: %d\n", c1(x, y));
	printf("Result asm1: %d", asm1(x, y));

	return 0;
}
