;Program: Count the number of times the switch is pressed at P3.4 (counter 0, mode 0) and display using 4 LEDs
LEDS EQU P1	;P1.3-P1.0
ORG 00H
	MOV TMOD,#04H	;counter 0, mode 0
	MOV TL0,#00H
	MOV TH0,#00H
	SETB TR1	;enable counter 0
AGAIN:
	MOV A,TL0	;counter value max 16
	MOV B,#16
	DIV AB
	MOV A,B
	XRL A,#0XFF	;logic for count on LEDs
	ORL A,0XF0
	MOV LEDS,A
	AJMP AGAIN
END