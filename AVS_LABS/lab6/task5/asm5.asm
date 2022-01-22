global asm5

asm4:	push rbx

	mov rax, rdi
	mov rbx, 2
	xor rdx, rdx
	div rbx
	cmp rdx, 0		;x_i%2==0
	je var_1		;x_(i+1) = x_i/2

	mov rax, rdi
	mov rbx, 3
	mul rbx
	add rax, 1		;x_(i+1) = 3*x_i+1

var_1:	pop rbx
	ret


asm5:	push rdx		;N
	mov rax, rsi		;x0
	xor rcx, rcx		;counter

	cmp rcx, [rsp]		;N == 0
	je exit

	mov [rdi], rax		;x0 -> array

	inc rcx			;counter++
	cmp rcx, [rsp]
	jz exit			;counter == N

next:	push rcx
	push rdi

	mov rdi, rax
	call asm4

	pop rdi
	pop rcx

	mov [rdi + rcx*4], rax

	inc rcx
	cmp rcx, [rsp]
	jne next		;counter != N

exit:	pop rdx
	ret
