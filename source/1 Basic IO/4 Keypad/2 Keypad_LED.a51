;Program: Receive the input from hex keypad and display the corresponding binary value using 4 LEDs
KKC1 EQU P2.0
KC2 EQU P2.1
KC3 EQU P2.2
KC4 EQU P2.3
KR1 EQU P2.4
KR2 EQU P2.5
KR3 EQU P2.6
KR4 EQU P2.7
KEYPAD EQU P2
LEDS EQU P1
ORG 00H
CHECK_KB:
	MOV KEYPAD, #0FFH	;initially all 1's at keypad
	CLR KC1	;column1 = 0, other columns = 1
	JNB KR1, KEY_1	;check all the rows
	JNB KR2, KEY_2	;and jump for display
	JNB KR3, KEY_3
	JNB KR4, KEY_A
	SETB KC1
	CLR KC2	;column2 = 0, other columns = 1
	JNB KR1, KEY_4	;check all the rows
	JNB KR2, KEY_5	;and jump for display
	JNB KR3, KEY_6
	JNB KR4, KEY_B
	SETB KC2
	CLR KC3	;column3 = 0, other columns = 1
	JNB KR1, KEY_7	;check all the rows
	JNB KR2, KEY_8	;and jump for display
	JNB KR3, KEY_9
	JNB KR4, KEY_C
	SETB KC3
	CLR KC4	;column4 = 0, other columns = 1
	JNB KR1, KEY_STAR	;check all the rows
	JNB KR2, KEY_0	;and jump for display
	JNB KR3, KEY_HASH
	JNB KR4, KEY_D
	AJMP CHECK_KB
	
KEY_1:	MOV LEDS, #0FFH	;Display 1 on LEDs
	AJMP CHECK_KB
KEY_2:	MOV LEDS, #0FEH	;Display 2 on LEDs
	AJMP CHECK_KB
KEY_3:	MOV LEDS, #0FDH	;Display 3 on LEDs
	AJMP CHECK_KB
KEY_A:	MOV LEDS, #0F5H	;Display A on LEDs
	AJMP CHECK_KB
KEY_4:	MOV LEDS, #0FBH	;Display 4 on LEDs
	AJMP CHECK_KB
KEY_5:	MOV LEDS, #0FAH	;Display 5 on LEDs
	AJMP CHECK_KB
KEY_6:	MOV LEDS, #0F9H	;Display 6 on LEDs
	AJMP CHECK_KB
KEY_B:	MOV LEDS, #0F4H	;Display B on LEDs
	AJMP CHECK_KB
KEY_7:	MOV LEDS, #0F7H	;Display 7 on LEDs
	AJMP CHECK_KB
KEY_8:	MOV LEDS, #0F6H	;Display 8 on LEDs
	AJMP CHECK_KB
KEY_9:	MOV LEDS, #0F5H	;Display 9 on LEDs
	AJMP CHECK_KB
KEY_C:	MOV LEDS, #0F3H	;Display C on LEDs
	AJMP CHECK_KB
KEY_STAR:	MOV LEDS, #0F1H	;Display *(14) on LEDs
	AJMP CHECK_KB
KEY_0:	MOV LEDS, #0FFH	;Display 0 on LEDs
	AJMP CHECK_KB
KEY_HASH:	MOV LEDS, #0F0H	;Display #(15) on LEDs
	AJMP CHECK_KB
KEY_D:	MOV LEDS, #0F2H	;Display D(13) on LEDs
	AJMP CHECK_KB
	END