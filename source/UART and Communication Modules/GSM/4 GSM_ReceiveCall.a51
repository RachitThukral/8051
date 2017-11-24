;Program: Attend the call using GSM
ORG 00H
	MOV TMOD,#20H	;timer 1 mode 2
	MOV TH1,#0FDH	;9600 baud
	MOV SCON,#50H	;enable UART
	SETB TR1	;enable timer 1
MAIN:
	ACALL REC	;check for RING
	CJNE A,#'R',MAIN
	ACALL REC
	CJNE A,#'I',MAIN
	ACALL REC
	CJNE A,#'N',MAIN
	ACALL REC
	CJNE A,#'G',MAIN
	
	MOV A,#"A"	;attend the call
	ACALL SEND
	MOV A,#"T"
	ACALL SEND
	MOV A,#"A"
	ACALL SEND
	MOV A,#0DH
	ACALL SEND
	AJMP MAIN

SEND:	;UART send
	CLR TI
    MOV SBUF,A
WAIT:	JNB TI,WAIT
RET

REC:	;UART receive
	JNB RI,REC
	CLR RI
    MOV A,SBUF
RET
END