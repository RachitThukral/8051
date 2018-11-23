//Program: Count items using IR sensor and display on LCD
#include<reg51.h>
#include<LCD_16x2_functions.c>
sbit IR=P2^0;

void main(){
	unsigned char count;
	unsigned int i;
	LCD_init();
	LCD_data('C');	//Display "Count" on LCD
	LCD_data('o');
	LCD_data('u');
	LCD_data('n');
	LCD_data('t');
	LCD_data('=');
	IR=1;	//IR as input
	while(1){
		if(IR){	//next item detected
			count++;	//Increment Count
			LCD_command(0x86);
			LCD_data(count + 0x30);	//display count on LCD
		}
		for(i=0;i<20000;i++);	//small delay
	}
}