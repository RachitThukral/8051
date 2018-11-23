;Program: Display text "Rachit" on LCD without using busy flag
E EQU P2.7
RS EQU P2.6
LCD EQU P0
ORG 00H
MAIN:
	CLR E
	CLR RS
	MOV R4, #38H	;Use 2 lines and 5×7 matrix for LCD
	ACALL LCD_COMMAND
	ACALL DELAY
	MOV R4, #0CH	;LCD ON, Cursor OFF
	ACALL LCD_COMMAND
	ACALL DELAY
	MOV R4, #01H	;LCD clear
	ACALL LCD_COMMAND
	ACALL DELAY
	MOV R4, #'R'	;Display "Rachit" on LCD first row
	ACALL LCD_DATA
	MOV R4, #'a'
	ACALL LCD_DATA	
	MOV R4, #'c'
	ACALL LCD_DATA
	MOV R4, #'h'
	ACALL LCD_DATA
	MOV R4, #'i'
	ACALL LCD_DATA	
	MOV R4, #'t'
	ACALL LCD_DATA	
	AJMP MAIN
	
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