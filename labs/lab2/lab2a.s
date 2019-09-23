@ File: lab2a.s bubble sort


.equ size, 6									@ setting var size to 6 
.equ byte, 1
.global start
.data
array:
	.ascii "538129"								@ array of size integer stored a char bytes

.text
start:

	ldr r0, =array								@ loading address of array into register r0
	mov r1, #size								@ moving size into register r1

	stmfd sp!, {r2-r9, lr}  					@ loading unto memory stack the value of reg 2 to 9 + link reg

	mov r4, r1									@ r4 set as inner loop counter with start value 'size'
	mov r3, r4									@ 
	sub r1, r1, #1								@ decrement size 
	mov r9, r1									@ r9 set as outer loop counter with start value 'size -1'

outer_loop:
	mov r5, r0									@ moving address of array to register r5
	mov r4, r3									@ r4 = 6

inner_loop:
	ldrb r6, [r5], #byte							@ obtaining array[i + 1]
	ldrb r7, [r5]								@ obtaining array[i]
	cmp r7, r6

swap:
	strls r6, [r5]								@ store value array[i + 1] into memory
	strls r7, [r5, #-byte]						@ store value array[i] into memory

	subs r4, r4, #1 							@ decrementing inner loop counter
	bne inner_loop								@ if result not zero, go back to inner_loop

	subs r9, r9, #1								@ decrementing outer loop counte 
	bne outer_loop								@ if result not zero, go back to outer_loop

	ldmfd sp!, {r2-r9, pc}^						@ load from memory into registers r2-r9

write:
	mov r0, #1									@ output is monitor
	ldr r1, =array 								@ address of string
	ldr r2, #6 									@ the number of chars to be printed
	mov r7, #4									@ system call #4 for write
	SWI 0										@ software interrupt

exit:
	mov r7, #1									@ exit system call
	swi 0



