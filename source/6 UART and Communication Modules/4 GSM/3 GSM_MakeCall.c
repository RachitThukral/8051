//Program: Make a call using GSM
#include <reg51.h>
 
code unsigned char *CALL_NUMBER[]={"ATD+918527136215;", 0x0D};

void Tx_data(unsigned char dat);
void main(){
	unsigned int i=0;
	TMOD=0x20;	//timer 1 mode 2
	TH1=0xFD;	//9600 baud
	SCON=0x50;	//enable UART
	TR1=1;	//enable timer 1
	while(*CALL_NUMBER[i]!=0x0D){	//make call (ATD number;)
		Tx_data(*CALL_NUMBER[i]);
		i++;
	}
	Tx_data(0x0D);
}

void Tx_data(unsigned char dat){	//UART send
	TI=0;
	SBUF=dat;
	while(TI==0);
}