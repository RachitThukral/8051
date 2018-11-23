;Program: LED 2s ON 1s OFF using Timer0 mode 1
LED EQU P1.0
ORG 00H
	MOV TMOD,#01H			;Timer 0, mode 1(16-bit mode)
MAIN:
	CLR LED			;LED=OFF
	MOV R7,#14
TIMES_28:	ACALL DELAY_TIMER	;2 S Delay
	DJNZ R7,TIMES_28
	SETB LED			;LED=ON
	MOV R7,#14
TIMES_14:	ACALL DELAY_TIMER	;1 S Delay
	DJNZ R7,TIMES_14
	SJMP MAIN

DELAY_TIMER:
	MOV TL0,#18H
	MOV TH0,#02H
	SETB TR0	;start the timer 0
AGAIN:	JNB TF0,AGAIN	;check for timer completion
	CLR TR0	;stop timer 0
	CLR TF0	;clear timer 0 flag
RET
END