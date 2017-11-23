//Program: WAP to draw horizontal line on top of OLED
#include<reg51.h>
#include<I2C_functions.c>
#include<LCD_16x2_functions.c>

void main(){
	unsigned char rtc_val[7],i;
	LCD_init();
	i2c_init();
	while(1){
		i2c_start();
		i2c_sendbyte(0xD0);	//DS1307 address write
		i2c_sendbyte(0x00);	//start location
		i2c_stop();
		i2c_start();
		i2c_sendbyte(0xD1);	//DS1307 address read
		for(i=0;i<7;i++)
			rtc_val[i]=i2c_recbyte();	//recieve byte
		i2c_stop();
		LCD_command(0x80);	//display on LCD
		LCD_BCD(rtc_val[2]);
		LCD_data(':');
		LCD_BCD(rtc_val[1]);
		LCD_data(':');
		LCD_BCD(rtc_val[0]);
		LCD_command(0xC0);
		LCD_BCD(rtc_val[6]);
		LCD_data('/');
		LCD_BCD(rtc_val[5]);
		LCD_data('/');
		LCD_BCD(rtc_val[4]);
	}
}