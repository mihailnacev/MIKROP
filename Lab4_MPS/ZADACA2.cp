#line 1 "C:/Users/Nacev/Desktop/Lab4_MPS/ZADACA2.c"
sbit prekinuvac at PORTD.B1;

void main() {

int clock;
int P=0b01110011;
int A=0b01110111;
int E=0b01111001;
int value=0;
ANSEL=0;
ANSELH=0;
TRISD.B1=1;
TRISB=0x00;
TRISA=0b11111111;
EEPROM_Write(0x22,12);


while(1){
 clock=EEPROM_Read(0x22);
 while(prekinuvac==0){
 value=PORTA;
 value=value>>1;
 value=value<<3;
 value=value>>3;
 PORTB=0;
 }
 while(prekinuvac==1)
 {
 value=PORTA;
 value=value>>1;
 value=value<<3;
 value=value>>3;
 if(value>=0&&value<=12){
 if(value==clock){
 PORTB=A;
 DELAY_ms(15);
 PORTB=0;
 DELAY_ms(15);
 }
 PORTB=A;
 }
 else if(value>=13&&value<=23){
 if(value==clock){
 PORTB=P;
 DELAY_ms(15);
 PORTB=0;
 DELAY_ms(15);
 }
 PORTB=P;
 }
 else{
 if(value==clock){
 PORTB=E;
 DELAY_ms(15);
 PORTB=0;
 DELAY_ms(15);
 }
 PORTB=E;
 }
 }

}
}
