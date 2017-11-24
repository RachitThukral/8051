//Program: Control the LED using switch while simultaneously blink another LED using timer 1 (mode 1) interrupt
#include<reg51.h>
sbit LED_INT=P1^0;
sbit LED=P1^1;
sbit SWITCH=P3^2;

void ISR_T1() interrupt 3{	//ISR timer 1
	LED=~LED_INT;	//complement LED
	TF0=0;	//reset timer flag
}

void main(){
	IE=0x88;	//enable timer 1 interrupt
	TMOD=0x10;	//timer 1, mode 1
	TH1=0;	//initialize timer 1
	TL1=0;
	TR1=1;	//start timer 1
	while(1){
		if(SWITCH)
			LED=1;
		else
			LED=0;
	}
}