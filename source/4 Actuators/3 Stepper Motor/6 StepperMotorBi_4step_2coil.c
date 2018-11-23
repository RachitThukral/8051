//Program: Rotate bipolar stepper motor using two coil 4 steps
#include<reg51.h>
sfr stepper=0xA0;	//P2.3-P2.0
void delay();

void main(){
	while(1){
		stepper=0xFA;			//steps for bipolar stepper
		delay();
		stepper=0xF6;
		delay();
		stepper=0xF5;
		delay();
		stepper=0xF9;
		delay();
	}
}

void delay(){
	unsigned int val;
	for(val=0;val<2000;val++);
}