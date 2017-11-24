;Program: Generate 5-steps staircase wave using DAC0808/MC1408
DAC EQU P1
ORG 00H
	MOV A,#0
STAIR:	MOV DAC,A
	ACALL DELAY
RPT:	ADD A,#51	;next step
	MOV DAC,A
	ACALL DELAY
	CJNE A,#255, RPT
	SJMP STAIR
	
DELAY:	;Function for delay
		MOV R7, #200
LOOP1:	MOV R6, #200
LOOP:	DJNZ R6, LOOP
		DJNZ R7, LOOP1
RET
END