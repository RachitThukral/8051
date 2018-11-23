//Program: Make the buzzer sound when intruder detected
#include<reg51.h>
sbit BUZZER=P2^0;
sbit PIR=P2^1;

void main(){
	PIR=1;	//PIR as input
	while(1){
		if(PIR)	//if motion detected,
			BUZZER=0;	//turn ON Buzzer
		else
			BUZZER=1;	//else turn OFF Buzzer
	}
}