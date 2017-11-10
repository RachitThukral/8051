#unclude<reg51.h>
#include<I2C_functions.c>
#define OLED_ADDR 0x78
#define OLED_NCMD 0x00
#define OLED_NDATA 0x40
#define OLED_OFF 0xAE
#define OLED_ON 0xAF
#define OLED_MEMMODE 0x20 //HORIZONTAL INCREMENT
#define OLED_COLADDR 0x21
#define OLED_LINEADDR 0x22	//PAGE_ADDR
#define OLED_NOR 0xA6
#define OLED_INV 0xA7
#define DIV_RATIO 0xD5
#define MUX_RATIO 0xA8
#define DIS_OFFSET 0xD3
#define START_LINE 0x40
#define CHARGE_PUMP 0xD
#define SEGMENT_REMAP 0xA1	//HORIZONTAL LEFT/RIGHT
#define DIR_DEC 0xC8
#define COM_PINS 0xDA
#define CONTRAST_CONTROL 0x81
#define PRECHARGE_PERIOD 0xD9
#define VCOM_DESELECT 0xDB
#define ON_RESUME 0xA4
	
void oled_init(){
	i2c_init();
	i2c_sendbyte(OLED_OFF);
	i2c_sendbyte(DIV_RATIO);
	i2c_sendbyte(0x80);
	i2c_sendbyte(MUX_RATIO);
	i2c_sendbyte(0x3F);
	i2c_sendbyte(DIS_OFFSET);
	i2c_sendbyte(0x00);
	i2c_sendbyte(START_LINE);
	i2c_sendbyte(CHARGE_PUMP);
	i2c_sendbyte(0x14);
	i2c_sendbyte(OLED_MEMMODE);
	i2c_sendbyte(0x00);
	i2c_sendbyte(SEGMENT_REMAP);
	i2c_sendbyte(DIR_DEC);
	i2c_sendbyte(COM_PINS);
	i2c_sendbyte(0x12);
	i2c_sendbyte(CONTRAST_CONTROL);
	i2c_sendbyte(0xCF);
	i2c_sendbyte(PRECHARGE_PERIOD);
	i2c_sendbyte(0xF1);
	i2c_sendbyte(VCOM_DESELECT);
	i2c_sendbyte(0x40);
	i2c_sendbyte(ON_RESUME);
	i2c_sendbyte(OLED_NOR);
	i2c_sendbyte(OLED_ON);
	oled_clear();
}

void oled_cmd(unsigned char cmd){
	i2c_start();
	i2c_sendbyte(OLED_ADDR);
	i2c_sendbyte(OLED_NCMD);
	i2c_sendbyte(cmd);
	i2c_stop();
}

void oled_data(unsigned char dat){
	i2c_start();
	i2c_sendbyte(OLED_ADDR);
	i2c_sendbyte(OLED_NDATA);
	i2c_sendbyte(dat);
	i2c_stop();
}

void oled_setcur(unsigned char col, unsigned char line){
	i2c_start();
	i2c_sendbyte(OLED_ADDR);
	i2c_sendbyte(OLED_COLADDR);
	i2c_sendbyte(col);
	i2c_sendbyte(127);
	i2c_restart();
	i2c_sendbyte(OLED_ADDR);
	i2c_sendbyte(OLED_LINEADDR);
	i2c_sendbyte(line);
	i2c_sendbyte(7);
	i2c_stop();
}

void oled_clear(){
	unsigned char i,j;
	oled_setcur(0,0);
	i2c_start();
	i2c_sendbyte(OLED_ADDR);
	i2c_sendbyte(OLED_NDATA);
	for(i=0;i<8;i++)
		for(j=0;j<128;i++)
			i2c_sendbyte(0);
	i2c_stop();
}