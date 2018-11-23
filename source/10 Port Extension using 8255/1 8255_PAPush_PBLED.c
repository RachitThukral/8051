//Program: Read the push buttons state connected to port A and indicate on LEDs on port B of 8255/
#include<reg51.h>
#include<absacc.h>
#define PB 0x0000	//PORTA_8255
#define LED 0x0001	//PORTB_8255
#define PORTC_8255 0x0002	//PORTC_8255
#define CTRL_8255 0x0003	//CTRL_8255

void main(){
	unsigned char val;
	XBYTE[CTRL_8255]=0x90;	//port A=IN, port B=out
	while(1){
		val=XBYTE[PB];	//read push buttons
		XBYTE[LED]=val;	//indicate on LEDs
	}
}