;Program: Blink LED1 using timer 1 (mode 1) interrupt and turn ON LED2 when there is external interrupt 0 and observe the priority
LED1 EQU P1.0
LED2 EQU P1.1
ORG 00H	;reset location
	AJMP MAIN
	
ORG 03H	;external interrupt 0 location
	AJMP ISR_EXT0
	
ORG 0BH	;timer 1 interrupt location
	AJMP ISR_T1

ORG 30H
MAIN:
	MOV IE,#89H	;enable EXT 0 and TIM 1 interrupts
	MOV TMOD,#10H	;timer 1, mode 1
	MOV TH1,#0
	MOV TL1,#0
	SETB TR1
HERE:	SJMP HERE

ISR_T1:	;ISR timer 1
	CPL LED1	;blink LED1
	CLR TF1
RETI

ISR_EXT0:	;ISR external 0
	CLR LED2	;turn ON LED 2
	ACALL DELAY
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