;Program: Timer 0, Mode 2 – LED blink 1s, Buzzer when LED OFF
LED EQU P1.0
BUZZER EQU P2.0
ORG 00H
	MOV TMOD,#02H	;Timer 0, mode 2(8-bit mode)
	MOV TH0,#06H	;TH0=06H, the high byte
	SETB TR0	;start the timer 0
	CLR LED
	SETB BUZZER
MAIN:
	CPL LED
	CPL BUZZER
	MOV R6,#61	;61*60=3660 actual=3686
TIMES_61_1:	;1 S Delay
	MOV R7,#60
TIMES_60_1:	JNB TF0,TIMES_60_1	;check for timer completion
	CLR TF0	;clear timer 0 flag
	DJNZ R7,TIMES_60_1
	DJNZ R6,TIMES_61_1
	SJMP MAIN
END