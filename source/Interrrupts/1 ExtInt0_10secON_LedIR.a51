;Program: Control an LED according to input from IR sensor. When external interrupt 0 is triggered, make the led OFF for 10 seconds using timer 1 mode 1
LED EQU P1.0
IR EQU P2.0
ORG 00H	;reset location
	AJMP MAIN

ORG 03H	;external interrupt 0 location
	AJMP ISR_EXT0

ORG 30H
MAIN:
	MOV IE,#81H	;enabble external interrput 0
	MOV TMOD,#10H	;timer 1, mode 1
CHECK:	JNB IR,LED_ON	;if IR=1,
	SETB LED	;LED OFF
	SJMP CHECK
LED_ON:	CLR LED	;if IR=0, LED ON
	SJMP CHECK
	
ISR_EXT0:	;ISR external 0
	SETB LED	;LED OFF for 10 sec
	MOV R0,#140
TIMES_140:			;10 S Delay
	ACALL DELAY_TIMER
	DJNZ R0,TIMES_140
RETI

DELAY_TIMER:	;delay using timer 1
	MOV TL1,#18H
	MOV TH1,#02H
	SETB TR1
AGAIN:	JNB TF1,AGAIN
	CLR TR1
	CLR TF1
RET
END