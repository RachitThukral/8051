//Program: Rotate bipolar stepper motor using single coil 4 steps
#include<reg51.h>
sfr stepper=0xA0;	//P2.3-P2.0
sbit PB_CW=P3^2;
sbit PB_CCW=P3^5;
void delay();

void main(){
	while(1){
		if(PB_CW==0){
			stepper=0xFB;			//steps for bipolar stepper CW
			delay();
			stepper=0xFE;
			delay();
			stepper=0xF7;
			delay();
			stepper=0xFD;
			delay();
		}
		else if(PB_CCW==0){
			stepper=0xFD;			//steps for bipolar stepper CCW
			delay();
			stepper=0xF7;
			delay();
			stepper=0xFE;
			delay();
			stepper=0xFB;
			delay();
		}
	}
}

void delay(){
	unsigned int val;
	for(val=0;val<2000;val++);
}