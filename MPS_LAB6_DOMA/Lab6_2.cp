#line 1 "C:/Users/Nacev/Desktop/MPS_LAB6/Lab6_2.c"
sbit LCD_RS at RB4_bit;
sbit LCD_EN at RB5_bit;
sbit LCD_D4 at RB0_bit;
sbit LCD_D5 at RB1_bit;
sbit LCD_D6 at RB2_bit;
sbit LCD_D7 at RB3_bit;
sbit LCD_RS_Direction at TRISB4_bit;
sbit LCD_EN_Direction at TRISB5_bit;
sbit LCD_D4_Direction at TRISB0_bit;
sbit LCD_D5_Direction at TRISB1_bit;
sbit LCD_D6_Direction at TRISB2_bit;
sbit LCD_D7_Direction at TRISB3_bit;

char keypadPort at PORTD;
char vnes[2];
char kp;
int broj;
char *text;
char sifra[16];
int brojac;
int i;
unsigned int res;
void main() {
 brojac=0;
 ANSEL = 0;
 ANSELH = 0b00001000;
 while(res == 0)
{
 res = ADC_Read(11);
}
 broj=res%100;
 Keypad_Init();
 ANSEL = 0;
 ANSELH = 0;
 Lcd_Init();
 Lcd_Cmd(_LCD_CURSOR_OFF);
 Lcd_Cmd(_LCD_CLEAR);
 for(i=0;i<2;i++)
{
 do
 kp=Keypad_Key_Click();
 while(!kp);

 switch(kp){
 case 1: vnes[i]='1'; break;
 case 2: vnes[i]='2'; break;
 case 3: vnes[i]='3'; break;
 case 4: vnes[i]='4'; break;
 case 5: vnes[i]='5'; break;
 case 6: vnes[i]='6'; break;
 case 7: vnes[i]='7'; break;
 case 8: vnes[i]='8'; break;
 case 9: vnes[i]='9'; break;
 };
}
#line 61 "C:/Users/Nacev/Desktop/MPS_LAB6/Lab6_2.c"
Lcd_Out(1,1,vnes);
IntToStr(broj,sifra);
text=Ltrim(sifra);
Lcd_Out(2,1,text);
Lcd_Cmd(_LCD_CURSOR_OFF);
Lcd_Cmd(_LCD_CLEAR);
if(memcmp(vnes,text,2)==0){
 Lcd_Out(1,1,"Tocna Sifra");
}


}
