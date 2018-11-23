;Program: 13.2.6.	Count the number of persons crossing using IR sensor connected at P1.0 (counter 2) and if count is multiple of 5, make the buzzer sound connected
BUZZER EQU P2.0
RCAP2L EQU 0CAH
RCAP2H EQU 0CBH
TL2 EQU 0CCH
TH2 EQU 0CDH
TR2 EQU 0CAH
TF2 EQU 0CFH
CP_RL2 EQU 0C8H
C_T2 EQU 0C9H
EXEN2 EQU 0CBH
EXF2 EQU 0CEH
ORG 00H
	MOV TL2,#00H
	MOV TH2,#00H
	SETB C_T2	;counter 2
	SETB TR2	;enable counter 2
AGAIN:
	MOV A,TL2
	MOV B,#5	;count divide by 5
	DIV AB
	MOV A,B
	JNZ BUZZER_OFF	;if count is multiple of 5
	CLR BUZZER	;then buzzer ON
	AJMP AGAIN
BUZZER_OFF:	SETB BUZZER	;else buzzer OFF
	AJMP AGAIN
END