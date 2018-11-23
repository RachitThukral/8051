;Program: 1s square wave Timer 0, Mode 2
LED EQU P1.0
ORG 00H
	MOV TMOD,#02H	;Timer 0, mode 2(8-bit mode)
	MOV TH0,#06H	;TH0=06H
	SETB TR0	;start the timer 0
MIAN:
	CPL LED
	MOV R6,#61	;61*60=3660 actual=3686
TIMES_61:	MOV R7,#60	;1 S Delay
TIMES_60:	JNB TF0,TIMES_60	;check for timer completion
	CLR TF0	;clear timer 0 flag
	DJNZ R7,TIMES_60
	DJNZ R6,TIMES_61
	SJMP MAIN
END