;Program: Receive a character (y,n) from smartphone using Bluetooth and make the LED ON/OFF
LED EQU P1.0
ORG 00H
	MOV TMOD,#20H	;timer 1 mode 2
	MOV TH1,#0FDH	;9600 baud
	MOV SCON,#50H	;enable UART
	SETB TR1	;enable timer 1
MAIN:
	JNB RI,MAIN	;wait for reception
	CLR RI	;and clear RI
	MOV A,SBUF	;received character
	CJNE A,#'y',CHECK_n	;if charcter='y'
	CLR LED	;LED ON
CHECK_n:	CJNE A,#'n',MAIN	;if character='n'
	SETB LED	;LED OFF
	AJMP MAIN
END