@ File: lab1b.s


	.global _start

_start:
	mov r3, #1

switch:
	cmp r3, #1
	beq case1
	cmp r3, #2
	beq case2
	cmp r3, #3
	beq case3
	b default


case1:
	mov r0, #1
	ldr r1, =opt1
	ldr r2, =len
	mov r7, #4
	b _break

case2: 
	mov r0, #1
	ldr r1, =opt2
	ldr r2, =len
	mov r7, #4
	b _break

case3: 
	mov r0, #1
	ldr r1, =opt3
	ldr r2, =len
	mov r7, #4
	b _break

default:
	b _break


_break:
	swi 0

_exit:
	mov r7, #1
	swi 0


.data
opt1:
	.asciz "Option 1\n"

opt2:
	.asciz "Option 2\n"

opt3: 
	.asciz "Option 3\n"

len = .-opt1

