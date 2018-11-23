;Program: Turn on DC Fan when Push Button is pressed
PB EQU P3.5
FAN EQU P2.0
ORG 00H
	SETB PB	;Push Button as input
CHECK:
	JNB PB, FAN_ON	;if Button not pressed,
	CLR FAN	;turn off DC Fan
	AJMP CHECK
FAN_ON:	SETB FAN	;else turn on DC Fan
	AJMP CHECK
END