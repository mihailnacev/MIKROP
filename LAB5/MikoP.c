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
int i;
char *text1;
char *text2;
char *text3;
char *p1;
char *p2;
char ch;
int brojac=1;
unsigned cnt1;
unsigned cnt2;
int flag=0;
char cifra[16];

void interrupt(){
if(INTCON.RBIE && INTCON.INTF && flag == 0){
brojac++;
TMR0=6;
cnt1 = 0;
cnt2 = 0;
}

else if(INTCON.T0IF){
if(flag==0) cnt1++;
else cnt2++;
TMR0=6;
}
INTCON=0xA8;
}

void main() {
ANSEL = 0;
ANSELH = 0;
TRISB = 0b00000001;
text1="Tekoven broj:";
text2="NeRaboti";
OPTION_REG=0x86;
TMR0=6;
INTCON=0xA8;
cnt1=0;
cnt2=0;
Lcd_Init();
Lcd_Cmd(_LCD_CURSOR_OFF);
Lcd_Cmd(_LCD_CLEAR);

Lcd_Out(1,1,text1);
IntToStr(brojac,cifra);
text3 = Ltrim(cifra);
Lcd_Out(2,1,cifra);
do {
if(flag==0){

if(cnt1 == 0){
Lcd_Cmd(_LCD_CURSOR_OFF);
Lcd_Cmd(_LCD_CLEAR);
IntToStr(brojac,cifra);
text3 = Ltrim(cifra);
Lcd_Out(1,1,text1);
Lcd_Out(2,1,text3);
}

if (cnt1>=3) {
cnt1 = 0;
Lcd_Cmd(_LCD_CURSOR_OFF);
Lcd_Cmd(_LCD_CLEAR);
Lcd_Out(1,1,text2);
flag=1;
}

}

if(flag==1){

if (cnt2>=6) {
Lcd_Cmd(_LCD_CURSOR_OFF);
Lcd_Cmd(_LCD_CLEAR);
break;
}

}
} while(1);
}