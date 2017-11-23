//Program: WAP to display letter ‘A’ of size 8x5 pixels on OLED
#include<reg51.h>
#include<OLED_functions.c>

void main(){
	unsigned char i,j;
	oled_init();	//initialize OLED
	oled_setcur(0,0);	//set cursor to (0,0)
	i2c_start();
	i2c_sendbyte(OLED_ADDR);	//OLED address
	i2c_sendbyte(OLED_NDATA);	//send data
	i2c_sendbyte(0x7C);	//display 'A' on top left
	i2c_sendbyte(0x12);
	i2c_sendbyte(0x11);
	i2c_sendbyte(0x12);
	i2c_sendbyte(0x7c);
	i2c_stop();
	while(1);
}