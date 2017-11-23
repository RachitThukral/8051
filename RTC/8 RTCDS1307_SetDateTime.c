//Program: WAP to draw horizontal line on top of OLED
#include<reg51.h>
#include<I2C_functions.c>

void main(){
	i2c_init();
	i2c_start();
	i2c_sendbyte(0xD0);	//DS1307 address write
	i2c_sendbyte(0x00);	//start location
	i2c_sendbyte(0x00);	//seconds
	i2c_sendbyte(0x25);	//minutes
	i2c_sendbyte(0x08);	//hours
	i2c_sendbyte(0x01);	//day
	i2c_sendbyte(0x22);	//date
	i2c_sendbyte(0x10);	//month
	i2c_sendbyte(0x17);	//year
	i2c_stop();
	while(1);
}