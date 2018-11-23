//Program: Rotate unipolar stepper motor using 8 steps
#include<reg51.h>
sfr stepper=0xA0;	//P2.3-P2.0
void delay();

void main(){
	while(1){
		stepper=0xF7;
		delay();
		stepper=0xF3;
		delay();
		stepper=0xFB;
		delay();
		stepper=0xF9;
		delay();
		stepper=0xFD;
		delay();
		stepper=0xFC;
		delay();
		stepper=0xFE;
		delay();
		stepper=0xF6;
		delay();
	}
}

void delay(){
	unsigned int val;
	for(val=0;val<40000;val++);
}