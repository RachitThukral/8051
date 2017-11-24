//Program: Read potentiometer output using ADC0848 channel 1  and display it on LCD
#include<reg51.h>
sbit E=P2^7;
sbit RS=P2^6;
sfr LCD=0x80;	//P0
sbit ADC_WR=P3^3;
sbit ADC_INTR=P3^4;
sfr ADC_DATA=0x90;	//P1

void delay();
void lcd_init();
void lcd_command(unsigned char cmd);
void lcd_data(unsigned char dat);

void main(){
	unsigned char adc_val,i;
	lcd_init();
	ADC_INTR=1;
	ADC_WR=1;	
	while(1){
		ADC_DATA=0x09;	//channel 1 of ADC
		ADC_WR=0;
		ADC_WR=1;
		ADC_DATA=0xFF;
		while(ADC_INTR==1);	//wait for end of conversion
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