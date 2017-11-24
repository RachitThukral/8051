//Program: Generate 5-steps staircase wave using DAC0808/MC1408
#include<reg51.h>
sfr DAC=0x90;	//P1
void delay();

void main(){
	int i;
	while(1){
		for(i=0;i<256;i=i+51){	//5-steps of 251
			DAC=i;
			delay();
		}
	}
}

void delay(){
	unsigned int i;
	for(i=0;i<4000;i++);
}