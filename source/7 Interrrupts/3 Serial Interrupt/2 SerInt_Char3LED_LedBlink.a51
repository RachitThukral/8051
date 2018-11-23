;Program: Blink an LED continuously with some delay. Make one of the 3 LEDs ON according to the character received (‘1’, ‘2’, ‘3’) on serial port
LED EQU P1.0
LED1 EQU P1.1
LED2 EQU P1.2
LED3 EQU P1.3
ORG 00H	;reset location
	AJMP MAIN

ORG 23H	;serial interrupt location
	AJMP ISR_Serial

ORG 30H
MAIN:
	MOV IE,#90H	;enable serial interrupt
	MOV TMOD,#20H	;timer 1 mode 2
	MOV TH1,#0FDH	;timer 1 settings for serial
	MOV SCON,#50H
	SETB TR1
HERE:
	CPL LED	;LED blink
	ACALL DELAY
	SJMP HERE
	
ISR_Serial:	;ISR serial
	MOV IE,#00H	;disable interrupts
	CLR RI
	MOV A,SBUF	;read received character
	CJNE A,#'1',TWO	;check recived character and
	CLR LED1	;turn ON corresponding LED
	SETB LED2
	SETB LED3
TWO:	CJNE A,#'2',THREE
	CLR LED2
	SETB LED1
	SETB LED3
THREE:	CJNE A,#'2',LAST
	CLR LED3
	SETB LED1
	SETB LED2
LAST:	MOV IE,#90H	;enable interrupts
RETI

DELAY:	;Function for delay
		MOV R7, #10
LOOP2:	MOV R6, #200
LOOP1:	MOV R5, #200
LOOP:	DJNZ R5, LOOP
		DJNZ R6, LOOP1
		DJNZ R7, LOOP2
RET
END