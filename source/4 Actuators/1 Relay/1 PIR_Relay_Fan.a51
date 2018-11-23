;Program: WAP to turn on the fan using when there is motion in the room
RELAY_FAN EQU P2.0
PIR EQU P2.1
ORG 00H
	SETB PIR	;PIR as input
CHECK:
	JNB PIR, Fan_OFF	;if motion detected,
	CLR RELAY_FAN	;turn ON Fan
	AJMP CHECK
Fan_OFF:	SETB RELAY_FAN	;else turn OFF Fan
	AJMP CHECK
END