//Program: WAP to change the speed of the DC fan using PWM according to the room temperature using LM35 connected to ADC0808 through channel 3 of CD74HC4052 (3 speed levels with 10%, 60% and 100% duty cycle and 28,32,36 as threshold for them)
#include<reg51.h>
sbit FAN_PIN=P2^0;
sbit ADC_SC=P3^3;
sbit ADC_EOC=P3^4;
sbit ADC_C=P3^7;
sbit ADC_B=P3^6;
sbit ADC_A=P3^5;
sbit ADC_ALE=P2^0;
sfr ADC_DATA=0x90;	//P1

void delay();
void lcd_init();
void lcd_command(unsigned char cmd);
void lcd_data(unsigned char dat);

void main(){
	unsigned char adc_val,i,duty_cycle;
	ADC_DATA=0xFF;	//make port = input
	ADC_ALE=0;
	ADC_SC=0;
	while(1){
		ADC_C=1;	//select channel 1 of ADC
		ADC_B=0;
		ADC_A=0;
		ADC_ALE=1;
		ADC_SC=1;
		ADC_ALE=0;
		ADC_SC=0;
		while(ADC_EOC==1);	//wait for end of conversion
		while(ADC_EOC==0);
		adc_val=ADC_DATA;	//read the data
		adc_val=adc_val*2+2;	//convert to temperature
		if(adc_val<28)	//check temp range
			duty_cycle=1;	//and assign duty cycle for PWM
		else if(adc_val<32)
			duty_cycle=10;
		else if(adc_val<36)
			duty_cycle=60;
		else
			duty_cycle=100;
		FAN_PIN=1;	//speed control using PWM
		for(i=0;i<duty_cycle;i++);
		FAN_PIN=0;
		for(i=0;i<100-duty_cycle;i++);
	}
}