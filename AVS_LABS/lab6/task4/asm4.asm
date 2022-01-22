global main
extern scanf, printf

section .bss
x0 		resq 1
N 		resq 1

section .text
str_printf_1	db "Enter x0 (>=0): ", 0
str_printf_2	db "Enter N (>=0): ", 0
str_scanf	db "%d", 0
str_printf_3	db "%d ", 0
str_printf_4	db 10, 0

scan:	mov rdi, str_printf_1
	mov al, 0
	call printf

	mov rdi, str_scanf
	mov rsi, x0
	mov al, 0
	call scanf

	mov rdi, str_printf_2
	mov al, 0
	call printf

	mov rdi, str_scanf
	mov rsi, N
	mov al, 0
	call scanf

	ret


asm4:	push rbx

	mov rax, rdi
	mov rbx, 2
	xor rdx, rdx
	div rbx
	cmp rdx, 0		;x_i%2==0
	je var_1		;x_(i+1) = x_i/2

	mov rax, rdi
	mov rbx, 3
	mul rbx
	add rax, 1		;x_(i+1) = 3*x_i+1

var_1:	pop rbx
	ret


main:	call scan

	cmp qword [N], 0	;N==0
	je exit

	mov rdi, str_printf_3
	mov rsi, [x0]
	mov al, 0
	call printf		;print x0

	mov rbx, [x0]		;x0
	mov rcx, [N]		;counter

	dec rcx			;counter--
	jz exit			;counter==0

next:	push rcx

	mov rdi, rbx
	call asm4
	mov rbx, rax

	mov rdi, str_printf_3
	mov rsi, rbx
	mov al, 0
	call printf

	pop rcx

	dec rcx			;counter--
	jnz next		;counter!=0

exit:	mov rdi, str_printf_4
	mov al, 0
	call printf

	xor rax, rax
	ret
