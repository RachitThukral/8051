//Program: WAP to display string �ETI LABS� on OLED using lookup table
#include<reg51.h>
#include<OLED_functions.c>

code unsigned char string[]=
{
0x7F, 0x49, 0x49, 0x49, 0x41,	//E
0x01, 0x01, 0x7F, 0x01, 0x01,	//T
0x00, 0x41, 0x7F, 0x41, 0x00,	//I
0x00, 0x00, 0x00, 0x00, 0x00,	//' '
0x7F, 0x40, 0x40, 0x40, 0x40,	//L
0x7C, 0x12, 0x11, 0x12, 0x7C,	//A
0x7F, 0x49, 0x49, 0x49, 0x36,	//B
0x46, 0x49, 0x49, 0x49, 0x31	//S
};
	
void main(){
	unsigned char i;
	oled_init();	//initialize OLED
	oled_setcur(0,0);	//set cursor to (0,0)
	i2c_start();
	i2c_sendbyte(OLED_ADDR);	//OLED address
	i2c_sendbyte(OLED_NDATA);	//send data
	for(i=0;i<40;i++)
		i2c_sendbyte(string[i]);	//display "ETI LABS"
	i2c_stop();
	while(1);
}