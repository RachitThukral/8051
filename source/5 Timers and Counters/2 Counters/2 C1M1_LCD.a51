;Program: Count the number of persons crossing using IR sensor connected at P3.5 (counter 1, mode 1) and display on LCD
E EQU P2.7
RS EQU P2.6
LCD EQU P0
ORG 00H
	MOV TMOD,#50H	;counter 1, mode 1
	MOV TL1,#00H
	MOV TH1,#00H
	SETB TR1	;enable counter 1
MAIN:
	ACALL LCD_INIT
AGAIN:	MOV R4, #80H
	ACALL LCD_COMMAND
	MOV A,TL1	;convert counter value to ASCII
	MOV B,#10	;display on LCD
	DIV AB
	MOV R3,B
	MOV B,#10
	DIV AB
	ADD A,#30H
	MOV R4, A
	ACALL LCD_DATA
	MOV A,B
	ADD A,#30H
	MOV R4, A
	ACALL LCD_DATA
	MOV A,R3
	ADD A,#30H
	MOV R4, A
	ACALL LCD_DATA
	AJMP AGAIN

LCD_INIT:
	CLR E
	CLR RS
	MOV R4, #38H	;Use 2 lines and 5�7 matrix for LCD
	ACALL LCD_COMMAND
	ACALL DELAY
	MOV R4, #0CH	;LCD ON, Cursor OFF
	ACALL LCD_COMMAND
	ACALL DELAY
	MOV R4, #01H	;LCD clear
	ACALL LCD_COMMAND
	ACALL DELAY
RET

LCD_COMMAND:	;Function for LCD command
	CLR RS
	MOV LCD, R4
	SETB E
	ACALL DELAY
	CLR E
RET
	
LCD_DATA:	;Function for LCD data
	SETB RS
	MOV LCD, R4
	SETB E
	ACALL DELAY
	CLR E
RET
	
DELAY:	;Function for delay
		MOV R7, #200
LOOP1:	MOV R6, #200
LOOP:	DJNZ R6, LOOP
		DJNZ R7, LOOP1
RET
END