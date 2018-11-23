;Program: Direction of rotation of DC motor
PB_CW EQU P3.2
PB_CCW EQU P3.5
M0 EQU P2.0
M1 EQU P2.1
ORG 00H
	SETB PB_CW	;make push buttons pins as input
	SETB PB_CCW
CHECK_KB:	JNB PB_CW, Motor_CW	;jump for clockwise
	JNB PB_CCW, Motor_CCW	;jump for counter clockwise
	SETB M1	;else stop motor
	SETB M0
	AJMP CHECK_KB
Motor_CW:	SETB M1	;clockwise rotation
	CLR M0
	AJMP CHECK_KB
Motor_CCW:	CLR M1	;counter clockwise rotation
	SETB M0
	AJMP CHECK_KB
END
