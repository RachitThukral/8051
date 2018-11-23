;Program: Display key pressed of keypad on seven segment
KC1 EQU P2.0
KC2 EQU P2.1
KC3 EQU P2.2
KC4 EQU P2.3
KR1 EQU P2.4
KR2 EQU P2.5
KR3 EQU P2.6
KR4 EQU P2.7
KEYPAD EQU P2
SEVSEG EQU P1
ORG 00H
CHECK_KB:
	MOV KEYPAD, #11111111B	;initially all 1's at keypad
	MOV KEYPAD, #11111110B	;column1 = 0, other columns = 1
	JNB KR1, KEY_1	;check all the rows 
	JNB KR2, KEY_2	;and jump for display
	JNB KR3, KEY_3
	JNB KR4, KEY_A
	MOV KEYPAD, #11111101B	;column2 = 0, other columns = 1
	JNB KR1, KEY_4	;check all the rows
	JNB KR2, KEY_5	;and jump for display
	JNB KR3, KEY_6
	JNB KR4, KEY_B
	MOV KEYPAD, #11111011B	;column3 = 0, other columns = 1
	JNB KR1, KEY_7	;check all the rows
	JNB KR2, KEY_8	;and jump for display
	JNB KR3, KEY_9
	JNB KR4, KEY_C
	MOV KEYPAD, #11110111B	;column4 = 0, other columns = 1
	JNB KR1, KEY_STAR	;check all the rows
	JNB KR2, KEY_0	;and jump for display
	JNB KR3, KEY_HASH
	JNB KR4, KEY_D
	
	AJMP CHECK_KB
KEY_1:	MOV SEVSEG, #21H	;Display 1 on seven segment
	AJMP CHECK_KB
KEY_2:	MOV SEVSEG, #0CBH	;Display 2 on seven segment
	AJMP CHECK_KB
KEY_3:	MOV SEVSEG, #0ABH	;Display 3 on seven segment
	AJMP CHECK_KB
KEY_A:	MOV SEVSEG, #6FH	;Display A on seven segment
	AJMP CHECK_KB
KEY_4:	MOV SEVSEG, #2DH	;Display 4 on seven segment
	AJMP CHECK_KB
KEY_5:	MOV SEVSEG, #0AEH	;Display 5 on seven segment
	AJMP CHECK_KB
KEY_6:	MOV SEVSEG, #0EEH	;Display 6 on seven segment
	AJMP CHECK_KB
KEY_B:	MOV SEVSEG, #0ECH	;Display b on seven segment
	AJMP CHECK_KB
KEY_7:	MOV SEVSEG, #23H	;Display 7 on seven segment
	AJMP CHECK_KB
KEY_8:	MOV SEVSEG, #0EFH	;Display 8 on seven segment
	AJMP CHECK_KB
KEY_9:	MOV SEVSEG, #0AFH	;Display 8 on seven segment
	AJMP CHECK_KB
KEY_C:	MOV SEVSEG, #0C6H	;Display C on seven segment
	AJMP CHECK_KB
KEY_STAR:	MOV SEVSEG, #4CH	;Display * on seven segment
	AJMP CHECK_KB
KEY_0:	MOV SEVSEG, #0E7H	;Display 0 on seven segment
	AJMP CHECK_KB
KEY_HASH:	MOV SEVSEG, #6DH	;Display # on seven segment
	AJMP CHECK_KB
KEY_D:	MOV SEVSEG, #0E9H	;Display D on seven segment
	AJMP CHECK_KB
	END