//Program: WAP to turn ON an LED to indicate the detection of sound
#include<reg51.h>
sbit LED=P1^0;
sbit SOUND=P2^1;

void main(){
	SOUND=1;	//Sound sensor as input
	while(1){
		if(SOUND)	//if sound detected
			LED=0;	//turn ON LED
		else
			LED=1;	//else turn OFF LED
	}
}