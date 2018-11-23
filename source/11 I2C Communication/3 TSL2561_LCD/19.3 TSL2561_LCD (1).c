//Program: WAP to read the light intensity from TSL2561 and display on LCD
#include<reg51.h>
#include<LCD_16x2_functions.c>

void main(){
	LCD_init();
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