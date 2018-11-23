;Program:13.2.4.	Count the number of times the switch is pressed at P3.4 (counter 0, mode 2) and if count is greater than 10 than glow LED
LED EQU P1.0
ORG 00H
	MOV TMOD,#06H	;counter 0, mode 2
	MOV TH0,#00H
	SETB TR0	;enable counter 0
AGAIN:
	MOV A,TL0
	CLR C
	SUBB A,#10	;if counter value>10
	JC LED_OFF
	CLR LED	;then LED ON
	AJMP AGAIN
LED_OFF:	SETB LED	;else LED OFF
	AJMP AGAIN
END