;Program: LED blink with 1 s delay using Timer0 mode 0
LED EQU P1.0
ORG 00H
	MOV TMOD,#00H	;Timer 0, mode 0(13-bit mode)
MAIN:
	CPL LED	;LED=OFF
	MOV R7,#112	;actual value=115
TIMES_112:	ACALL DELAY_TIMER	;1 S Delay
	DJNZ R7,TIMES_112
	SJMP MAIN

DELAY_TIMER:
	MOV TL0,#0C0H
	MOV TH0,#00H
	SETB TR0	;start the timer 0
	AGAIN:	JNB TF0,AGAIN	;check for timer completion
	CLR TR0	;stop timer 0
	CLR TF0	;clear timer 0 flag
	RET
END