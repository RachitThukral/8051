//Program: Read characters from as external data memory (ROM) and display on LCD
#include<reg51.h>
#include<absacc.h>
#include<LCD_16x2_functions.h>

void main(){
	unsigned char val,i;
	LCD_init();
	for(i=0;i<5;i++){
		LCD_command(0x01);
		val=XBYTE[i];	//fetch bytes
		LCD_BIN3(val);
	}
}