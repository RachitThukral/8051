;Program: Turn ON LEDs if light is not sufficient
LEDS EQU P1	;P1.3-P1.0
LDR EQU P2.0
ORG 00H
	SETB LDR	;LDR as input
CHECK:
	JNB LDR, LED_ON	;if natural light present
	MOV LEDS,#255	;turn off LEDs
	AJMP CHECK
LED_ON:	MOV LEDS,#0	;else turn on LEDs
	AJMP CHECK
END