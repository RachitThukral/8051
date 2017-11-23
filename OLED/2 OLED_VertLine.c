//Program: WAP to draw vertical line on left side of OLED
#include<reg51.h>
#include<OLED_functions.c>

void main(){
	unsigned char i,j;
	oled_init();	//initialize OLED
	oled_setcur(0,0);	//set cursor to (0,0)
	i2c_start();
	i2c_sendbyte(OLED_ADDR);	//OLED address
	i2c_sendbyte(OLED_NDATA);	//send data
	for(i=0;i<8;i++){
		i2c_sendbyte(0xFF);	//draw line on left pixels
		for(j=0;j<127;j++)
			i2c_sendbyte(0x00);
	}
	i2c_stop();
	while(1);
}