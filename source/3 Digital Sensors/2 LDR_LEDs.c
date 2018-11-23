//Program: Turn ON LEDs if light is not sufficient
#include<reg51.h>
sfr LEDS=0x90;	//P1.3-P1.0
sbit LDR=P2^1;

void main(){
	LDR=1;	//LDR as input
	while(1){
		if(LDR)	//if natural light present
			LEDS=0xFF;	//turn ON LEDS
		else
			LEDS=0x00;	//else turn OFF LEDS
	}
}