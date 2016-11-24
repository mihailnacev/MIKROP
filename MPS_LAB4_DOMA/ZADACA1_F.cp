#line 1 "C:/Users/Nacev/Desktop/MPS_LAB4/ZADACA1_F.c"
sfr int B at PORTB;
 void main() {
 int count = 5;
 ANSEL = 0;
 ANSELH = 0;
 TRISB=0x00;
 PORTB=0x00;
#line 14 "C:/Users/Nacev/Desktop/MPS_LAB4/ZADACA1_F.c"
 while(count>0){
 PORTB=0b10000000;
 while(PORTB > 0){
 Delay_1sec;
 PORTB = PORTB / 4;
 }
 PORTB=0b00000001;
 while(PORTB <=32){
 Delay_1sec;
 PORTB = PORTB * 4;
 }
 count--;
}
}
