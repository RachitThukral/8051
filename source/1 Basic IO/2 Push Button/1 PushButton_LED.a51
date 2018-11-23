;Program: Control LED with Push Button
PB EQU P3.5
LED EQU P1.0
ORG 00H
	SETB PB	;Push Button as input
CHECK:
	JNB PB, LED_ON	;if push button not pressed
	SETB LED	;then turn off LED 
	AJMP CHECK
LED_ON:	CLR LED	;else turn on LED
	AJMP CHECK
	END