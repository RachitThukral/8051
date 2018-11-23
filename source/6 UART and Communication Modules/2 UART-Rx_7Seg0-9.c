//Program: Rx 0 to 9 using UART and display on 7-segment
#include <reg51.h>
sfr SEVSEG=0x90;	//P1
void main(){
	unsigned int chr;
	TMOD=0x20;	//timer 1 mode 2
	TH1=0xFD;	//9600 baud
	SCON=0x50;	//enable UART
	TR1=1;	//enable timer 1
	while(1){
		while(RI==0);	//wait for reception
		RI=0;	//and clear RI
		chr=SBUF;	//received character
		if(chr==0)	//check for numbers and
			SEVSEG=0xE7;	//display on 7-segment
		else if(chr==1)
			SEVSEG=0x21;
		else if(chr==2)
			SEVSEG=0xCB;
		else if(chr==3)
			SEVSEG=0xAB;
		else if(chr==4)
			SEVSEG=0x2D;
		else if(chr==5)
			SEVSEG=0xAE;
		else if(chr==6)
			SEVSEG=0xEE;
		else if(chr==7)
			SEVSEG=0x23;
		else if(chr==8)
			SEVSEG=0xEF;
		else if(chr==9)
			SEVSEG=0xAF;
	}
}
