#include<reg51.h>
#include<absacc.h>
#define SEVSEG 0x0000	//PORTA_8255
#define PORTB_8255 0x0001	//PORTB_8255
#define PORTC_8255 0x0002	//PORTC_8255
#define CTRL_8255 0x0003	//CTRL_8255

void delay();

void main(){
	XBYTE[CTRL_8255]=0x80;	//port A=out
	while(1){
		XBYTE[SEVSEG]=0xE7;	//DISPLAY 0
		delay();
		XBYTE[SEVSEG]=0x21;	//DISPLAY 1
		delay();
		XBYTE[SEVSEG]=0xCB;	//DISPLAY 2
		delay();
		XBYTE[SEVSEG]=0xAB;	//DISPLAY 3
		delay();
		XBYTE[SEVSEG]=0x2D;	//DISPLAY 4
		delay();
		XBYTE[SEVSEG]=0xAE;	//DISPLAY 5
		delay();
		XBYTE[SEVSEG]=0xEE;	//DISPLAY 6
		delay();
		XBYTE[SEVSEG]=0x23;	//DISPLAY 7
		delay();
		XBYTE[SEVSEG]=0xEF;	//DISPLAY 8
		delay();
		XBYTE[SEVSEG]=0xAF;	//DISPLAY 9
		delay();		
	}
}

void delay(){
	unsigned int i;
	for(i=0;i<10000;i++);
}