//Program: WAP to display string ‘ETI LABS’ on OLED using lookup table
#include<reg51.h>
#include<OLED_functions.c>

code unsigned char logo[5][128]=
{
{0,0,0,0,0,0,0,0, 0xFF,0,0,0,0,0,0,0, 0xFF,0,0,0,0,0,0,0, 0xFF,0,0,0,0,0,0,0, 0xFF,0,0,0,0,0,0,0}
{1,1,1,1,1,1,1,1, 0xFF,1,1,1,1,1,1,1, 1,1,1,1,1,1,1,1, 1,1,1,1,1,1,1,1, 0xFF,1,1,1,1,1,1,1}
{1,1,1,1,1,1,1,1, 0xFF,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0, 0xFF,1,1,1,1,1,1,1}
{1,1,1,1,1,1,1,1, 0xFF,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0, 0xFF,1,1,1,1,1,1,1}
{1,1,1,1,1,1,1,1, 0xFF,1,1,1,1,1,1,1, 0xFF,1,1,1,1,1,1,1, 0xFF,1,1,1,1,1,1,1, 0xFF,1,1,1,1,1,1,1}
};

void main(){
	unsigned int i;
	oled_init();	//initialize OLED
	oled_setcur(0,0);	//set cursor to (0,0)
	i2c_start();
	i2c_sendbyte(OLED_ADDR);	//OLED address
	i2c_sendbyte(OLED_NDATA);	//send data
	for(i=0;i<640;i++)
		i2c_sendbyte(logo[i]);	//display "ETI LABS"
	i2c_stop();
	while(1);
}