;Program: Rotate bipolar stepper motor using double coil 4 steps
Stepper EQU P2	;P2.3-P2.0
ORG 00H
MAIN:
	MOV Stepper,#11111010B	;steps for bipolar stepper
	ACALL DELAY
	MOV Stepper,#11110110B
	ACALL DELAY
	MOV Stepper,#11110101B
	ACALL DELAY
	MOV Stepper,#11111001B
	ACALL DELAY
	AJMP MAIN
	
DELAY:	;Function for delay
		MOV R1, #10
LOOP1:	MOV R2, #200
LOOP:	DJNZ R2, LOOP
		DJNZ R1, LOOP1
RET
END