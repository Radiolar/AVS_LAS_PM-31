global main
extern printf

section .text
str: db "Result: %lf + i*%lf", 10, 0
re dq 1.5
im dq 1.5

asm8:	vmulpd xmm2, xmm0, xmm0
	vmulpd xmm3, xmm1, xmm1
	vsubpd xmm2, xmm2, xmm3
	vaddpd xmm2, xmm2, xmm0		;res re

	vaddpd xmm3, xmm0, xmm0
	vmulpd xmm3, xmm3, xmm1
	vaddpd xmm3, xmm3, xmm1		;res im

	vmovapd xmm0, xmm2		;res re
	vmovapd xmm1, xmm3		;res im

	ret

main:	sub rsp, 8

	movq xmm0, [re]
	movq xmm1, [im]
	call asm8

	mov rdi, str
	mov al, 2
	call printf

	add rsp, 8
	xor rax, rax
	ret
