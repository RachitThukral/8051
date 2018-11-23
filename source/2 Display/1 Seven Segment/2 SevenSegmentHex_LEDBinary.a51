;Program: Display hex value on seven segment and corresponding binary using LEDs
SEVSEG EQU P3
LEDS EQU P1	;P1.3-P1.0
ORG 00H
BLINK:
	MOV SEVSEG, #0E7H	;DISPLAY 0
	MOV LEDS, #0xFF
	ACALL DELAY
	MOV SEVSEG, #21H	;DISPLAY 1
	MOV LEDS, #0xFE
	ACALL DELAY
	MOV SEVSEG, #0CBH	;DISPLAY 2
	MOV LEDS, #0xFD
	ACALL DELAY
	MOV SEVSEG, #0ABH	;DISPLAY 3
	MOV LEDS, #0xFC
	ACALL DELAY
	MOV SEVSEG, #2DH	;DISPLAY 4
	MOV LEDS, #0xFB
	ACALL DELAY
	MOV SEVSEG, #0AEH	;DISPLAY 5
	MOV LEDS, #0xFA
	ACALL DELAY
	MOV SEVSEG, #0EEH	;DISPLAY 6
	MOV LEDS, #0xF9
	ACALL DELAY
	MOV SEVSEG, #23H	;DISPLAY 7
	MOV LEDS, #0xF8
	ACALL DELAY
	MOV SEVSEG, #0EFH	;DISPLAY 8
	MOV LEDS, #0xF7
	ACALL DELAY
	MOV SEVSEG, #0AFH	;DISPLAY 9
	MOV LEDS, #0xF6
	ACALL DELAY
	MOV SEVSEG, #6FH	;DISPLAY A
	MOV LEDS, #0xF5
	ACALL DELAY
	MOV SEVSEG, #0ECH	;DISPLAY b
	MOV LEDS, #0xF4
	ACALL DELAY
	MOV SEVSEG, #0C6H	;DISPLAY C
	MOV LEDS, #0xF3
	ACALL DELAY
	MOV SEVSEG, #0E9H	;DISPLAY d
	MOV LEDS, #0xF2
	ACALL DELAY
	MOV SEVSEG, #0CEH	;DISPLAY E
	MOV LEDS, #0xF1
	ACALL DELAY
	MOV SEVSEG, #04EH	;DISPLAY F
	MOV LEDS, #0xF0
	ACALL DELAY
	AJMP BLINK
	
DELAY:	;DELAY function
		MOV R5, #10
LOOP2:	MOV R6, #200
LOOP1:	MOV R7, #200
LOOP:	DJNZ R7, LOOP
		DJNZ R6, LOOP1
		DJNZ R5, LOOP2
RET
END