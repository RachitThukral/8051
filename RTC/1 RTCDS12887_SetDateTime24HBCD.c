//Program: WAP to set the time (24-hour mode) and date on RTC DS12887 in BCD format
#include<reg51.h>
#include<absacc.h>

void main(){
	XBYTE[10]=0x20;	//TURN ON OSC
	XBYTE[11]=0x83;	//BCD,24HRS
	XBYTE[0]=0x00;	//SET SECONDS
	XBYTE[2]=0x30;	//SET MINUTES
	XBYTE[4]=0x16;	//SET HOURS
	XBYTE[7]=0x12;	//SET DATE
	XBYTE[8]=0x10;	//SET MONTH
	XBYTE[9]=0x17;	//SET YEAR
	XBYTE[3]=0x03;	//B[7]=0 TO ALLOW UPDATE
}