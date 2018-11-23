//Program: Receive a character (y,n) from smartphone using Bluetooth and make the LED ON/OFF
#include <reg51.h>
sbit LED=P1^0;
void main(){
	unsigned int chr;
	TMOD=0x20;	//timer 1 mode 2
	TH1=0xFD;	//9600 baud
	SCON=0x50;	//enable UART
	TR1=1;	//enable timer 1
	while(1){
		while(RI==0);	//wait for reception
		RI=0;
		chr=SBUF;	//received character
		if(chr=='y')	//if charcter='y'
			LED=0;	//LED ON
		else if(chr=='n')	//if character='n'
			LED=1;	//LED ON
	}
}
