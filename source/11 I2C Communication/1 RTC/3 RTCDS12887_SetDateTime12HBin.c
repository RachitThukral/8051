//Program: WAP to set the time (12-hour mode) and date on RTC DS12887 in binary format
#include<reg51.h>
#include<absacc.h>

void main(){
	XBYTE[10]=0x20;	//TURN ON OSC
	XBYTE[11]=0x85;	//BIN,12HRS IN REG B
	XBYTE[0]=00;	//SET SECONDS
	XBYTE[2]=30;	//SET MINUTES
	XBYTE[4]=4;	//SET HOURS
	XBYTE[7]=12;	//SET DATE
	XBYTE[8]=10;	//SET MONTH
	XBYTE[9]=17;	//SET YEAR
	XBYTE[11]=0x05;	//B[7]=0 TO ALLOW UPDATE
}