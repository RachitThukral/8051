//Program: Turn ON Bulb 1(high intensity) if light not sufficient, else Bulb 2(low intensity)
#include<reg51.h>
sbit RELAY_BULB=P2^0;
sbit LDR=P2^1;

void main(){
	LDR=1;	//LDR as input
	while(1){
	if(LDR)	//if light intensity is low,
		RELAY_BULB=1;	//turn ON Bulb 1
	else
		RELAY_BULB=0;	//else turn on Bulb 2
	}
}