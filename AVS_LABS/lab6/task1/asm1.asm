global main
extern printf

section .text
str: db "Result: %d", 10, 0
x dd 8

main:	sub rsp, 8

	xor rax, rax
	cmp dword [x], 9
	setne al

	mov rdi, str
	mov rsi, rax
	call printf

	add rsp, 8
	xor rax, rax
	ret
