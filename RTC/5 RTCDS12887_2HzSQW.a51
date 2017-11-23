;Program: WAP to generate a square wave with frequency 2 Hz on SQW pin of RTC DS12887
ORG 00H
	MOV R0,#10	;TURN ON OSC and 2Hz SQW
	MOV A,#2FH
	MOVX @R0,A
	MOV R0,#11	;Enable SQW
	MOVX A,@R0
	SETB ACC.3
	MOVX @R0,A
END