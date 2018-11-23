//Program: WAP to generate alarm interrupt every half second on IRQ pin of RTC DS12887 and make the LED blink
#include<reg51.h>
#include<absacc.h>

void main(){
	XBYTE[10]=0x2F;	//TURN ON OSC
	XBYTE[11]=0x43;	//BCD,24HRS
}