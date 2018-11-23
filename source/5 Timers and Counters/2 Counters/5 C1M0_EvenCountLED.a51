;Program: Count the number of times the switch is pressed at P3.5 (counter 1, mode 0) and if count is even than glow LED
LED EQU P1.0
ORG 00H
	MOV TMOD,#40H	;counter 1, mode 0
	MOV TH1,#00H
	MOV TL1,#00H
	SETB TR1	;enable counter 1
AGAIN:
	MOV A,TL0
	MOV B,2
	DIV AB
	MOV A,B
	JNZ LED_OFF	;if count=even
	CLR LED	;then LED ON
	AJMP AGAIN
LED_OFF:	SETB LED	;else LED OFF
	AJMP AGAIN
END