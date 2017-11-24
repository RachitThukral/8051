;Program: Transmit a string (ending with ‘.’ character) using bluetooth
ORG 00H
MOV TMOD,#20H	;timer 1 mode 2
MOV TH1,#0FDH	;9600 baud
MOV SCON,#50H	;enable UART
SETB TR1	;enable timer 1
MOV DPTR,#STRING	;initiaize DPTR to string address
MAIN:
	MOV A,#0
	MOVC A,@A+DPTR	;characters to be send
	CJNE A,#'.',SEND	;check for end character and
	MOV DPTR,#STRING	;initiaize DPTR to string address
	ACALL DELAY
	SJMP MAIN
SEND:	MOV SBUF,A	;send character
HERE:	JNB TI,HERE
	CLR TI
	INC DPTR	;next character
	AJMP MAIN

DELAY:	;Function for delay
		MOV R7, #10
LOOP2:	MOV R6, #200
LOOP1:	MOV R5, #200
LOOP:	DJNZ R5, LOOP
		DJNZ R6, LOOP1
		DJNZ R7, LOOP2
RET

STRING:
DB 'BT using 8051.'
END