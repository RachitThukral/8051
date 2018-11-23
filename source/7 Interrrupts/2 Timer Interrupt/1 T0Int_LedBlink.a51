;Program: LED blink using timer 0 interrupt
LED EQU P1.0
ORG 00H	;reset location
	AJMP MAIN

ORG 0BH	;timer 0 interrupt location
	AJMP ISR_T0

ORG 30H
MAIN:
	MOV IE,#82H	;enable timer 0 interrupt
	MOV TMOD,#01H	;timer 0, mode 1
	MOV TH0,#0	;initialize timer 0
	MOV TL0,#0
	SETB TR0	;start timer 0
HERE:	SJMP HERE
	
ISR_T0:	;ISR timer 0
	CPL LED	;complement LED
	CLR TF0	;reset timer flag
RETI
END