sbit SDA=P2^1;
sbit SCL=P2^0;
	
void i2c_init(){
	SDA=1;
	SCL=1;
}

void i2c_rstart(){
	SCL=0;
	SDA=1;
	SCL=1;
	SDA=0;
}

void i2c_start(){
	SCL=1;
	SDA=0;
	SCL=0;
}

void i2c_stop(){
	SCL=0;
	SDA=0;
	SCL=1;
	SDA=1;
}

void i2c_sendbyte(){
	unsigned char i;
	for(i=0;i<8;i++){
		SCL=0;
		SDA=ACC^7;
		ACC=ACC<<1;
		SCL=1;
	}
	SCL=0;
	SDA=0;
	SCL=1;
	while(SDA==1);
	SCL=0;
}

void i2c_sendack(){
	SDA=0;
	SCL=1;
	SCL=0;
	SDA=1;
}

void i2c_sendnack(){
	SDA=1;
	SCL=1;
	SCL=0;
	SCL=1;
}
 
void i2c_recbyte(){
	unsigned char i;
	for(i=0;i<8;i++){
		SCL=0;
		SCL=1;
		ACC^0=SDA;
		ACC=ACC<<1;
	}
	SCL=0;
	SDA=1;
}