global main
extern printf

section .text
str: db "Result: %d", 10, 0
x dq 0

asm2:	cmp rdi, 3
	jl var_1

	mov rax, rdi
	mov rbx, 8
	xor rdx, rdx
	mul rbx
	sub rax, 52
	jmp exit

var_1:	mov rax, 4

exit:	ret


main:	sub rsp, 8

	mov rdi, [x]
	call asm2

	mov rdi, str
	mov rsi, rax
	call printf

	add rsp, 8
	xor rax, rax
	ret
