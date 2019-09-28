@ File: addfp.s

	.global main
	.func main

main:
	PUSH {R0, LR}
	LDR R0, =enterFirst
	BL printf

	SUB SP, SP, #8
	LDR R0, =inputFormat
	MOV R1, SP
	BL scanf
	VLDR S1, [SP]
	VCVT.F64.F32 D1, S1

	LDR R0, =enterSecond
	BL printf

	SUB SP, SP, #8
	LDR R0, =inputFormat
	MOV R1, SP
	BL scanf
	VLDR S2, [SP]
	VCVT.F64.F32 D2, S2

	VADD.F64 D0, D1, D2
	VMOV R2, R3, D0

	LDR R0, =result
	BL printf

	LDR R0, =result2
	VCMP.F64 D1, D2
	VMRS APSR_nzcv, FPSCR
	VMOVHS R2, R3, D1
	VMOVLS R2, R3, D2
	SUB SP, SP, #8
	VSTRHS D2, [SP]
	VSTRLS D1, [SP]
	BL printf

	ADD SP, SP, #24
	POP {R0, PC}
	MOV PC, LR

.data
enterFirst:  .asciz "Enter the first number: "
enterSecond: .asciz "Enter the second number: "
inputFormat: .asciz "%f"
result:      .asciz "The result of adding is: %f.\n"
result2:		 .asciz "%f is greater than %f\n\n"

