//Program: WAP to turn ON 4 LEDs depending on room light intensity level using ADC0804 through channel 0 of CD74HC4052
#include<reg51.h>
sbit ADC_WR=P3^3;
sbit ADC_INTR=P3^4;
sfr ADC_DATA=0x90;	//P1
sbit MUX_SL1=P3^6;
sbit MUX_SL0=P3^5;
sbit LED1=P1^0;
sbit LED2=P1^1;
sbit LED3=P1^2;
sbit LED4=P1^3;

void main(){
	unsigned char adc_val;
	ADC_DATA=0xFF;	//make port = input
	MUX_SL1=0;
	MUX_SL0=0;
	while(1){
		ADC_WR=0;	//L-to-H to start conversion
		ADC_WR=1;
		while(ADC_INTR);	//wait for end of conversion
		adc_val=ADC_DATA;	//read the data
		if(adc_val<51){	//check range
			LED1=1;	//glow LEDs acc to light level
			LED2=1;
			LED3=1;
			LED4=1;
		}
		else if(adc_val<102){
			LED1=0;
			LED2=1;
			LED3=1;
			LED4=1;
		}
		else if(adc_val<153){
			LED1=0;
			LED2=0;
			LED3=1;
			LED4=1;
		}
		else if(adc_val<204){
			LED1=0;
			LED2=0;
			LED3=0;
			LED4=1;
		}
		else{
			LED1=0;
			LED2=0;
			LED3=0;
			LED4=0;
		}
	}
}