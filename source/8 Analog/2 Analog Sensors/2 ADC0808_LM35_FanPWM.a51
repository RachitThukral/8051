;Program: WAP to change the speed of the DC fan using PWM according to the room temperature using LM35 connected to ADC0808 through channel 3 of CD74HC4052 (3 speed levels with 10%, 60% and 100% duty cycle and 28,32,36 as threshold for them)
FAN_PIN EQU P2.0
ADC_DATA EQU P1
ADC_SC EQU P3.3
ADC_EOC EQU P3.4
ADC_C EQU P3.7
ADC_B EQU P3.6
ADC_A EQU P3.5
ADC_ALE EQU P2.0
ORG 00H
	MOV ADC_DATA,#0FFH	;make port = input
	CLR ADC_ALE
	CLR ADC_SC
BACK:
	SETB ADC_C	;select channel 1 of ADC
	CLR ADC_B
	CLR ADC_A
	SETB ADC_ALE
	SETB ADC_SC
	CLR ADC_ALE
	CLR ADC_SC
HERE:	JB ADC_EOC,HERE	;wait for end of conversion
HERE1:	JNB ADC_EOC,HERE1
	MOV A,ADC_DATA	;read the data
	CLR C
	RLC A	;convert to temperature
	ADD A,#2
	MOV R3,A
	CLR C
	SUBB A,#28	;check temp range
	JNC NEXT	;and assign duty cycle for PWM
	MOV R0,#1
	SJMP PWM
NEXT:	CLR C
	MOV A,R3
	SUBB A,#32
	JNC NEXT1
	MOV R0,#10
	SJMP PWM
NEXT1:	CLR C
	MOV A,R3
	SUBB A,#36
	JNC NEXT2
	MOV R0,#60
	SJMP PWM
NEXT2:	MOV R0,#99
PWM:	MOV A,#100	;speed control using PWM
	CLR C
	SUBB A,R0
	MOV R1,A
	SETB FAN_PIN
HERE2: DJNZ R0,HERE2
	CLR FAN_PIN
HERE3: DJNZ R1,HERE3
	AJMP BACK
END