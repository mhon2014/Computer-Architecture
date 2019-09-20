@ File: lab2a.s bubble sort

	.global _start
	

_start:
	ldr r0, =array				@loading the adrs of array into r0
	mov r7, #0					@ init outer loop counter to 0
	mov r8, #0					@ init inner loop counter to 0
	mov pc, lr 					@ returning to loop

swap:
	mov r5, [r1]
	str [r2], [r1]
	str r5, [r2]


outer_loop:
	cmp r7, #5
	bgt done
	sub r6, #5, r7

inner_loop:
	cmp r8, r6
	bgt in_done

	ldr r1, [r0, r8, lsl #0]	@accessing array at r8
	add r3, r8, #1
	ldr r2, [r0, r3, lsl #0]

	cmp r1, r2
	bgt swap

	add r8, r8, #1				@ incrementing inner loop counter
	bal inner_loop

in_done:						@ inner loop is done 
	add r7, r7, #1				@ incrementing outer loop counter
	bal outer_loop


done:
	mov r0, #1		@ output is monitor
	ldr r1, =array	@ address of string
	ldr r2, #6		@ the number of chars to be printed
	mov r7, #4		@ system call #4
	swi 0
	@exit for loop






_exit:
	mov r7, #1
	swi 0

.data
	array:
		.ascii "538129"