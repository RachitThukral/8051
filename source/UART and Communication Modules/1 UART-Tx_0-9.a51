;Program: Tx 0 to 9 using UART
ORG 00H
MOV TMOD,#20H	;timer 1 mode 2
MOV TH1,#0FDH	;9600 baud
MOV SCON,#50H	;enable UART
SETB TR1	;enable timer 1
MAIN:
	MOV A,#0
	MOV R1,#10	;count
AGAIN:	MOV SBUF,A	;transnit number
HERE:	JNB TI,HERE	;wait for transmission
	CLR TI	;and clear TI
	INC A	;next number
	ACALL DELAY
	DJNZ R1,AGAIN	;decrement count
	AJMP MAIN

DELAY:	;Function for delay
		MOV R7, #10
LOOP2:	MOV R6, #200
LOOP1:	MOV R5, #200
LOOP:	DJNZ R5, LOOP
		DJNZ R6, LOOP1
		DJNZ R7, LOOP2
RET
END