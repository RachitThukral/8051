//Program: Car movement control(forward, backward, left, right) using DC motor
#include<reg51.h>
sbit PB_F=P3^2;
sbit PB_B=P3^3;
sbit PB_L=P3^4;
sbit PB_R=P3^5;
sfr Motor=0xA0;	//P2.3-P2.0

void main(){
	PB_F=1;	PB_B=1;	PB_L=1;	PB_R=1;	//make push buttons pins as input
	while(1){
		if(PB_F==0)	//forward
			Motor=0xFA;
		else if(PB_B==0)	//backward
			Motor=0xF5;
		else if(PB_L==0)	//left
			Motor=0xF6;
		else if(PB_R==0)	//right
			Motor=0xF9;
		else	//no motion
			Motor=0xFF;
	}
}
