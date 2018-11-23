//Program: Rotate unipolar stepper motor using single coil 4 steps
#include<reg51.h>
sfr stepper=0xA0;	//P2.3-P2.0
void delay();

void main(){
	unsigned char step=0x77;
	while(1){
		stepper=step;
		step=step>>1|step<<7;
		delay();
	}
}

void delay(){
	unsigned int val;
	for(val=0;val<40000;val++);
}