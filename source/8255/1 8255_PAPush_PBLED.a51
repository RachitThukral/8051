;Program: Read the push buttons state connected to port A and indicate on LEDs on port B of 8255
PB EQU 0000H	;PORTA_8255
LED EQU 0001H	;PORTB_8255
PORTC_8255 EQU 0002H	;PORTC_8255
CTRL_8255 EQU 0003H	;CTRL_8255
	
ORG 00H
	MOV DPTR,#CTRL_8255	;control register
	MOV A,#90H	;port A=IN, port B=out
	MOVX @DPTR,A
AGAIN:
	MOV DPTR,#PB	;read push buttons
	MOVX A,@DPTR
	MOV DPTR,#LED	;indicate on LEDs
	MOVX @DPTR,A
	SJMP AGAIN
END