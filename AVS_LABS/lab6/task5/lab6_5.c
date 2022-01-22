#include <stdio.h>
extern void asm5(unsigned int*, unsigned int, unsigned int);

int main()
{
	unsigned int N = 0, x0 =0;
	printf("Enter x0 and N: ");
	scanf("%d %d", &x0,  &N);

	unsigned int array[N];
	asm5(array, x0, N);

	printf("Result: ");
	int i = 0;
	for(i; i < N; i++)
		printf("%d ", array[i]);
	printf("\n");

	return 0;
}
