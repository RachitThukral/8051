//Program: Generate a triangular wave using DAC0808/MC1408
#include<reg51.h>
sfr DAC=0x90;	//P1

void main(){
	int i;
	while(1){
		for(i=0;i<256;i++)	//0 to 255
			DAC=i;
		for(i=255;i>=0;i--)	//255 to 0
			DAC=i;
	}
}