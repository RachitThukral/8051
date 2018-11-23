//Program: WAP to turn on the fan using when there is motion in the room
#include<reg51.h>
sbit RELAY_FAN=P2^0;
sbit PIR=P2^1;

void main(){
	PIR=1;	//PIR as input
	while(1){
	if(PIR)	//if motion detected,
		RELAY_FAN=0;	//turn ON Fan
	else
		RELAY_FAN=1;	//else turn OFF Fan
	}
}