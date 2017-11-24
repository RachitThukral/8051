//Program: Transmit a string (ending with ‘.’ character) using bluetooth
#include <reg51.h>
code unsigned char string[]="BT using 8051.";

void delay();
void main(){
	unsigned int i=0;
	TMOD=0x20;	//timer 1 mode 2
	TH1=0xFD;	//9600 baud
	SCON=0x50;	//enable UART
	TR1=1;	//enable timer 1
	while(1){
		if(string[i]=='.'){	//check for end character and
			i=0;	//initiaize to string address
			delay();
		}
		else{
			SBUF=string[i];	//send character
			while(TI==0);
			TI=0;
			i=i+1;	//next character
		}
	}
}

void delay(){	//Function for delay
	unsigned int i;
	for(i=0;i<40000;i++);
}