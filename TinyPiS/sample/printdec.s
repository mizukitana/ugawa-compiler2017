	@ N���ͤ�10�ʿ���ü�����̤˽��Ϥ��륢����֥����ץ����
	.section .text
	.global _start
	.equ	N, 11
	.equ	nchar, 10
_start:
	ldr	r0, =N
	ldr	r1, =buf + nchar
	mov	r2, #10
	mov	r3, #8
	
loop:
	sub	r1, r1, #1
	sub r3, r3, #1
	udiv	r4, r0, r2
	mul	r5, r2, r4
	sub	r6, r0, r5
	add	r6, r6, #'0'
	strb	r6, [r1]
	mov	r0, r4
	cmp	r3, #0
	bhi	loop

	@ write
	mov	r7, #4
	mov	r0, #1
	ldr	r1, =buf + 1
	swi	#0

	mov	r7, #1
	mov	r0, #0
	swi	#0

	.section .data
buf:	.space 	nchar, 0
	.byte 0x0a
