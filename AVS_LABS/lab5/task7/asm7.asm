global main
extern printf, c_7

section .text
str_c: db "Result C: %lf", 10 ,0
str_asm: db "Result Asm: %lf", 10 ,0
x dq 1.5
y dq 2.5
value dq 5.3
index dq 0.333333333333333

asm7:	push rbp
	mov rbp, rsp

	sub rsp, 8
	movq [rsp], xmm0

	fld qword [index]	;1/3
	fld qword [value]	;5.3
	fld qword [rsp]		;x
	faddp			    ;+

	fyl2x
	fld st0
	frndint
	fxch st1
	fsub st0, st1
	f2xm1
	fld1
	faddp
	fscale			    ;sqrt_3(5.3+x)

	movq [rsp], xmm1

	fld qword [rsp]		;y
	faddp				;+

	fstp qword [rsp]
	movq xmm0, [rsp]

	mov rsp, rbp
	pop rbp
	ret

main:	sub rsp, 8

	movq xmm0, [x]
	movq xmm1, [y]
	call c_7

	mov rdi, str_c
	mov al, 1
	call printf

	movq xmm0, [x]
	movq xmm1, [y]
	call asm7

	mov rdi, str_asm
	mov al, 1
	call printf

	add rsp, 8
	xor rax, rax
	ret


