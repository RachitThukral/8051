PUBLIC UART_INIT
PUBLIC UART_Tx
PUBLIC UART_Rx

SEG_UART SEGMENT CODE
	RSEG SEG_UART

UART_INIT:	;initialize UART
	MOV TMOD,#20H	;timer 1 mode 2
	MOV TH1,#0FDH	;9600 baud
	MOV SCON,#50H	;enable UART
	SETB TR1	;enable timer 1
RET

UART_Tx:	;send character using UART
	MOV SBUF,A	;transnit character
	HERE:	JNB TI,HERE	;wait for transmission
	CLR TI	;and clear TI
RET

UART_Rx:	;receive character using UART
	JNB RI,UART_Rx	;wait for reception
	MOV A,SBUF	;receive character
	CLR RI	;and clear RI
RET
END