//Program: Detect key pressed on hex keypad and display on 7-segment connected at port C and port A respectively of 8255
#include<reg51.h>
#include<absacc.h>
#define SEVSEG 0x0000	//PORTA_8255
#define PORTB_8255 0x0001	//PORTB_8255
#define KEYPAD 0x0002	//PORTC_8255
#define CTRL_8255 0x0003	//CTRL_8255

void main(){
	unsigned char val;
	XBYTE[CTRL_8255]=0x88;	//port C[7:4]=IN, C[3:0]=OUT, A=OUT
	while(1){
		
		XBYTE[KEYPAD]=0xFE;	//column1=0, other columns=1
		val=XBYTE[KEYPAD];
		if(val==0xEE)	//check all the rows and dislay on 7-segment
			XBYTE[SEVSEG]=0x21;	//Display 1
		else if(val==0xDE)
			XBYTE[SEVSEG]=0xCB;	//Display 2
		else if(val==0xBE)
			XBYTE[SEVSEG]=0xAB;	//Display 3
		else if(val==0x7E)
			XBYTE[SEVSEG]=0x6F;	//Display A
		
		XBYTE[KEYPAD]=0xFD;	//column2=0, other columns=1
		val=XBYTE[KEYPAD];
		if(val==0xED)	//check all the rows and dislay on 7-segment
			XBYTE[SEVSEG]=0x2D;	//Display 4
		else if(val==0xDD)
			XBYTE[SEVSEG]=0xAE;	//Display 5
		else if(val==0xBD)
			XBYTE[SEVSEG]=0xEE;	//Display 6
		else if(val==0x7D)
			XBYTE[SEVSEG]=0xEC;	//Display B
		
		XBYTE[KEYPAD]=0xFB;	//column3=0, other columns=1
		val=XBYTE[KEYPAD];
		if(val==0xEB)	//check all the rows and dislay on 7-segment
			XBYTE[SEVSEG]=0x23;	//Display 7
		else if(val==0xDB)
			XBYTE[SEVSEG]=0xEF;	//Display 8
		else if(val==0xBB)
			XBYTE[SEVSEG]=0xAF;	//Display 9
		else if(val==0x7B)
			XBYTE[SEVSEG]=0xC6;	//Display C
		
		XBYTE[KEYPAD]=0xF7;	//column3=0, other columns=1
		val=XBYTE[KEYPAD];
		if(val==0xE7)	//check all the rows and dislay on 7-segment
			XBYTE[SEVSEG]=0x4C;	//Display star
		else if(val==0xD7)
			XBYTE[SEVSEG]=0xE7;	//Display 0
		else if(val==0xB7)
			XBYTE[SEVSEG]=0x6D;	//Display #
		else if(val==0x77)
			XBYTE[SEVSEG]=0xE9;	//Display D
	}
}