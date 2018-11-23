;Program: 1s square wave using Timer1 mode 0
LED EQU P1.0
PB EQU P3.5
ORG 00H
	MOV TMOD,#00H			;Timer 0, mode 0(13-bit mode)
MAIN:
	JB PB,MAIN
	CPL LED
	MOV R7,#112
TIMES_112:	ACALL DELAY_TIMER	;1 S Delay
	DJNZ R7,TIMES_112
	SJMP HERE

DELAY_TIMER:
	MOV TL1,#0C0H
	MOV TH1,#00H
	SETB TR1	;start the timer
	AGAIN:	JNB TF1,AGAIN	;check for timer completion
	CLR TR1	;stop timer
	CLR TF1	;clear timer flag
RET
END