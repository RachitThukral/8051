;Program: Turn ON Bulb 1(high intensity) if light not sufficient, else Bulb 2(low intensity)
RELAY_BULB EQU P2.0
LDR EQU P2.1
	ORG 00H
	SETB LDR	;LDR as input
CHECK:
	JNB LDR,Bulb2_ON	;if light intensity is low,
	SETB RELAY_BULB	;turn ON Bulb 1
	AJMP CHECK
Bulb2_ON:	CLR RELAY_BULB	;else turn on Bulb 2
	AJMP CHECK
END