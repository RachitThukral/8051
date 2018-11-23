//Program: Control direction of rotation of unipolar stepper motor using single coil 4 steps
#include<reg51.h>
sfr stepper=0xA0;	//P2.3-P2.0
sbit PB_CW=P3^2;
sbit PB_CCW=P3^5;
void delay();

void main(){
	unsigned char step=0x77;
	while(1){
		if(PB_CW==0){
			stepper=step;
			step=step>>1|step<<7;
			delay();
		}
		else if(PB_CCW==0){
			stepper=step;
			step=step<<1|step>>7;
			delay();
		}
	}
}

void delay(){
	unsigned int val;
	for(val=0;val<40000;val++);
}