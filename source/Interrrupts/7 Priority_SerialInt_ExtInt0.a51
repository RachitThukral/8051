;Program: Turn ON/OFF LED when receiving y/n characters using serial interrupt and turn OFF LED when there is external interrupt 0 and observe the priority
LED EQU P1.0
ORG 00H	;reset location
	AJMP MAIN
	
ORG 03H	;external interrupt 0 location
	AJMP ISR_EXT0
	
ORG 23H	;serial interrupt location
	AJMP ISR_Serial

ORG 30H
MAIN:
	MOV IE,#91H	;enable EXT 0 and serial interrupts
HERE:	SJMP HERE

ISR_Serial:	;ISR serial
	MOV IE,#81H	;disable serial interrupt
	CLR RI
	MOV A,SBUF	;read received character
	CJNE A,#'y',NEXT	;if character='y'
	CLR LED	;LED ON
	SJMP NEXT1
NEXT:	CJNE A,#'n',NEXT1	;if character='y'
	SETB LED	;LED OFF
NEXT1:
	MOV IE,#91H	;enable  interrupts
RETI

ISR_EXT0:	;ISR external 0
	SETB LED
RETI
END