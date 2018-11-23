//Program: WAP to draw rectangle on OLED boundary
#include<reg51.h>
#include<OLED_functions.c>

void main(){
	unsigned char i,j;
	oled_init();	//initialize OLED
	oled_setcur(0,0);	//set cursor to (0,0)
	i2c_start();
	i2c_sendbyte(OLED_ADDR);	//OLED address
	i2c_sendbyte(OLED_NDATA);	//send data
	i2c_sendbyte(0xFF);	//line 0
	for(j=0;j<127;j++)
			i2c_sendbyte(0x01);
	i2c_sendbyte(0xFF);
	for(i=2;i<7;i++){	//line 1-6
		i2c_sendbyte(0xFF);
		for(j=0;j<128;j++)
			i2c_sendbyte(0x01);
	}
	i2c_sendbyte(0xFF);	//line 7
	for(j=0;j<127;j++)
			i2c_sendbyte(0x80);
	i2c_sendbyte(0xFF);
	i2c_stop();
	while(1);
}