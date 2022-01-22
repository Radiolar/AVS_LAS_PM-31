#include <stdio.h>
extern double* asm6(double*, double*);

int main()
{
	double x[] = {1.5, 2.5, 3.5, 4.5};
	double y[] = {4.5, 3.5, 2.5, 1.5};
	double* z = asm6(x, y);

	int i = 0;
	for(i; i < 4; i++)
		printf("%d) %lf\n", i+1, z[i]);

	return 0;
}
