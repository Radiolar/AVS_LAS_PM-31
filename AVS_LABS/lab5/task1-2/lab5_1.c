#include <stdio.h>
#include <math.h>
#define VALUE(type_1, type_2) type_1 value_i(type_2 i)\
{ \
	return pow(-1, i) * ((type_1)(i + 1) / (i * i - 1));\
}

VALUE(double, int);

enum 
{
	N1 = 1000,
	N2 = 1000000,
	N3 = 1000000000
};

void print_task1(float* Sd_f, float* Sa_f, double* Sd_d, double* Sa_d)
{
	int i = 0;
	for (i; i < 3; i++)
		printf("Sd_f = %.22f, Sa_f = %.22f\n", Sd_f[i], Sa_f[i]);
	i = 0;
	printf("-----------------------------------\n");
	for (i; i < 3; i++)
		printf("Sd_d = %.48lf, Sa_d = %.48lf\n", Sd_d[i], Sa_d[i]);
	printf("-----------------------------------\n");
}

void print_task2(double s)
{
	printf("s = %.48lf\n", s);
}

void task1(float* Sd_f, float* Sa_f, double* Sd_d, double* Sa_d)
{
	int N[3] = { N1, N2, N3 };

	int i, j = 0;
	for (j; j < 3; j++)
	{
		i = 1;
		for (i; i != N[j] + 1; i++)
		{
			Sd_f[j] += (float)(1) / i;
			Sd_d[j] += (double)(1) / i;
		}
		for (i; i != 0; i--)
		{
			Sa_f[j] += (float)(1) / i;
			Sa_d[j] += (double)(1) / i;
		}
	}
}

double task2(double s)
{
	double e = 1.0 / 1000, error = 0, s_1 = 0, s_2 = 0;
	int i = 2;
	for (i;; i++)
	{
		s_1 = s;
		s_2 = value_i(i);
		s += s_2;
		error += (s_2 - (s - s_1)) + (s_1 - (s - (s - s_1)));
		if (fabs(value_i(i + 1)) <= e)
			break;
	}
	return s + error;
}

int main()
{
	//task 1
	float Sd_f[3] = { 0, 0, 0 }, Sa_f[3] = { 0, 0, 0 };
	double Sd_d[3] = { 0, 0, 0 }, Sa_d[3] = { 0, 0, 0 };
	task1(Sd_f, Sa_f, Sd_d, Sa_d);
	print_task1(Sd_f, Sa_f, Sd_d, Sa_d);

	//task 2
	double s = 0;
	s = task2(s);
	print_task2(s);

	return 0;
}
