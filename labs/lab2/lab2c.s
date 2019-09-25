@ file lab2c.s converts 32 bits of a register in binary

.global _start

.data                                           @ data section of the program
bin:
    .ascii "00000000000000000000000000000000"


.text                                           @ code section of the program
_start:
    @ ldr r0, =val                                @ loading hex val into register r0
    ldr r0, =0xC0000034
    ldr r1, =bin                                @ loading blank binary
    mov r2, #31                                 @ r2 as loop counter with initial val 0
    mov r7, #31                                 @ last int

loop:
    cmp r2, #0                                @ loop 32 times for every digit 
    blt done                                    @ exit loop

    ldr r3, =0x00000001
    lsl r4, r3, r2
    tst r0, r4           @ test for bit at position r2 with 1
    bne incr                                    @ if after test, it is a zero, skip to incr

toggle: 
    mov r9, #49
    sub r8, r7, r2
    strb r9, [r1, +r8]                          @ inserting a one at position r2

incr:                                           @ increment portion of loop
    sub r2, r2, #1
    bal loop


done:                                           @ loop has ended
_write:
	mov r0, #1									@ output is monitor
	ldr r1, =bin								@ address of string
	mov r2, #32									@ the number of chars to be printed
	mov r7, #4									@ system call #4 for write
	SWI 0										@ software interrupt


_exit: 
    mov r7, #1									@ exit system call
	swi 0


