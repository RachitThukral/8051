;Program: Blink an LED continuously. Use external interrupt 1 to stop blinking and turn off the LED
LED EQU P1.0
ORG 00H	;reset location
	AJMP MAIN

ORG 13H	;external interrupt 1 location
	AJMP ISR_EXT1

ORG 30H
MAIN:
	MOV IE,#84H	;enable external interrupt 1
BLINK:	;blink LED
	SETB LED
	ACALL DELAY
	CLR LED
	ACALL DELAY
	AJMP BLINK
	
DELAY:	;Function for delay
		MOV R7, #10
LOOP2:	MOV R6, #200
LOOP1:	MOV R5, #200
LOOP:	DJNZ R5, LOOP
		DJNZ R6, LOOP1
		DJNZ R7, LOOP2
RET
	
ISR_EXT1:	;ISR external 1
	SETB LED	;Turn OFF LED
RETI
END