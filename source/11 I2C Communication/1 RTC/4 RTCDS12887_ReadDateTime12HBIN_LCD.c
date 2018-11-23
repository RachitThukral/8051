//Program: WAP to read the time (12-hour mode) and date from RTC DS12887 (binary format) and display on LCD
#include<reg51.h>
#include<absacc.h>
#include<LCD_16x2_functions.c>

void main(){
	LCD_init();
	XBYTE[10]=0x20;	//TURN ON OSC
	while(1){
		LCD_command(0x80);	//display time
		LCD_BIN2(XBYTE[4]);	//SECONDS
		LCD_data(':');
		LCD_BIN2(XBYTE[2]);	//MINUTES
		LCD_data(':');
		LCD_BIN2(XBYTE[0]);	//HOURS
		LCD_command(0xC0);	//display date
		LCD_BIN2(XBYTE[7]);	//DATE
		LCD_data('/');
		LCD_BIN2(XBYTE[8]);	//MONTH
		LCD_data('/');
		LCD_data('2');
		LCD_data('0');
		LCD_BIN2(XBYTE[9]);	//YEAR
	}
}