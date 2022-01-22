global asm6

section .text
asm6:	sub rsp, 8

	vmovapd ymm0, [rdi]
	vmovapd ymm1, [rsi]
	vaddpd ymm2, ymm0, ymm1
	vsubpd ymm3, ymm0, ymm1
	vmulpd ymm0, ymm2, ymm3
	vmovapd [rdi], ymm0

	add rsp, 8
	ret
