@ File: lab2b.s bubble sort


.equ size, 6									@ setting var size to 6 
.equ byte, 1
.global _start

.data
array:
	.ascii "538129"								@ array of size integer stored a char bytes

.text
_start:

	ldr r0, =array								@ loading address of array into register r0
	mov r1, #size								@ moving size into register r1

insertionSort:
	mov r3, #1									@ r3 set as outer loop counter
	

outer_loop:
	cmp r3, #size
	bge outer_done	
	ldrb r4, [r0, +r3]							@inserting key array[r3] into r4
	sub r2, r3, #1									@ r2 set as inner loop counter with start value 'size'

inner_loop:
	cmp r2, #0
	blt inner_done
	ldrb r5, [r0, +r2]
	cmp r5, r4
	ble inner_done

insert:
	ldrb r6, [r0, +r2]
	add r7, r2, #1								@ j + 1
	strb r6, [r0, +r7]

inner_decr:
	sub r2, r2, #1								@ decrement j
	bal inner_loop                          	@ load from memory into registers r2-r9


inner_done:
	add r3, r3, #1								@ incrementing outer_loop counter
	add r7, r2, #1	
	strb r4, [r0, +r7]
	b outer_loop

outer_done:
_write:
	mov r0, #1									@ output is monitor
	ldr r1, =array 								@ address of string
	mov r2, #size									@ the number of chars to be printed
	mov r7, #4									@ system call #4 for write
	SWI 0										@ software interrupt

_exit:
	mov r7, #1									@ exit system call
	swi 0



