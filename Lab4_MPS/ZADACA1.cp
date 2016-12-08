#line 1 "C:/Users/141142/Downloads/ZADACA1.c"
void main() {
int br1=10;
int br2=10;
int count=10;
int brojac1=128;
int brojac2=1;
int flag=1;
ANSEL=0;
ANSELH=0;
TRISB=0x00;
while(count>0){
 PORTB=brojac1+brojac2;
 br2=br1;
 while(br2>0){
 DELAY_ms(1);
 br2--;
 }


if(flag==1){
 if(brojac1>0){
 brojac1=brojac1>>1;
 brojac2=brojac2<<1;
 }

 else{
 flag=0; brojac1=1; brojac2=128;count--;
 }
 }

if(flag==0){
 if(brojac1<=32){
 brojac1=brojac1<<1;
 brojac2=brojac2>>1;
 }

 else{
 flag=1; brojac1=128; brojac2=1;count--; br1--;
 }
 }
 }
 PORTB=0;
}
