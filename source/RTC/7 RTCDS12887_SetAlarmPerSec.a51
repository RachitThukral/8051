;Program: WAP to generate alarm interrupt every half second on IRQ pin of RTC DS12887 and make the LED blink
ORG 00H	;reset location
	LJMP MAIN
	
MAIN:
	MOV R0,#10	;TURN ON OSC
	MOV A,#2FH
	MOVX @R0,A
	MOV R0,#11	;BCD,24HRS,2Hz on IRQ pin
	MOV A,#43H
	MOVX @R0,A
	SJMP $
END