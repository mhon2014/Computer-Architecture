@ File: lab0a.s

        .global _start

_start:
        @A SETA 1; 
        @B SETA 2;
        @C SETA 3;
        @D SETA 4;

        MOV R1, #1
        MOV R2, #2
        MOV R3, #3
        MOV R4, #4

        MLA R0, R2, R3, R1  @ multiplying B and C
        SUB R0, R0, R4  @ substracting D from B*C

	MOV R7, #1
	SWI 0 

