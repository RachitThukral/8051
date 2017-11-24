;Program: Read GPS data and dislay latitude and longitude on LCD
E EQU P2.7
RS EQU P2.6
LCD EQU P0
ORG 00H
	MOV TMOD,#20H	;timer 1 mode 2
	MOV TH1,#0FDH	;9600 baud
	MOV SCON,#50H	;8N1, enable UART Rx
	SETB TR1	;enable timer 1
	ACALL LCD_INIT
MAIN:
	ACALL Rx_data	;start string $GPRMC
	CJNE A,#'$',MAIN
	ACALL Rx_data
	CJNE A,#'G',MAIN
	ACALL Rx_data
	CJNE A,#'P',MAIN
	ACALL Rx_data
	CJNE A,#'R',MAIN
	ACALL Rx_data
	CJNE A,#'M',MAIN
	ACALL Rx_data
	CJNE A,#'C',MAIN
HERE:	ACALL Rx_data	;ignore other fields
	CJNE A,#',',HERE
HERE1:	ACALL Rx_data
	CJNE A,#',',HERE1
	ACALL Rx_data
	CJNE A,#'A',MAIN
HERE2:	ACALL Rx_data
	CJNE A,#',',HERE2	//checking for “A” condition
	MOV  R0,#30H
	MOV R1,#11
LAT:	;Rx_dataeive laitude data
	ACALL Rx_data
	MOV @R0,A
	DJNZ R1,LAT
HERE3:	ACALL Rx_data
	CJNE A,#',',HERE3
	MOV R1,#12
LONG:	;Rx_dataeive longitude data
	ACALL Rx_data
	MOV @R0,A
	DJNZ R1,LONG
	MOV R4, #80H
	ACALL LCD_COMMAND
	
LCD_DISP:	;display latitude on LCD row 1
	MOV R0,30H
	MOV R1,#11
LAT_DISP:
	MOV A,@R0
	INC R0
	MOV R4,A
	ACALL LCD_DATA
	DJNZ R1,LAT_DISP
	
	MOV R4, #0C0H	;display longitude on LCD row 2
	ACALL LCD_COMMAND
	MOV R1,#12
LONG_DISP:
	MOV A,@R0
	INC R0
	MOV R4,A
	ACALL LCD_DATA
	DJNZ R1,LONG_DISP
	AJMP MAIN
	
LCD_INIT:
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

SEND: ;UART send
	CLR TI
    MOV SBUF,A
WAIT:	JNB TI,WAIT
RET

Rx_data:	;UART Rx
	WAIT1:	JNB RI,WAIT1
	CLR RI
    MOV A,SBUF
RET
END