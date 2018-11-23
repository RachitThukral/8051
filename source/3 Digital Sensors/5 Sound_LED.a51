;Program: WAP to turn ON an LED to indicate the detection of sound
LED EQU P1.0
SOUND EQU P2.0
	
ORG 00H
	SETB SOUND	;sound sensor as input
CHECK:
	JNB SOUND, LED_ON	;if sound detected
	CLR LED	;turn ON LED
	AJMP CHECK
LED_ON:	SETB LED	;else turn OFF LED
	AJMP CHECK
END