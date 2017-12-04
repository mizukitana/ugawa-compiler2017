	.section .data
	@大域変数の定義
_Pi_var_x:
	.word 0
_Pi_var_y:
	.word 0
_Pi_var_i:
	.word 0
_Pi_var_answer:
	.word 0
_Pi_var_buf:
	.space	10, 0
	.byte 0x0a
	.equ len, . - _Pi_var_buf
	.section .text
	.global _start
_start:
	@式をコンパイルした命令列
	ldr r0, =#15
	ldr r1, =_Pi_var_x
	str r0, [r1, #0]
	ldr r0, =_Pi_var_x
	ldr r0, [r0, #0]
	cmp r0, #0
	beq L0
	ldr r0, =_Pi_var_x
	ldr r0, [r0, #0]
	str r1, [sp, #-4]!
	mov r1, r0
	mvn r0, r1
	add r0, r0, #1
	ldr r1, [sp], #4
	ldr r1, =_Pi_var_y
	str r0, [r1, #0]
	b L1
L0:
	ldr r0, =#128
	ldr r1, =_Pi_var_y
	str r0, [r1, #0]
L1:
	ldr r0, =_Pi_var_i
	ldr r0, [r0, #0]
	cmp r0, #0
	bne L2
	ldr r0, =_Pi_var_y
	ldr r0, [r0, #0]
	str r1, [sp, #-4]!
	mov r1, r0
	ldr r0, =#10
	add r0, r1, r0
	ldr r1, [sp], #4
	ldr r1, =_Pi_var_y
	str r0, [r1, #0]
	ldr r0, =_Pi_var_i
	ldr r0, [r0, #0]
	str r1, [sp, #-4]!
	mov r1, r0
	ldr r0, =#1
	add r0, r1, r0
	ldr r1, [sp], #4
	ldr r1, =_Pi_var_i
	str r0, [r1, #0]
L2:
	ldr r0, =_Pi_var_y
	ldr r0, [r0, #0]
	str r1, [sp, #-4]!
	mov r1, r0
	mvn r0, r1
	ldr r1, [sp], #4
	str r1, [sp, #-4]!
	mov r1, r0
	ldr r0, =#15
	and r0, r1, r0
	ldr r1, [sp], #4
	ldr r1, =_Pi_var_answer
	str r0, [r1, #0]
	ldr r0, =_Pi_var_y
	ldr r0, [r0, #0]
	str r1, [sp, #-4]!
	mov r1, r0
	mvn r0, r1
	ldr r1, [sp], #4
	str r1, [sp, #-4]!
	mov r1, r0
	ldr r0, =#15
	and r0, r1, r0
	ldr r1, [sp], #4
	mov r0, r0
	ldr r1, =_Pi_var_buf+10
	mov r2, #16
	mov r3, #8
L3:
	sub r1, r1, #1
	sub r3, r3, #1
	udiv r4, r0, r2
	mul r5, r2, r4
	sub r6, r0, r5
	cmp r6, #10
	bge L4
	add r6, r6, #48
	strb r6, [r1]
	mov r0, r4
	cmp r3, #0
	bhi L3
	b L5
L4:
	sub r6, r6, #10
	add r6, r6, #65
	strb r6, [r1]
	mov r0, r4
	cmp r3, #0
	bhi L3
L5:
	mov r7, #4
	mov r0, #1
	ldr r1, =_Pi_var_buf
	ldr r2, =len
	swi #0
	@ EXITシステムコール
	ldr r0, =_Pi_var_answer
	ldr r0, [r0, #0]
	mov r7, #1
	swi #0
