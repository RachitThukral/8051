//Program: Turn ON/OFF LED when receiving y/n characters using serial interrupt and turn OFF LED when there is external interrupt 0 and observe the priority
#include<reg51.h>
sbit LED=P1^0;

void ISR_EXT0() interrupt 0{	//ISR external 0
	LED=1;
}

void ISR_Serial() interrupt 4{	//ISR Serial
	unsigned char chr;
	IE=0x81;	//disable serial interrupt
	RI=0;
	chr=SBUF;	//read received character
	if(chr=='y'){	//if character='y'
		LED=0;	//LED ON
	}
	else if(chr=='n'){
		LED=1;	//LED OFF
	}
	IE=0x91;	//enable interrupts
}

void main(){
	IE=0x91;	//enable EXT 0 and serial interrupts
	while(1);
}