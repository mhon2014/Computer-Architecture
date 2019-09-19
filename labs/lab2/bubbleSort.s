	.arch armv6
	.eabi_attribute 28, 1
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 6
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"bubbleSort.c"
	.section	.rodata
	.align	2
.LC0:
	.byte	53
	.byte	51
	.byte	56
	.byte	49
	.byte	50
	.byte	57
	.text
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu vfp
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	ldr	r2, .L3
	sub	r3, fp, #12
	ldm	r2, {r0, r1}
	str	r0, [r3]
	add	r3, r3, #4
	strh	r1, [r3]	@ movhi
	sub	r3, fp, #12
	mov	r1, #6
	mov	r0, r3
	bl	printArray
	sub	r3, fp, #12
	mov	r1, #6
	mov	r0, r3
	bl	bubbleSort
	sub	r3, fp, #12
	mov	r1, #6
	mov	r0, r3
	bl	printArray
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
.L4:
	.align	2
.L3:
	.word	.LC0
	.size	main, .-main
	.align	2
	.global	bubbleSort
	.syntax unified
	.arm
	.fpu vfp
	.type	bubbleSort, %function
bubbleSort:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L6
.L10:
	mov	r3, #0
	str	r3, [fp, #-12]
	b	.L7
.L9:
	ldr	r3, [fp, #-12]
	ldr	r2, [fp, #-16]
	add	r3, r2, r3
	ldrb	r2, [r3]	@ zero_extendqisi2
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	ldr	r1, [fp, #-16]
	add	r3, r1, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r2, r3
	bls	.L8
	ldr	r3, [fp, #-12]
	ldr	r2, [fp, #-16]
	add	r0, r2, r3
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	ldr	r2, [fp, #-16]
	add	r3, r2, r3
	mov	r1, r3
	bl	swap
.L8:
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L7:
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-8]
	sub	r3, r2, r3
	sub	r2, r3, #1
	ldr	r3, [fp, #-12]
	cmp	r2, r3
	bgt	.L9
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L6:
	ldr	r3, [fp, #-20]
	sub	r2, r3, #1
	ldr	r3, [fp, #-8]
	cmp	r2, r3
	bgt	.L10
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
	.size	bubbleSort, .-bubbleSort
	.align	2
	.global	swap
	.syntax unified
	.arm
	.fpu vfp
	.type	swap, %function
swap:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #20
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	ldr	r3, [fp, #-16]
	ldrb	r3, [r3]
	strb	r3, [fp, #-5]
	ldr	r3, [fp, #-20]
	ldrb	r2, [r3]	@ zero_extendqisi2
	ldr	r3, [fp, #-16]
	strb	r2, [r3]
	ldr	r3, [fp, #-20]
	ldrb	r2, [fp, #-5]
	strb	r2, [r3]
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	swap, .-swap
	.section	.rodata
	.align	2
.LC1:
	.ascii	" %c,\000"
	.align	2
.LC2:
	.ascii	" ]\000"
	.text
	.align	2
	.global	printArray
	.syntax unified
	.arm
	.fpu vfp
	.type	printArray, %function
printArray:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	mov	r0, #91
	bl	putchar
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L13
.L14:
	ldr	r3, [fp, #-8]
	ldr	r2, [fp, #-16]
	add	r3, r2, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	mov	r1, r3
	ldr	r0, .L15
	bl	printf
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L13:
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-20]
	cmp	r2, r3
	blt	.L14
	ldr	r0, .L15+4
	bl	puts
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
.L16:
	.align	2
.L15:
	.word	.LC1
	.word	.LC2
	.size	printArray, .-printArray
	.ident	"GCC: (Raspbian 6.3.0-18+rpi1+deb9u1) 6.3.0 20170516"
	.section	.note.GNU-stack,"",%progbits
