#line 1 "C:/Users/Nacev/Desktop/MPS_LAB4/ZADACA2.c"
sbit otvorena at PORTA.B0;
sbit raboti at PORTA.B1;
sbit crveno at PORTD.B7;
sbit zolto at PORTD.B6;
sbit zeleno at PORTD.B5;
void main() {
ANSEL=0;
ANSELH=0;
TRISA.B0=1;
TRISA.B1=1;
TRISD=0x00;


while(1){
 while(otvorena==0){
 crveno=1;
 DELAY_1sec;
 crveno=0;
 zolto=1;
 DELAY_1sec;
 zolto=0;
 zeleno=1;
 DELAY_1sec;
 zeleno=0;
 }

 while(otvorena==1&&raboti==0){
 zolto=1;
 DELAY_1sec;
 zolto=0;
 crveno=1;
 DELAY_1sec;
 crveno=0;
 }
 while(otvorena==1&&raboti==1){
 zeleno=1;
 }

}
}
