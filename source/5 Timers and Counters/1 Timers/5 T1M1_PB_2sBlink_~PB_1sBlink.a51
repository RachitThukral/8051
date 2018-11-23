;Program: LED blink 2s if Push button pressed, LED blink 0.5s if not pressed using Timer 1, Mode 1
LED EQU P1.0
PB EQU P3.5
ORG 00H
	MOV TMOD,#10H	;Timer 1, mode 1(16-bit mode)
MIAN:
	CPL LED
	JNB PB,DELAY_2S
	MOV R7,#7
TIMES_7:	ACALL DELAY_TIMER	;0.5 S Delay
	DJNZ R7,TIMES_7
	SJMP HERE
DELAY_2S:	MOV R7,#28
TIMES_28:	ACALL DELAY_TIMER	;2 S Delay
	DJNZ R7,TIMES_28
	SJMP HERE

DELAY_TIMER:
	MOV TL1,#18H
	MOV TH1,#02H
	SETB TR1	;start the timer 1
AGAIN:	JNB TF1,AGAIN	;check for timer completion
	CLR TR1	;stop timer 1
	CLR TF1	;clear timer 1 flag
	RET
END