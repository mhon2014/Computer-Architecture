@ File: lab2a.s

	.global _start

_start:

_exit:
	MOV R7, #1
	SWI 0

.data
	array:
		.ascii "538129"