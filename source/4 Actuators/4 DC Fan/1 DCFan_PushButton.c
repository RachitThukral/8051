//Program: Turn on DC Fan when Push Button is pressed
#include<reg51.h>
sbit PB=P3^5;
sbit FAN=P2^0;
void main(){
	PB=1;	//Push Button as input
	while(1){
	if(PB)	//if Button not pressed,
		FAN=0;	//turn off DC Fan
	else
		FAN=1;	//if button pressed, turn on DC Fan
	}
}