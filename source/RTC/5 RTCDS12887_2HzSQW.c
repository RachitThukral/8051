//Program: WAP to generate a square wave with frequency 2 Hz on SQW pin of RTC DS12887
#include<reg51.h>
#include<absacc.h>

void main(){
	unsigned char val;
	XBYTE[10]=0x2F;	//TURN ON OSC and 2Hz SQW
	val=XBYTE[11];	//Enable SQW
	val=val||0x08;
	XBYTE[11]=val;
}