;Program: Make the buzzer sound when intruder detected
BUZZER EQU P2.0
PIR EQU P2.1
ORG 00H
	SETB PIR	;PIR as input
CHECK:
	JNB PIR, Buzzer_ON	;if motion detected
	CLR BUZZER	;turn ON Buzzer
	AJMP CHECK
Buzzer_ON:	SETB BUZZER	;else turn OFF Buzzer
	AJMP CHECK
END