//Program: LED blink using timer 0 interrupt
#include<reg51.h>

sbit LED=P1^0;

void ISR_T0() interrupt 1{	//ISR timer 0
	LED=~LED;	//complement LED
	TF0=0;	//reset timer flag
}

void main(){
	IE=0x82;	//enable timer 0 interrupt
	TMOD=0x01;	//timer 0, mode 1
	TH0=0;	//initialize timer 0
	TL0=0;
	TR0=1;	//start timer 0
	while(1);
}