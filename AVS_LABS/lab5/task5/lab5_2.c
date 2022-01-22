#include <stdio.h>
#include <math.h>

extern double asm5(double);

double task5(double x)
{
	return (-2.12 + x)*log2(x);
}

int main()
{
	//task 5
	printf("Result C: %lf\nResult Asm: %lf\n", task5(2.5), asm5(2.5));
	return 0;
}
