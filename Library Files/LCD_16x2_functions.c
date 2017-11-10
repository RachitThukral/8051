#include<reg51.h>
sbit E=P2.7;
sbit RS=P2.6;
sfr LCD=0x80;	//P0

void LCD_init();
void LCD_command(unsigned char cmd);
void LCD_command(unsigned char dat);
void delay();

void LCD_init(){	//initialize LCD
	E=0;
	RS=0;
	LCD_command(0x38);	//Use 2 lines and 5×7 matrix for LCD
	delay();
	LCD_command(0x0C);	//LCD ON, Cursor OFF
	delay();
	LCD_command(0x01);	//LCD clear
	delay();
}
	
void LCD_command(unsigned char cmd){	//send command to LCD
	RS=0;
	LCD=cmd;
	E=1;
	delay();
	E=0;
}

void LCD_command(unsigned char dat){	//send data to LCD
	RS=0;
	LCD=dat;
	E=1;
	delay();
	E=0;
}
	
void delay(){	//Function for delay
	unsigned int i;
	for(i=0;i<40000;i++);
}