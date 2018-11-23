;Program: Turn ON LED when push button is pressed and make the buzzer sound when touch sensor is touched
LED EQU P1.0
PB EQU P3.2
BUZZER EQU P2.0
TOUCH EQU P2.1
ORG 00H
	SETB PB	;Push Button as input
	SETB TOUCH	;Touch as input
CHECK:	JNB PB, LED_ON	;if push button not pressed
	SETB LED	;turn OFF LED
	AJMP CHECK_Touch
LED_ON:	CLR LED	;else turn ON LED
CHECK_Touch:	JNB TOUCH, Buzzer_OFF	;if Touch detected
	CLR BUZZER	;turn ON Buzzer
	AJMP CHECK
Buzzer_OFF:	SETB BUZZER	;else turn OFF Buzzer
	AJMP CHECK
END