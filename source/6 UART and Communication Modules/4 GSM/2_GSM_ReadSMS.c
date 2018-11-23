//Program: Read an SMS from GSM
#include <reg51.h>
#include <LCD_16x2_functions.c>
 
code unsigned char *TEXT_MODE[]={"AT+CMGF=1", 0x0D};
code unsigned char *FIRST_SMS[]={"AT+CMGR=1",0x0D};

void Tx_data(unsigned char dat);
unsigned char Rx_data();
void main(){
	unsigned char i=0,SMS_TEXT[5];
	TMOD=0x20;	//timer 1 mode 2
	TH1=0xFD;	//9600 baud
	SCON=0x50;	//enable UART
	TR1=1;	//enable timer 1
	LCD_init();
	while(*TEXT_MODE[i]!=0x0D){	//text mode (AT+CMGF=1)
		Tx_data(*TEXT_MODE[i]);
		i++;
	}
	Tx_data(0x0D);
	i=0;
	while(*FIRST_SMS[i]!=0x0D){	//first SMS (AT+CMGR=1)
		Tx_data(*FIRST_SMS[i]);
		i++;
	}
	Tx_data(0x0D);
	while(Rx_data()!='+');	//receive SMS
	while(Rx_data()!=0x0D);
	while(Rx_data()!=0x0D);
	for(i=0;i<5;i++)	//receive SMS text
		SMS_TEXT[i]=Rx_data();
	LCD_command(0x01);	//display SMS on LCD
	for(i=0;i<5;i++)
		LCD_data(SMS_TEXT[i]);
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