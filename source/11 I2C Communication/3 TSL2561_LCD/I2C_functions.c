sbit SDA=P2^1;
sbit SCL=P2^0;

void i2c_init();
void i2c_rstart();
void i2c_start();
void i2c_stop();
void i2c_sendbyte(unsigned char byte);
void i2c_sendack();
void i2c_sendnack();
unsigned char i2c_recbyte();

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

void i2c_sendbyte(unsigned char byte){
	unsigned char i;
	for(i=8;i>0;i--){
		SCL=0;
		SDA=byte>>(i-1)|0x01;
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
 
unsigned char i2c_recbyte(){
	unsigned char i,dat;
	for(i=8;i>0;i--){
		SCL=0;
		SCL=1;
		dat=dat<<1|SDA;
	}
	SCL=0;
	SDA=1;
	return dat;
}