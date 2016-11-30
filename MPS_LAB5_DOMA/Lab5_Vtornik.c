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

void interrupt(){
if(flag==0) cnt1++;
else cnt2++;
TMR0=236;
INTCON=0xA0;
}
void main() {
ANSEL = 0;
ANSELH = 0;
text1="Popust$";
text2="Golem$";
text3="GRESKA";
Delay_ms(20);
for(i=0;i<len1-1;i++){
   EEPROM_Write(0x00 + i, text1[i]);
   Delay_ms(20);
}
Delay_ms(20);
for(i=0;i<len2-1;i++){
   EEPROM_Write(0x20 + i,text2[i]);
   Delay_ms(20);
}

for(i=0;i<len1-2;i++){
   ch=EEPROM_Read(0x00+i);
   brojac++;
   text1[i]=ch;
}

for(i=0;i<len2-2;i++){
   ch=EEPROM_Read(0x20+i);
   brojac++;
   text2[i]=ch;
}

OPTION_REG=0x86;
TMR0=236;
INTCON=0xA0;
cnt1=0;
cnt2=0;
Lcd_Init();
Lcd_Cmd(_LCD_CURSOR_OFF);
Lcd_Cmd(_LCD_CLEAR);

do {

if(flag==0){

if (cnt1>=12) {
cnt1 = 0;
Lcd_Cmd(_LCD_CURSOR_OFF);
Lcd_Cmd(_LCD_CLEAR);
Lcd_Out(1,1,text1);
flag=1;}
}

if(flag==1){

if (cnt2>=16) {
cnt2 = 0;
Lcd_Cmd(_LCD_CURSOR_OFF);
Lcd_Cmd(_LCD_CLEAR);
Lcd_Out(2,1,text2);
flag=0;}
}


} while(1);
}