//Program: Blink an LED continuously with some delay. Make one of the 3 LEDs ON according to the character received (‘1’, ‘2’, ‘3’) on serial port
#include<reg51.h>
sbit LED=P1^0;
sbit LED1=P1^1;
sbit LED2=P1^2;
sbit LED3=P1^3;

void delay();
void ISR_Serial() interrupt 4{	//ISR Serial
	unsigned char chr;
	IE=0x00;	//disable interrupts
	RI=0;
	chr=SBUF;	//read received character
	if(chr=='1'){	//check recived character and
		LED1=0;	//turn ON corresponding LED
		LED2=1;
		LED3=1;
	}
	else if(chr=='2'){
		LED1=1;
		LED2=0;
		LED3=1;
	}
	else if(chr=='3'){
		LED1=1;
		LED2=1;
		LED3=0;
	}
	IE=0x90;	//enable interrupts
}

void main(){
	IE=0x90;	//enable serial interrupt
	TMOD=0x20;	//timer 1 mode 2
	TH1=0xFD;	//timer 1 settings for serial
	SCON=0x50;
	TR1=1;
	while(1){
		LED=~LED;	//blink LED
		delay();
	}
}

void delay(){	//Function for delay
	unsigned int i;
	for(i=0;i<40000;i++);
}