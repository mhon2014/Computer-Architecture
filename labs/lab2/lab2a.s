@ File: lab2a.s bubble sort


.equ size, 6									@ setting var size to 6 
.equ lastIndex, 5
.equ byte, 1
.global _start

.data
array:
	.ascii "538129"								@ array of size integer stored a char bytes

.text
_start:

	ldr r0, =array								@ loading address of array into register r0
	mov r1, #size								@ moving size into register r1

	@ stmfd sp!, {r2-r9, lr}  					@ loading unto memory stack the value of reg 2 to 9 + link reg

bubbleSort:
	mov r3, #0									@ r3 set as outer loop counter
	

outer_loop:
	cmp r3, #lastIndex
	bge outer_done		
	mov r2, #0									@ r2 set as inner loop counter with start value 'size'

inner_loop:
	sub r4, r3, #(lastIndex)
	mov r12, #-1
	mul r11, r4, r12
	mov r4, r11
	cmp r2, r4									@ limit of inner loop counter
	bge inner_done								@ when loop ends
	
	ldrb r5, [r0, +r2]								@ obtaining array[i]
	add r8, r2, #1
	ldrb r6, [r0, +r8]							@ obtaining array[i]
	cmp r5, r6
	ble inner_incr

swap:
	str r6, [r0, +r2]								@ store value array[i + 1] into memory
	str r5, [r0, +r8]						@ store value array[i] into memory

inner_incr:
	add r2, r2, #1
	bal inner_loop

						@ load from memory into registers r2-r9



inner_done:
	add r3, r3, #1								@ incrementing outer_loop counter
	b outer_loop

outer_done:
_write:
	mov r0, #1									@ output is monitor
	ldr r1, =array 								@ address of string
	mov r2, #6 									@ the number of chars to be printed
	mov r7, #4									@ system call #4 for write
	SWI 0										@ software interrupt

_exit:
	mov r7, #1									@ exit system call
	swi 0



