global main
extern printf

section .text
str: db "Result: %d + i*%d", 10, 0
re dd 1
im dd 1

asm4:	push rbx

	mov rax, rsi
	mul rsi
	mov rcx, rax
	mov rax, rdi
	mul rdi
	sub rax, rcx
	add rax, rdi
	mov rcx, rax	;res re

	mov rax, rdi
	mov rbx, 2
	mul rbx
	mul rsi
	add rax, rsi	;res im

	mov rdi, str	;str
	mov rdx, rax	;im
	mov rsi, rcx	;re
	call printf

	pop rbx
	ret


main:	sub rsp, 8

	mov rdi, [re]
	mov rsi, [im]
	call asm4

	add rsp, 8
	xor rax, rax
	ret

