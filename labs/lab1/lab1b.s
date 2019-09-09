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
	mov r2, #9
	mov r7, #4
	swi #0
	bal break

case2: 
	mov r0, #1
	ldr r1, =opt2
	mov r2, #9
	mov r7, #4
	swi #0
	bal break

case3: 
	mov r0, #1
	ldr r1, =opt3
	mov r2, #9
	mov r7, #4
	swi #0
	bal break

default:
	bal break


break:
	bal 	_exit

_exit:
	mov r7, #1
	swi 0


.data

	opt1:
	.ascii "Option 1\n"

	opt2:
	.ascii "Option 2\n"

	opt3: 
	.ascii "Option 3\n"
