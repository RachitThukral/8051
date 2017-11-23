;Program: WAP to set alarm (exact time match) and corresponding interrupt on IRQ pin of RTC DS12887 and make buzzer sound for few seconds at the time of interrupt
BUZZER EQU P2.0
ORG 00H	;reset location
	LJMP MAIN
ORG 03H	;external interrrupt 0 location
	LJMP ISR_EXT0
	
MAIN:
	MOV IE,#81H	;enable external interrupt 0
	SETB TCON.1	;and make it edge triggered
	MOV R0,#10	;TURN ON OSC
	MOV A,#20H
	MOVX @R0,A
	MOV R0,#11	;BCD,24HRS
	MOV A,#0A3H
	MOVX @R0,A
	MOV R0,#00	;SET SECONDS
	MOV A,#00H
	MOVX @R0,A
	MOV R0,#02	;SET MINUTES
	MOV A,#30H
	MOVX @R0,A
	MOV R0,#4	;SET HOURS
	MOV A,#16H
	MOVX @R0,A
	MOV R0,#01	;SET ALARM SECONDS
	MOV A,#10H
	MOVX @R0,A
	MOV R0,#03	;SET ALARM MINUTES
	MOV A,#30H
	MOVX @R0,A
	MOV R0,#5	;SET ALARM HOURS
	MOV A,#16H
	MOVX @R0,A
	MOV R0,#11	;SET=B[7]=0 TO ALLOW UPDATE
	MOV A,#23H
	MOVX @R0,A
	
ISR_EXT0:	;ISR external 0
	SETB BUZZER
	ACALL DELAY
	ACALL DELAY
	ACALL DELAY
	CLR BUZZER
RETI

DELAY:	;Function for delay
		MOV R0, #10 ;
LOOP2:	MOV R1, #200 ;
LOOP1:	MOV R2, #200 ;
LOOP:	DJNZ R2, LOOP ;
		DJNZ R1, LOOP1 ;
		DJNZ R0, LOOP2 ;
RET
END