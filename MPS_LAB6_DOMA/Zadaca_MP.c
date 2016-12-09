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
// конекции за keypad
char keypadPort at PORTD;
char vnes[2];
char kp;
int broj;
char *text;
char sifra[16];
int brojac;
int i;
unsigned int res1;
unsigned int res2;
int m;
int brojP;
char term;
void main() {
 brojP=0;
 ANSEL = 0x3;
 ANSELH = 0;
 while(m == 0)
{
        m = ADC_Read(0);
}
while(broj == 0){
      broj = ADC_Read(1);
}
brojac=m;
EEPROM_Write(0x20,broj);
  Keypad_Init();
  ANSEL = 0;
  ANSELH = 0;
  Lcd_Init();
  Lcd_Cmd(_LCD_CURSOR_OFF);
  Lcd_Cmd(_LCD_CLEAR);
 for(i=0;i<m;i++)
 {
 
do{
 do
 kp=Keypad_Key_Click();
 while(!kp);
 
 switch(kp){
   case 1: brojP=brojP*10+1; break;
   case 2:  brojP=brojP*10+2; break;
   case 3: brojP=brojP*10+3; break;
   case 4:     break;
   case 5:    brojP=brojP*10+4; break;
   case 6:    brojP=brojP*10+5; break;
   case 7:    brojP=brojP*10+6; break;
   case 8:    break;
   case 9:    brojP=brojP*10+7; break;
   case 10:   brojP=brojP*10+8; break;
   case 11:   brojP=brojP*10+9; break;
   case 12:             break;
   case 13:   kp='*' ;    break;
   case 14:             break;
   case 15:             break;
   case 16:             break;
 };
 } while(kp!='*');
  if(brojP==broj){
    Lcd_Cmd(_LCD_CURSOR_OFF);
    Lcd_Cmd(_LCD_CLEAR);
    Lcd_Out(1,1,"Pogodok");
    break;
  }
  else{
     Lcd_Cmd(_LCD_CURSOR_OFF);
     Lcd_Cmd(_LCD_CLEAR);
     Lcd_Out(1,1,"Vnesovte: ");
     IntToStr(brojP,sifra);
     text=Ltrim(sifra);
     Lcd_Out(1,11,text);
     Lcd_Out(2,1,"Imate ");
     brojac--;
     IntToStr(brojac,sifra);
     text=Ltrim(sifra);
     Lcd_Out(2,7,sifra);
     brojP=0;
  }
}
/*IntToStr(broj,sifra);
text=Ltrim(sifra);
Lcd_Cmd(_LCD_CURSOR_OFF);
Lcd_Cmd(_LCD_CLEAR);
*/
Lcd_Cmd(_LCD_CURSOR_OFF);
Lcd_Cmd(_LCD_CLEAR);
Lcd_Out(1,1,"Kraj");
/*IntToStr(broj,sifra);
text=Ltrim(sifra);
Lcd_Out(2,1,text);
Lcd_Cmd(_LCD_CURSOR_OFF);
Lcd_Cmd(_LCD_CLEAR);
if(memcmp(vnes,text,2)==0){
  Lcd_Out(1,1,"Tocna Sifra");
}
*/

}