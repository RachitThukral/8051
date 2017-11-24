;Program: Generate a triangular wave using DAC0808/MC1408
DAC EQU P1
ORG 00H
	MOV A,#0
UP:	MOV DAC,A	;0 to 255
	INC A
	CJNE A,#255,UP
DOWN: MOV DAC,A	;255 to 0
	DEC A
	CJNE A,#0,DOWN
	SJMP UP
END