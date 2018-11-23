;Program: Control Buzzer with Push Button
PB EQU P3.5
BUZZER EQU P2.0
ORG 00H
	SETB PB	;Push Button as input
CHECK:
	JNB PB, Buzzer_ON	;if Push Button not pressed
	SETB BUZZER	;turn OFF Buzzer
	AJMP CHECK
Buzzer_ON:	CLR BUZZER	;else turn ON Buzzer
	AJMP CHECK
END