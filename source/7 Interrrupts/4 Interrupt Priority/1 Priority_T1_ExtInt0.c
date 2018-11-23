//Program: Blink LED1 using timer 1 (mode 1) interrupt and turn ON LED2 when there is external interrupt 0 and observe the priority
#include<reg51.h>
sbit LED1=P1^0;
sbit LED2=P1^1;

void delay();
void ISR_T1() interrupt 3{	//ISR timer 1
	LED1=~LED1;	//blink LED1
	TF1=0;
}

void ISR_EXT0() interrupt 0{	//ISR external 0
	LED2=0;	//turn ON LED 2
	delay();
}

void main(){
	IE=0x89;	//enable EXT 0 and TIM 1 interrupts
	TMOD=0x10;	//timer 1, mode 1
	TH1=0;
	TL1=0;
	TR1=1;
	while(1);
}

void delay(){	//Function for delay
	unsigned int i;
	for(i=0;i<40000;i++);
}