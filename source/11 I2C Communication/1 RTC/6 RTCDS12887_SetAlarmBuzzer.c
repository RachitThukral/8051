//Program: WAP to set alarm (exact time match) and corresponding interrupt on IRQ pin of RTC DS12887 and make buzzer sound for few seconds at the time of interrupt
#include<reg51.h>
#include<absacc.h>

sbit BUZZER=P2^0;
sbit EXT_EDGE=TCON^1;
void delay();
void ISR_EXT0() interrupt 0{	//ISR external 0
	BUZZER=1;
	delay();
}

void main(){
	IE=0x81;	//enable external interrupt 0
	EXT_EDGE=1;	//and make it edge triggered
	XBYTE[10]=0x20;	//TURN ON OSC
	XBYTE[11]=0xA3;	//BCD,24HRS
	XBYTE[0]=0x00;	//SET SECONDS
	XBYTE[2]=0x30;	//SET MINUTES
	XBYTE[4]=0x16;	//SET HOURS
	XBYTE[0]=0x10;	//SET ALARM SECONDS
	XBYTE[2]=0x30;	//SET ALARM MINUTES
	XBYTE[4]=0x16;	//SET ALARM HOURS
	XBYTE[11]=0x23;	//B[7]=0 TO ALLOW UPDATE
}

void delay(){
	unsigned int i;
	for(i=0;i<40000;i++);
}