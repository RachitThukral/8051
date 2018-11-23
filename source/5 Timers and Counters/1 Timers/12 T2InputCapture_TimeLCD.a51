RCAP2L EQU 0CAH
RCAP2H EQU 0CBH
TL2 EQU 0CCH
TH2 EQU 0CDH
TR2 EQU 0CAH
TF2 EQU 0CFH
CP_RL2 EQU 0C8H
EXEN2 EQU 0CBH
EXF2 EQU 0CEH
E EQU P2.7
RS EQU P2.6
LCD EQU P0
T2EX EQU P1.1
ORG 00H
	CLR E
	CLR RS
	MOV R4, #38H			;Use 2 lines and 5×7 matrix for LCD
	ACALL LCD_COMMAND
	ACALL DELAY
	MOV R4, #0CH			;LCD ON, Cursor OFF
	ACALL LCD_COMMAND
	ACALL DELAY
	MOV R4, #01H			;LCD clear
	ACALL LCD_COMMAND
	ACALL DELAY
	
MAIN:
	MOV TL2,#00H			;TL2=00H, low byte
	MOV TH2,#00H			;TH2=00H, high byte
HERE:	JNB T2EX,HERE
HERE1:	JB T2EX,HERE1
	SETB CP_RL2
	SETB EXEN2
	SETB TR2			;start the timer 2
HERE2:	JNB EXF2,HERE2
	CLR TR2
	CLR EXF2
	MOV R1,RCAP2H
	MOV R0,RCAP2L
	
	MOV R2,#10
	MOV R3,#0
	ACALL UDIV16
	MOV 31H,R2
	MOV R2,#10
	MOV R3,#0
	ACALL UDIV16
	MOV 32H,R2
	MOV R2,#10
	MOV R3,#0
	ACALL UDIV16
	MOV 33H,R2
	MOV R2,#10
	MOV R3,#0
	ACALL UDIV16
	MOV 34H,R2
	MOV 35H,R0
	
	MOV R4,#80H
	ACALL LCD_COMMAND
	MOV R0,#5
LCD_DISPLAY:
	MOV A,#0
	ADD A,R0
	MOV R1,A
	MOV A,@R1
	ADD A,#30H
	MOV R4,A
	ACALL LCD_DATA
	DJNZ R0,LCD_DISPLAY
	AJMP MAIN


;====================================================================
; subroutine UDIV16
; 16-Bit / 16-Bit to 16-Bit Quotient & Remainder Unsigned Divide
;
; input:    r1, r0 = Dividend X
;           r3, r2 = Divisor Y
;
; output:   r1, r0 = quotient Q of division Q = X / Y
;           r3, r2 = remainder 
;
; alters:   acc, B, dpl, dph, r4, r5, r6, r7, flags
;====================================================================

UDIV16:        mov     r7, #0          ; clear partial remainder
               mov     r6, #0
               mov     B, #16          ; set loop count

div_loop:
	clr     C               ; clear carry flag
	mov     a, r0           ; shift the highest bit of
	rlc     a               ; the dividend into...
	mov     r0, a
	mov     a, r1
	rlc     a
	mov     r1, a
	mov     a, r6           ; ... the lowest bit of the
	rlc     a               ; partial remainder
	mov     r6, a
	mov     a, r7
	rlc     a
	mov     r7, a
	mov     a, r6           ; trial subtract divisor
	clr     C               ; from partial remainder
	subb    a, r2
	mov     dpl, a
	mov     a, r7
	subb    a, r3
	mov     dph, a
	cpl     C               ; complement external borrow
	jnc     div_1           ; update partial remainder if
						   ; borrow
	mov     r7, dph         ; update partial remainder
	mov     r6, dpl
div_1:         mov     a, r4           ; shift result bit into partial
	rlc     a               ; quotient
	mov     r4, a
	mov     a, r5
	rlc     a
	mov     r5, a
	djnz    B, div_loop
	mov     a, r5           ; put quotient in r0, and r1
	mov     r1, a
	mov     a, r4
	mov     r0, a
	mov     a, r7           ; get remainder, saved before the
	mov     r3, a           ; last subtraction
	mov     a, r6
	mov     r2, a
	ret
	
LCD_COMMAND:			;Function for LCD command
	CLR RS
	MOV LCD, R4
	SETB E
	ACALL DELAY
	CLR E
RET
	
LCD_DATA:			;Function for LCD data
	SETB RS
	MOV LCD, R4
	SETB E
	ACALL DELAY
	CLR E
RET
	
DELAY:			;Function for delay
		MOV R7, #200
LOOP1:	MOV R6, #200
LOOP:	DJNZ R6, LOOP
		DJNZ R7, LOOP1
RET
END