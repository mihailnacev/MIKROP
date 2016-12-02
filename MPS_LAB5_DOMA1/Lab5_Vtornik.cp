#line 1 "C:/Users/Nacev/Desktop/MIKROP-master/MPS_LAB5_DOMA/Lab5_Vtornik.c"
sbit LCD_RS at RA4_bit;
sbit LCD_EN at RA5_bit;
sbit LCD_D4 at RA0_bit;
sbit LCD_D5 at RA1_bit;
sbit LCD_D6 at RA2_bit;
sbit LCD_D7 at RA3_bit;
sbit LCD_RS_Direction at TRISA4_bit;
sbit LCD_EN_Direction at TRISA5_bit;
sbit LCD_D4_Direction at TRISA0_bit;
sbit LCD_D5_Direction at TRISA1_bit;
sbit LCD_D6_Direction at TRISA2_bit;
sbit LCD_D7_Direction at TRISA3_bit;
 int brb=123;
const int len1=7;
const int len2=6;
int i;
char *text1;
char *text2;
char *text3;
char *p1;
char *p2;
char ch;
int brojac=0;
unsigned cnt1;
unsigned cnt2;
int flag=0;
char cifra[1];

void interrupt(){
if(flag==0) cnt1++;
else cnt2++;
TMR0=6;
INTCON=0xA0;
}
void main() {
ANSEL = 0;
ANSELH = 0;
text1="Popust$";
text2="Golem$";
text3="GRESKA";
#line 64 "C:/Users/Nacev/Desktop/MIKROP-master/MPS_LAB5_DOMA/Lab5_Vtornik.c"
OPTION_REG=0x85;
TMR0=6;
INTCON=0xA0;
cnt1=0;
cnt2=0;
Lcd_Init();
Lcd_Cmd(_LCD_CURSOR_OFF);
Lcd_Cmd(_LCD_CLEAR);

Lcd_Out(1,3,"Tekoven broj:");
IntToStr(brb,cifra);
Lcd_Out(2,1,cifra);
do {
if(flag==0){

if (cnt1>=40) {
cnt1 = 0;
Lcd_Cmd(_LCD_CURSOR_OFF);
Lcd_Cmd(_LCD_CLEAR);
Lcd_Out(1,1,text1);
flag=1;}
}

if(flag==1){

if (cnt2>=7) {
cnt2 = 0;
Lcd_Cmd(_LCD_CURSOR_OFF);
Lcd_Cmd(_LCD_CLEAR);
Lcd_Out(2,1,text2);
flag=0;}
}


} while(1);
}
