#include <stdio.h>

enum
{
	N = 5
};

void print(unsigned int z, unsigned int w)
{
	printf("z = %d, w = %d\n",z, w);
}

void print_M_d(int* M)
{
	int i = 0;
	for (i; i < N; i++)
		printf("%d ", M[i]);
	printf("\n");
}

void print_M_x(int* M)
{
	int i = 0;
	for (i; i < N; i++)
		printf("%x ", M[i]);
	printf("\n");
}

void c_task(int x, int y)
{
	print((x + 8) / y, (x + 8) % y);
}

void asm_task1(unsigned int x, unsigned int y)
{
	unsigned int z = 0, w = 0;

	asm
	(	"movl %2, %%eax\n\t"
		"addl $8, %%eax\n\t"
		"movl %3, %%ecx\n\t"
		"movl $0, %%edx\n\t"
		"divl %%ecx\n\t"
		"movl %%eax, %0\n\t"
		"movl %%edx, %1\n\t"
		:"=m"(z), "=m"(w)
		:"m"(x), "m"(y)
		:"%eax", "%ecx", "%edx"
	);

	print(z, w);
}

void asm_task2(unsigned int* p, unsigned int* q)
{
	unsigned int z = 0, w = 0;

	asm
	(	"movq (%%rax), %%rax\n\t"
		"addq $8, %%rax\n\t"
		"movq (%%rcx), %%rcx\n\t"
		"movl $0, %%edx\n\t"
		"divl %%ecx\n\t"
		"movl %%eax, %0\n\t"
		"movl %%edx, %1\n\t"
		:"=m"(z), "=m"(w)
		:"a"(p), "c"(q)
		:"%edx"
	);

	print(z, w);
}

void asm_task3(unsigned int x, unsigned int y)
{
	unsigned int z = 0, w = 0;

	asm
	(	"addl $8, %2\n\t"
		"movl $0, %%edx\n\t"
		"divl %3\n\t"
		:"=a"(z), "=d"(w)
		:"a"(x), "c"(y)
	);

	print(z, w);
}

void asm_task4(int* M, int x)
{
	unsigned int k = 1;

	asm(	"movq %%rdx, (%%rsi, %%rcx, 4)\n\t"
		:
		:"S"(M), "c"(k), "d"(x)
	);
}

void asm_task5(int* M)
{
	unsigned int j = 2;

	asm(	"movq $0xFF, 1(%%rsi, %%rcx, 4)\n\t"
		:
		:"S"(M), "c"(j)
	);
}

int main()
{
	unsigned int x = 10, y = 5;
	//task 1
	asm_task1(x,y);
	c_task(x,y);

	//task 2
	asm_task2(&x, &y);

	//task 3
	asm_task3(x, y);

	//task 4
	int M[N];
	int i = 0;
	for (i; i < N; i++)
		M[i] = 0;

	asm_task4(M, x);
	print_M_d(M);

	//task 5
	asm_task5(M);
	print_M_x(M);

	return 0;
}
