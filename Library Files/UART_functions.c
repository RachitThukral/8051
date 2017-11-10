#include<reg51.h>
void UART_Init();
void UART_Tx(unsigned char dat);
unsigned char UART_Rx();

void UART_Init(){	//initialize UART
	TMOD=0x20;	//timer 1 mode 2
	TH1=0xFD;	//9600 baud
	SCON=0x50;	//enable UART
	TR1=1;	//enable timer 1
}

void UART_Tx(unsigned char dat){	//send character using UART
	SBUF=dat;	//transnit character
	while(!TI);	//wait for transmission
	TI=0;	//and clear TI
}

unsigned char UART_Rx(){	//receive character using UART
	while(!RI);	//wait for reception
	RI=0;	//and clear RI
	return SBUF;	//receive character
}