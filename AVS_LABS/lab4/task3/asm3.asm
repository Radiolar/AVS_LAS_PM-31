global main
extern printf, asm3

section .text
str: db "Result: x5 = %d", 10, 0
x1 dd 1
x2 dd 2
x3 dd 3
x4 dd 4
x5 dd 5


main:	sub rsp, 8

	mov rdi, [x1]
	mov rsi, [x2]
	mov rdx, [x3]
	mov rcx, [x4]
	mov r8, [x5]
	call asm3

	mov rdi, str
	mov rsi, rax
	call printf

	add rsp, 8
	ret

