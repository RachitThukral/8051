//Program: Blink an LED continuously. Use external interrupt 1 to stop blinking and turn off the LED
#include<reg51.h>
sbit LED=P1^0;

void delay();
void ISR_EXT1() interrupt 3{	//ISR external 1
	LED=1;	//Turn OFF LED
}

void main(){
	IE=0x84;	//enable external interrupt 1
	while(1){	//blink LED
		LED=1;
		delay();
		LED=0;
		delay();
	}
}

void delay(){	//Function for delay
	unsigned int i;
	for(i=0;i<40000;i++);
}