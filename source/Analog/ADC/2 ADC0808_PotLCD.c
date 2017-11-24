//Program: Read potentiometer output using ADC0808 channel 1  and display it on LCD
#include<reg51.h>
sbit E=P2^7;
sbit RS=P2^6;
sfr LCD=0x80;	//P0
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
	unsigned char adc_val,i;
	lcd_init();
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
		lcd_command(0x80);
		lcd_data(adc_val%10);
		lcd_data((adc_val/10)%10);
		lcd_data((adc_val/100)%10);
		for(i=0;i<5;i++)
			delay();
	}
}

void lcd_init(){
	E=0;
	RS=0;
	lcd_command(0x38);	//Use 2 lines and 5×7 matrix for LCD
	delay();
	lcd_command(0x0C);	//LCD ON, Cursor OFF
	delay();
	lcd_command(0x01);	//LCD clear
	delay();
}

void lcd_command(unsigned char cmd){
	RS=0;
	LCD=cmd;
	E=1;
	delay();
	E=0;
}

void lcd_data(unsigned char dat){
	RS=1;
	LCD=dat;
	E=1;
	delay();
	E=0;
}

void delay(){
	unsigned int val;
	for(val=0;val<40000;val++);
}