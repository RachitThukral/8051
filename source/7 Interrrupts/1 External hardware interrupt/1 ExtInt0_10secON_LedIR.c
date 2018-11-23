//Program: Control an LED according to input from IR sensor. When external interrupt 0 is triggered, make the led OFF for 10 seconds using timer 1 mode 1
#include<reg51.h>
sbit LED=P1^0;
sbit IR=P2^0;

void delay_timer();
void ISR_EXT0() interrupt 3{	//ISR external 0
	unsigned char i;
	LED=1;	//Turn OFF LED
	for(i=0;i<40;i++)	//10 S Delay
		delay_timer();
}

void main(){
	IE=0x81;	//enable external interrupt 0
	TMOD=0x10;	//timer 1, mode 1
	while(1){
		if(IR)	//if IR=1,
			LED=1;	//LED OFF
		else
			LED=0;	//if IR=0, LED ON
	}
}

void delay_timer(){	//delay using timer 1
	TL1=0x18;
	TH1=0x02;
	TR1=1;
	while(TF1==0);
	TR1=0;
	TF1=0;
}