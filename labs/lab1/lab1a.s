@ File: lab1a.s


	.global _start


_start:
	MOV R3, #0
	MOV R4, #9
	@MOV R0, #1

loop: 
	CMP R3, R4
	BGT done

_write:
	MOV R0, #1		@ output is monitor
	LDR R1, =string 	@ address of string
	LDR R2, =len 		@ the number of chars to be printed
	MOV R7, #4		@ system call #4
	SWI 0

	ADD R3, R3, #1		@ incrementing i
	B loop

done: 
	MOV R0, R3	

_exit: 
	MOV R7, #1
	SWI 0


.data
string: 
	.asciz "Hello World\n"
len = .-string

	









