@ File: lab2a.s bubble sort

	.global _start
	

_start:

	ldr r0, =array
	mov r1, 6

	stmfd sp!, {r2-r9, lr}

	mov r4, r1									;inner loop counter
	mov r3, r4
	sub r1, r1, #1
	mov r9, r1									; outer loop counter

outer_loop:
	mov r5, r0
	mov r4, r3

inner_loop:
	ldr r6, [r5], #1							; loop at following val
	ldr r7, [r5]
	cmp r7, r6

	strls r6, [r5]
	strls r7, [r5, #-1]

	subs r4, r4, #1
	bne inner_loop

	subs r9, r9, #1
	bne outer_loop

	ldmfd sp!, {r2-r9, pc}^

_write:
	MOV R0, #1		@ output is monitor
	LDR R1, =array 	@ address of string
	LDR R2, #6 		@ the number of chars to be printed
	MOV R7, #4		@ system call #4
	SWI 0

_exit:
	mov r7, #1
	swi 0

.data
	array:
		.ascii "538129"