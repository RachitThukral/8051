//Program: Send an SMS using GSM
#include <reg51.h>
 
code unsigned char *TEXT_MODE[]={"AT+CMGF=1", 0x0D};
code unsigned char *MOBILE_NUMBER[]={"AT+CMGS=",34,"+918527136215",34,0x0D};
code unsigned char *SMS_TEXT[]={"Hello",0x1A};

void Tx_data(unsigned char dat);
void main(){
	unsigned int i=0;
	TMOD=0x20;	//timer 1 mode 2
	TH1=0xFD;	//9600 baud
	SCON=0x50;	//enable UART
	TR1=1;	//enable timer 1
	while(*TEXT_MODE[i]!=0x0D){	//text mode (AT+CMGF=1)
		Tx_data(*TEXT_MODE[i]);
		i++;
	}
	Tx_data(0x0D);
	i=0;
	while(*MOBILE_NUMBER[i]!=0x0D){	//mobile number (AT+CMGS="number")
		Tx_data(*MOBILE_NUMBER[i]);
		i++;
	}
	Tx_data(0x0D);
	i=0;
	while(*SMS_TEXT[i]!=0x1A){	//SMS text
		Tx_data(*SMS_TEXT[i]);
		i++;
	}
	Tx_data(0x1A);
}

void Tx_data(unsigned char dat){	//UART send
	TI=0;
	SBUF=dat;
	while(TI==0);
}