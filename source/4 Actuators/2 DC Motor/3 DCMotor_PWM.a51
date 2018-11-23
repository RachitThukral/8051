;Program: DC motor speed control using PWM
PB_25 EQU P3.2
PB_50 EQU P3.5
PB_75 EQU P3.6
PB_100 EQU P3.7
M1 EQU P2.1
M0 EQU P2.0
ORG 00H
	SETB PB_25	;make push buttons pins as input
	SETB PB_50
	SETB PB_75
	SETB PB_100
	SETB M1	;initially motor stopped
	SETB M0
CHECK_KB:	JNB PB_25, PWM_25	;jump for 25% duty cycle
	JNB PB_50, PWM_50	;jump for 50% duty cycle
	JNB PB_75, PWM_75	;jump for 75% duty cycle
	JNB PB_100, PWM_100	;jump for 100% duty cycle
	SETB M0	;else stop motor
	AJMP CHECK_KB
PWM_25:	CLR M0	;25% duty cycle
	MOV R0,#25	;Motor ON for 25 count
HERE25:	DJNZ R0,HERE25
	SETB M0
	MOV R0,#75	;Motor OFF for 75 count
HERE_25:	DJNZ R0,HERE_25
	AJMP CHECK_KB
PWM_50:	CLR M0	;50% duty cycle
	MOV R0,#50	;Motor ON for 50 count
HERE50:	DJNZ R0,HERE50
	SETB M0
	MOV R0,#50	;Motor OFF for 50 count
HERE_50:	DJNZ R0,HERE_50
	AJMP CHECK_KB
PWM_75:	CLR M0	;75% duty cycle
	MOV R0,#75	;Motor ON for 75 count
HERE75:	DJNZ R0,HERE75
	SETB M0
	MOV R0,#25	;Motor OFF for 25 count
HERE_75:	DJNZ R0,HERE_75
	AJMP CHECK_KB
PWM_100:	CLR M0	;100% duty cycle
	MOV R0,#100	;Motor ON for 100 count
HERE100:	DJNZ R0,HERE100
	AJMP CHECK_KB
END