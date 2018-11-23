;Program: Control direction of rotation of unipolar stepper motor using single coil 4 steps
Stepper EQU P2	;P2.3-P2.0
PB_CW EQU P3.2
PB_CCW EQU P3.5
ORG 00H
	MOV A,#01110111B	;initial value for stepper
MAIN:
	JNB PB_CW,STEPPER_CW
	JNB PB_CCW,STEPPER_CCW
	AJMP MAIN
STEPPER_CW:	RR A	;Rotate for next step
	MOV Stepper,A	;mov values for stepper to Stepper
	ACALL DELAY
	AJMP MAIN
STEPPER_CCW:	RL A	;Rotate for next step
	MOV Stepper,A	;mov values to Stepper
	ACALL DELAY
	AJMP MAIN

DELAY:	;Function for delay
		MOV R1, #200
LOOP1:	MOV R2, #200
LOOP:	DJNZ R2, LOOP
		DJNZ R1, LOOP1
RET
END