//Program: WAP to read the time (24-hour mode) and date from RTC DS12887 (BCD format) and display on LCD
#include<reg51.h>
#include<absacc.h>
#include<LCD_16x2_functions.c>

void main(){
	LCD_init();
	XBYTE[10]=0x20;	//TURN ON OSC
	while(1){
		LCD_command(0x80);	//display time
		LCD_BCD(XBYTE[4]);	//SECONDS
		LCD_data(':');
		LCD_BCD(XBYTE[2]);	//MINUTES
		LCD_data(':');
		LCD_BCD(XBYTE[0]);	//HOURS
		LCD_command(0xC0);	//display date
		LCD_BCD(XBYTE[7]);	//DATE
		LCD_data('/');
		LCD_BCD(XBYTE[8]);	//MONTH
		LCD_data('/');
		LCD_data('2');
		LCD_data('0');
		LCD_BCD(XBYTE[9]);	//YEAR
	}
}