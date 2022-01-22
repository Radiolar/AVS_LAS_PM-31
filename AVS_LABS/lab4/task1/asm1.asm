global asm1

section .text
asm1:
	push rbx
	mov eax, esi
	mov ebx, 5
	mul ebx
	mov ebx, eax
	mov eax, edi
	add eax, 1234
	sub eax, ebx
	pop rbx
	ret
