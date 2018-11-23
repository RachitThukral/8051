#include<reg51.h>
sbit E=P2^7;
sbit RS=P2^6;
sfr LCD=0x80;	//P0

void LCD_init();
void LCD_command(unsigned char cmd);
void LCD_dat(unsigned char dat);
void LCD_BCD(unsigned char BCD_num);
void LCD_BIN2(unsigned char BIN_num);
void LCD_BIN3(unsigned char BIN_num);
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

void LCD_data(unsigned char dat){	//send data to LCD
	RS=0;
	LCD=dat;
	E=1;
	delay();
	E=0;
}

void LCD_BCD(unsigned char BCD_num){	//display BCD number on LCD
	LCD_data(((BCD_num>>4)&&0x0F)+0x30);
	LCD_data(((BCD_num)&&0x0F)+0x30);
}

void LCD_BIN2(unsigned char BIN_num){	//display binary number on LCD
	LCD_data(((BIN_num/10)%10)+0x30);
	LCD_data((BIN_num%10)+0x30);
}

void LCD_BIN3(unsigned char BIN_num){	//display binary number on LCD
	LCD_data((BIN_num/100)+0x30);
	LCD_data(((BIN_num/10)%10)+0x30);
	LCD_data((BIN_num%10)+0x30);
}

void delay(){	//Function for delay
	unsigned int i;
	for(i=0;i<40000;i++);
}