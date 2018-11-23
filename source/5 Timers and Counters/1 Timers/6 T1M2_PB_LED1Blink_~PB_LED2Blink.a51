;Program: LED 1 blink 1s if Push button pressed and LED 2 blink 1s if not pressed using Timer 1, Mode 2
LED1 EQU P1.0
LED2 EQU P1.1
PB EQU P3.5
ORG 00H
	MOV TMOD,#02H	;Timer 0, mode 2(8-bit mode)
	MOV TH0,#06H	;TH0=06H, the high byte
	SETB TR0	;start the timer 0
MAIN:
	JB PB,LED_2
	CPL LED1
	SJMP DELAY
LED_2:	CPL LED2
DELAY:	MOV R6,#61
TIMES_61:	MOV R7,#60	;1 S Delay
TIMES_60:	JNB TF0,TIMES_60	;check for timer completion
	CLR TF0	;clear timer 0 flag
	DJNZ R7,TIMES_60
	DJNZ R6,TIMES_61
	SJMP MAIN
END