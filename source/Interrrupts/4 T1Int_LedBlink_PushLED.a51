;Program: Control the LED using switch while simultaneously blink another LED using timer 1 (mode 1) interrupt
LED_INT EQU P1.0
LED EQU P1.1
SWITCH EQU P3.2
ORG 00H	;reset location
	AJMP MAIN

ORG 1BH	;timer 1 interrupt location
	AJMP ISR_T1

ORG 30H
MAIN:
	MOV IE,#88H	;enable timer 1 interrupt
	MOV TMOD,#10H	;timer 1, mode 1
	MOV TH1,#0	;initialize timer 1
	MOV TL1,#0
	SETB TR1	;start timer 1
HERE:	JNB SWITCH,LED_ON	;if switch not pressed
	SETB LED	;LED OFF
	SJMP HERE
LED_ON: CLR LED	;if switch pressed, LED ON
	SJMP HERE

ISR_T1:	;ISR timer 1
	CPL LED_INT	;complement LED
	CLR TF0	;reset timer flag
RETI
END