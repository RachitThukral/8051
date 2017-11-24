//Program: Display hex value on seven segment and corresponding binary using LEDs connected at port B and C[3:0] of 8255
#include<reg51.h>
#include<absacc.h>
#define PORTA_8255 0x0000	//PORTA_8255
#define SEVSEG 0x0001	//PORTB_8255
#define LED 0x0002	//PORTC_8255
#define CTRL_8255 0x0003	//CTRL_8255

void delay();

void main(){
	XBYTE[CTRL_8255]=0x80;	//port B=OUT, C=OUT
	while(1){
		XBYTE[SEVSEG]=0xE7;	//DISPLAY 0
		XBYTE[LED]=0xFF;
		delay();
		XBYTE[SEVSEG]=0x21;	//DISPLAY 1
		XBYTE[LED]=0xFE;
		delay();
		XBYTE[SEVSEG]=0xCB;	//DISPLAY 2
		XBYTE[LED]=0xFD;
		delay();
		XBYTE[SEVSEG]=0xAB;	//DISPLAY 3
		XBYTE[LED]=0xFC;
		delay();
		XBYTE[SEVSEG]=0x2D;	//DISPLAY 4
		XBYTE[LED]=0xFB;
		delay();
		XBYTE[SEVSEG]=0xAE;	//DISPLAY 5
		XBYTE[LED]=0xFA;
		delay();
		XBYTE[SEVSEG]=0xEE;	//DISPLAY 6
		XBYTE[LED]=0xF9;
		delay();
		XBYTE[SEVSEG]=0x23;	//DISPLAY 7
		XBYTE[LED]=0xF8;
		delay();
		XBYTE[SEVSEG]=0xEF;	//DISPLAY 8
		XBYTE[LED]=0xF7;
		delay();
		XBYTE[SEVSEG]=0xAF;	//DISPLAY 9
		XBYTE[LED]=0xF6;
		delay();
		XBYTE[SEVSEG]=0x6F;	//DISPLAY A
		XBYTE[LED]=0xF5;
		delay();
		XBYTE[SEVSEG]=0xEC;	//DISPLAY b
		XBYTE[LED]=0xF4;
		delay();
		XBYTE[SEVSEG]=0xC6;	//DISPLAY C
		XBYTE[LED]=0xF3;
		delay();
		XBYTE[SEVSEG]=0xE9;	//DISPLAY d
		XBYTE[LED]=0xF2;
		delay();
		XBYTE[SEVSEG]=0xCE;	//DISPLAY E
		XBYTE[LED]=0xF1;
		delay();
		XBYTE[SEVSEG]=0x4E;	//DISPLAY F
		XBYTE[LED]=0xF0;
		delay();
	}
}

void delay(){
	unsigned int i;
	for(i=0;i<40000;i++);
}