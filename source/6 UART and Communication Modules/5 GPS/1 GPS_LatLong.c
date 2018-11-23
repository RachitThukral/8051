//Program: Read GPS data and dislay latitude and longitude on LCD
#include<reg51.h>
#include<LCD_16x2_functions.c>

unsigned char Rx_data();

void main (){
	unsigned int LAT[11], LON[12];
	unsigned char Temp, i;
	TMOD=0x20;	//timer 1 mode 2
	TH1=0xFD;	//9600 baud
	SCON=0x50;	//8N1, enable UART Rx
	TR1=1;	//enable timer 1
	LCD_init();
	while(1){
		if (Rx_data() == '$'){	//start string $GPRMC
			if( Rx_data() == 'G'){
				if (Rx_data() == 'P'){
					if (Rx_data() == 'R'){
						if (Rx_data() == 'M'){
							if (Rx_data() == 'C'){
								while (Rx_data() != ',');	//ignore other fields
								while (Rx_data() != ',');
								Temp = Rx_data();	//checking for “A” condition
								if (Temp == 'A'){
									while (Rx_data() != ',');
									for (i=0; i<11; i++)	//receive laitude data
										LAT[i] = Rx_data();
									while (Rx_data() != ',');
									//while (Rx_data() != ',');
									for (i=0; i<12; i++)	//receive longitude data
										LON[i] = Rx_data();
									LCD_command (0x80);
									for (i=0; i<11; i++)	//display latitude on LCD row 1
										 LCD_data(LAT[i]);
									LCD_command (0xc0);
									for (i=0; i<12; i++)	//display longitude on LCD row 2
										 LCD_data(LON[i]);
								}
							}
						}
					}
				}
			}
		}
	}
}

unsigned char Rx_data(){	//UART Rx
	unsigned char str;
	while(RI==0);
	str=SBUF;
	RI=0;
	return str;
}