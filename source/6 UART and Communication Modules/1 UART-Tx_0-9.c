//Program: Tx 0 to 9 using UART
#include <reg51.h>

void delay();
void main(){
	unsigned char i;
	TMOD=0x20;	//timer 1 mode 2
	TH1=0xFD;	//9600 baud
	SCON=0x50;	//enable UART
	TR1=1;	//enable timer 1
	while(1){
			for(i=0;i<10;i++){
				SBUF=i;	//transnit number
				while(TI==0);	//wait for transmission
				TI=0;	//and clear TI
				delay();
			}
	}
}

void delay(){	//Function for delay
	unsigned int i;
	for(i=0;i<40000;i++);
}