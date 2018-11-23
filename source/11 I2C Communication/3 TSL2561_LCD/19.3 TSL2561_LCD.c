//Program: WAP to read light intensity from TSL2561 and display it on LCD
#include<reg51.h>
#include<I2C_functions.c>
#include<LCD_16x2_functions.c>

#define TSL2561_ADDR 0x39
unsigned char gain=1;

void main(){
	unsigned int ambient,IR;
	float ratio,lux;
	LCD_init();
	i2c_init();
	i2c_start();
	i2c_sendbyte(TSL2561_ADDR);	//DS1307 address write
	i2c_sendbyte(0x80);
	i2c_sendbyte(0x03);
	i2c_stop();
	while(1){
		i2c_start();
		i2c_sendbyte(TSL2561_ADDR);
		i2c_sendbyte(0x81);
		if(gain==1)	i2c_sendbyte(0x02);
		else	i2c_sendbyte(0x12);
		i2c_stop();
		
		i2c_start();
		i2c_sendbyte(TSL2561_ADDR);
		i2c_sendbyte(0x8C);
		i2c_stop();
		i2c_start();
		ambient=i2c_recbyte();
		ambient=ambient<<8 + i2c_recbyte();
		i2c_stop();
		i2c_start();
		i2c_sendbyte(TSL2561_ADDR);
		IR=i2c_recbyte();
		IR=IR<<8 + i2c_recbyte();
		i2c_stop();
		
		if(gain==1){
			ambient*=16;
			IR*=16;
		}
		
		ratio=IR/(float)ambient;
		if ((ratio >= 0) & (ratio <= 0.52)):
			lux = (0.0315 * ambient) - (0.0593 * ambient * (ratio**1.4))
		elif (ratio <= 0.65):
			lux = (0.0229 * ambient) - (0.0291 * IR)
		elif (ratio <= 0.80):
			lux = (0.0157 * ambient) - (0.018 * IR)
		elif (ratio <= 1.3):
			lux = (0.00338 * ambient) - (0.0026 * IR)
		elif (ratio > 1.3):
			lux = 0
		
		LCD_command(0x80);	//display on LCD
		LCD_BCD(rtc_val[2]);
		LCD_data(':');
		LCD_BCD(rtc_val[1]);
		LCD_data(':');
		LCD_BCD(rtc_val[0]);
		LCD_command(0xC0);
		LCD_BCD(rtc_val[6]);
		LCD_data('/');
		LCD_BCD(rtc_val[5]);
		LCD_data('/');
		LCD_BCD(rtc_val[4]);
	}
}