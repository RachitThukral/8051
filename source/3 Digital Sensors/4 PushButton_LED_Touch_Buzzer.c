//Program: Turn ON LED when push button is pressed and make the buzzer sound when touch sensor is touched
#include<reg51.h>
sbit LED=P1^0;
sbit PB=P3^2;
sbit BUZZER=P2^0;
sbit TOUCH=P2^1;

void main(){
	TOUCH=1;	//Touch as input
	PB=1;	//Push Button as input
	while(1){
		if(PB)	//if push button not pressed
			LED=1;	//turn OFF LED
		else
			LED=0;	//else turn ON LED
		if(TOUCH)	//if Touch detected
			BUZZER=0;	//turn ON Buzzer
		else
			BUZZER=1;	//else turn OFF Buzzer
		}
}