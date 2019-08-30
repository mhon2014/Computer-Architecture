@ File: lab1c.s


	.global _start

_start:
	
	mov r4, #4		@n = 4
	mov r5, #1 		@initialize result reg to 1


loop:
	cmp r4, #1
	ble done

facto:
	mov r5, r6
	muls r6, r5, r4		@result *= n
	swi 0

	subs r4, r4, #1 
	b loop

done: 
	mov r0, r6


_exit:
	mov r7, #1
	swi 0 



