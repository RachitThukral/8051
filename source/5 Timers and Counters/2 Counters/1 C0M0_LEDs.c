//Program: Count the number of times the switch is pressed at P3.4 (counter 0, mode 0) and display using 4 LEDs
#include <reg51.h>
sfr LEDS=0x90;	//P1.3-P1.0
void main(){
	unsigned char count;
	TMOD=0x04;	//counter 0, mode 0
	TH0=0x00;
	TL0=0x00;
	TR0=1;	//enable counter 0
	while(1){
		count=TL0;	//counter value max 16
		count=count%16;
		LEDS=(count^0xFF)|0xF0;	//logic for count on LEDs
	}
}