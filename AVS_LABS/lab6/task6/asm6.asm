global main
extern printf

section .text
e		dq 0.000001
str:		db "Result: %lf", 10, 0

value:	push rbx

	sub rsp, 8
	mov [rsp], rdi

	fild qword [rsp]	;i
	fld1			;1
	faddp			;+

	fild qword [rsp]	;i
	fild qword [rsp]	;i
	fmulp			;*
	fld1			;1
	fsubp			;-

	fdivp			;/

	mov rax, rdi
	xor rdx, rdx
	mov rbx, 2
	div rbx
	cmp rdx, 0
	je exit			;xmm0

	fld st0
	fsub st1, st0
	fsubp			;-xmm0

exit:	fstp qword [rsp]
	movq xmm0, [rsp]
	add rsp, 8

	pop rbx
	ret

main:	xorps xmm1, xmm1	;s
	xorps xmm2, xmm2	;s_1
	xorps xmm3, xmm3	;s_2
	xorps xmm4, xmm4	;error

	sub rsp, 8
	mov rcx, 2		;i = 2

next:	mov rdi, rcx
	call value		;value(i)

	vmovapd xmm2, xmm1	;s_1 = s
	vmovapd xmm3, xmm0	;s_2 = value(i)
	vaddpd xmm1, xmm1, xmm3	;s += s_2

	vaddpd xmm4, xmm4, xmm3
	vsubpd xmm4, xmm4, xmm1
	vaddpd xmm4, xmm4, xmm2
	vaddpd xmm4, xmm4, xmm2
	vsubpd xmm4, xmm4, xmm1
	vaddpd xmm4, xmm4, xmm1
	vsubpd xmm4, xmm4, xmm2	;error

	inc rcx			;i++
	mov rdi, rcx
	call value		;value(i+1)

	movq [rsp], xmm0
	fld qword [rsp]

	mov rax, rcx
	xor rdx, rdx
	mov rbx, 2
	div rbx
	cmp rdx, 0
	je pos

	fld st0
	fsub st1, st0
	fsubp

pos:	fld qword [e]
	fcompp
	fstsw ax
	sahf
	ja stop

	jmp next

stop:	mov rdi, str
	vaddpd xmm0, xmm1, xmm4	;res = s + error
	mov al, 1
	call printf

	add rsp, 8
	xor rax, rax
	ret
