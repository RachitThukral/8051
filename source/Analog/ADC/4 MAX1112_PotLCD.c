//Program: Read potentiometer output using ADC0848 channel 1  and display it on LCD
#include<reg51.h>
sbit E=P2^7;
sbit RS=P2^6;
sfr LCD=0x80;	//P0
sbit ADC_DIN=P3^4;
sbit ADC_DOUT=P3^6;
sbit ADC_SCLK=P3^5;
sbit ACC_MBIT=ACC^7;
sbit ACC_LBIT=ACC^0;

void delay();
void lcd_init();
void lcd_command(unsigned char cmd);
void lcd_data(unsigned char dat);

void main(){
	unsigned char i,count;
	lcd_init();
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

		lcd_command(0x80);
		lcd_data(ACC%10);
		lcd_data((ACC/10)%10);
		lcd_data((ACC/100)%10);
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