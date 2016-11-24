#line 1 "C:/Users/Nacev/Desktop/MPS_LAB4/ZADACA1.c"
void main() {
int flag;
int brojac=5;
ANSEL=0;
ANSELH=0;
TRISB=0;
PORTB=0b10000000;
flag=1;
while(brojac>0){
Delay_1sec;
if(flag==1)
{
if(PORTB>0)
{PORTB=PORTB>>2;}
else
{flag=0; PORTB=0b00000001; brojac--;}
}

if(flag==0)
{
if(PORTB<=32)
{PORTB=PORTB<<2;}
else{
{flag=1; PORTB=0b10000000; brojac--;}
}
}

}

}
