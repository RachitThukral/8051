;Program: Car movement control(forward, backward, left, right) using DC motor
PB_F EQU P3.2
PB_B EQU P3.3
PB_L EQU P3.4
PB_R EQU P3.5
Motor EQU P2	;P2.3-P2.0
ORG 00H
	SETB PB_F	;make push buttons pins as input
	SETB PB_B
	SETB PB_L
	SETB PB_R	
CHECK_KB:	JNB PB_F, Motor_FW	;PB_F=0, jump for forward motion
	JNB PB_B, Motor_BW	;jump for backward motion
	JNB PB_L, Motor_LT	;jump for left motion
	JNB PB_R, Motor_RT	;jump for right motion
	MOV Motor, #11111111B	;else stop motor
	AJMP CHECK_KB
Motor_FW:	MOV Motor, #11111010B	;forward
	AJMP CHECK_KB
Motor_BW:	MOV Motor, #11110101B	;backward
	AJMP CHECK_KB
Motor_LT:	MOV Motor, #11110110B	;left
	AJMP CHECK_KB
Motor_RT:	MOV Motor, #11111001B	;right
	AJMP CHECK_KB
END