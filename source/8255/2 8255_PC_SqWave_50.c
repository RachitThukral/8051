#include<reg51.h>
#include<absacc.h>
#define PORTA_8255 0x0000
#define PORTB_8255 0x0001
#define PORTC_8255 0x0002	//PWM at C[7]
#define CTRL_8255 0x0003	//control register

void delay();

void main(){
	XBYTE[CTRL_8255]=0x80;	//port C=out
	while(1){
		XBYTE[PORTC_8255]=0x80;	//PWM at C[7]
		delay();
		XBYTE[PORTC_8255]=0x00;
		delay();
	}
}

void delay(){
	unsigned int i;
	for(i=0;i<10000;i++);
}