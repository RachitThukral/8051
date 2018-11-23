//Program: Direction of rotation of DC motor
#include<reg51.h>
sbit PB_CW=P3^2;
sbit PB_CCW=P3^5;
sbit M0=P1^0;
sbit M1=P1^1;

void main(){
	PB_CW=1;	PB2=1;	//make push buttons pins as input
	while(1){
		if(PB_CW==0){	//clockwise
			M1=1;	M0=0;
		}
		else if(PB_CCW==0){	//couter clockwise
			M1=0;	M0=1;
		}
		else{	//stop
			M1=1;	M0=1;
		}
	}
}
