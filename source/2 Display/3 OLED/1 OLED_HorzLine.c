//Program: WAP to draw horizontal line on top of OLED
#include<reg51.h>
#include<OLED_functions.c>

void main(){
	unsigned char i;
	oled_init();	//initialize OLED
	oled_setcur(0,0);	//set cursor to (0,0)
	i2c_start();
	i2c_sendbyte(OLED_ADDR);	//OLED address
	i2c_sendbyte(OLED_NDATA);	//send data
	for(i=0;i<128;i++)	//draw line on top pixels
		i2c_sendbyte(0x01);
	i2c_stop();
	while(1);
}