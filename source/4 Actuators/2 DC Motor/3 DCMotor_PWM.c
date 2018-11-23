//Program: Speed of DC motor
#include<reg51.h>
sbit PB_25=P3^2;
sbit PB_50=P3^3;
sbit PB_75=P3^4;
sbit PB_100=P3^5;
sbit M1=P2^1;
sbit M0=P2^0;

void main(){
	int count;
	PB_25=1;	PB_50=1;	PB_75=1;	PB_100=1;	//make push buttons pins as input
	M1=1;	M0=1;	//motor stopped initially
	while(1){
		if(PB_25==0){	//pwm duty cycle 25
			M0=0;
			for(count=0;count<25;count++);
			M0=1;
			for(count=0;count<75;count++);
		}
		else if(PB_50==0){	//pwm duty cycle 50
			M0=0;
			for(count=0;count<50;count++);
			M0=1;
			for(count=0;count<50;count++);
		}
		else if(PB_75==0){	//pwm duty cycle 75
			M0=0;
			for(count=0;count<75;count++);
			M0=1;
			for(count=0;count<25;count++);
		}
		else if(PB_100==0){	//pwm duty cycle 100
			M0=0;
			for(count=0;count<100;count++);
		}
		else	//no motion
			M0=1;
	}
}
