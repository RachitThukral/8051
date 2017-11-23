//Program: WAP to draw horizontal line on top of OLED
#include<reg51.h>
#include<I2C_functions.c>

void main(){
	i2c_init();
	i2c_start();
	i2c_sendbyte(0xD0);	//DS1307 address write
	i2c_sendbyte(0x07);	//control register
	i2c_sendbyte(0x10);	//1 Hz on SQW/OUT pin
	i2c_stop();
	while(1);
}