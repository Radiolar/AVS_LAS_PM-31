global asm5

section .text
value dq -2.12

asm5:	push rbp
	mov rbp, rsp

	sub rsp, 8
	movq [rsp], xmm0

	fld qword [value]	;-2.12
	fld qword [rsp]		;x
	faddp				;+

	fld1				;1
	fld qword [rsp]		;x
	fyl2x				;log_2(x)

	fmulp				;*

	fstp qword [rsp]
	movq xmm0, [rsp]

	mov rsp, rbp
	pop rbp
	ret
