;Program: Rotate unipolar stepper motor using double coil 4 steps
Stepper EQU P2	;P2.3-P2.0
ORG 00H
	MOV A,#00110011B	;initial value for stepper
MAIN:
	MOV Stepper,A
	RR A	;Rotate for next step
	ACALL DELAY
	AJMP MAIN
	
DELAY:	;Function for delay
		MOV R1, #200
LOOP1:	MOV R2, #200
LOOP:	DJNZ R2, LOOP
		DJNZ R1, LOOP1
RET
END