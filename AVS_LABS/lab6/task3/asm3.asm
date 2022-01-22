global main
extern printf

section .text
str: db "Result: %lf", 10, 0
x dq 3.2
v1 dq 4.6
v2 dq 6.9
v_cmp dq 3.3

asm3:	push rbp
	mov rbp, rsp

	sub rsp, 8
	movq [rsp], xmm0

	fld qword [rsp]		;x
	fcom qword [v_cmp]
	fstsw ax
	sahf
	jb var_1

	fld qword [v2]		;6.9
	faddp			;+

	fstp qword [rsp]
	movq xmm0, [rsp]
	jmp exit

var_1:	movq xmm0, [v1]		;4.6

exit:	mov rsp, rbp
	pop rbp
	ret

main:	sub rsp, 8

	movq xmm0, [x]
	call asm3

	mov rdi, str
	mov al, 1
	call printf

	add rsp, 8
	xor rax, rax
	ret
