//Program: Read potentiometer output using ADC0848 channel 1  and display it on LCD
#include<reg51.h>
sbit ADC_DIN=P3^4;
sbit ADC_DOUT=P3^6;
sbit ADC_SCLK=P3^5;
sbit ACC_MBIT=ACC^7;
sbit ACC_LBIT=ACC^0;
sbit LED1=P1^0;
sbit LED2=P1^1;
sbit LED3=P1^2;
sbit LED4=P1^3;

void delay();

void main(){
	unsigned char count,adc_val;
	while(1){
		ACC=0x9E;	//select channel 1 of ADC
		for(count=0;count<8;count++){	//sending bits
			ADC_DIN=ACC_MBIT;
			ADC_SCLK=0;
			delay();
			ADC_SCLK=1;
			delay();
			ACC=ACC<<1;
		}
		ADC_SCLK=0;
		ADC_DOUT=1;
		
		ADC_SCLK=1;	//receiving adc data bits
		delay();
		ADC_SCLK=0;
		delay();
		for(count=0;count<8;count++){
			ADC_SCLK=1;
			delay();
			ADC_SCLK=0;
			delay();
			ACC=ACC<<1;
			ACC_LBIT=ADC_DOUT;
		}
		adc_val=ACC;
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
			LED1=1;
			LED2=0;
			LED3=1;
			LED4=1;
		}
		else if(adc_val<204){
			LED1=1;
			LED2=1;
			LED3=0;
			LED4=1;
		}
		else{
			LED1=1;
			LED2=1;
			LED3=1;
			LED4=0;
		}
	}
}

void delay(){
	unsigned int val;
	for(val=0;val<40000;val++);
}