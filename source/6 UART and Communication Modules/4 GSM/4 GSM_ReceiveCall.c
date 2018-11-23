//Program: Make a call using GSM
#include <reg51.h>
 
void Tx_data(unsigned char dat);
unsigned char Rx_data();
void main(){
	unsigned int i=0;
	TMOD=0x20;	//timer 1 mode 2
	TH1=0xFD;	//9600 baud
	SCON=0x50;	//enable UART
	TR1=1;	//enable timer 1
	if(Rx_data=='R'){	//check for RING
		if(Rx_data=='I'){
			if(Rx_data=='N'){
				if(Rx_data=='G'){
					Tx_data('A');	//attend the call
					Tx_data('T');
					Tx_data('A');
				}
			}
		}
	}
}

void Tx_data(unsigned char dat){	//UART send
	TI=0;
	SBUF=dat;
	while(TI==0);
}

unsigned char Rx_data(){	//UART receive
	while(RI==0);
	RI=0;
	return SBUF;
}