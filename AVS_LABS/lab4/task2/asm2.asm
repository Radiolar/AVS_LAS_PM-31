global main
extern printf, asm1

section .text
str: db "Result: %d", 10, 0
x dd 1
y dd 0

main:	sub rsp, 8

	mov edi, [x]
	mov esi, [y]
	call asm1

	mov edi, str
	mov esi, eax
	call printf

	add rsp, 8
	xor eax, eax
	ret
