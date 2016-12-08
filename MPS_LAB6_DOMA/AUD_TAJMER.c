unsigned cnt;
//LCD
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
//keypad
char keypadPort at PORTD;
void interrupt(){
if(TMR0IF_bit){
   cnt++;
   TMR0IF_bit=0;
   TMR0=96;
}
}
char kp;
int i;
char bukvi[10];
char print[6];
char sifra[9];
char tel[]="010111000";
int suma=0;
void main() {
 OPTION_REG=0x84; //prescaler 1:32
 ANSEL=0;
 ANSELH=0;
 C1ON_bit=0;
 C2ON_bit=0;
 Keypad_Init();
 Lcd_Init();
 Delay_ms(100);
 Lcd_Cmd(_LCD_CURSOR_OFF);
 Lcd_Cmd(_LCD_CLEAR);
 TMR0=96;
 INTCON=0xA0;
 cnt=0;
 for(i=0;i<=9;i++){
 IntToStr(i,print);
 Lcd_Out(1,1,"vnesi sifra za");
 Lcd_Out(2,1,print);
 cnt=0;
 
 do{
    kp=Keypad_Key_Click();
    
    //Tajmer meri 20ms
    if(cnt>=10){
       Lcd_Cmd(_LCD_CURSOR_OFF);
       Lcd_Cmd(_LCD_CLEAR);
       Lcd_Out(1,1,"Vremeto istece");
       Lcd_Out(2,1,"Pobrzajte");
    }
    
 }while(!kp);
 
 switch (kp)
{
case 1: bukvi[i]='a'; break;
case 2: bukvi[i]='e'; break;
case 3: bukvi[i]='i'; break;
case 4: bukvi[i]='m'; break;
case 5: bukvi[i]='B'; break;
case 6: bukvi[i]='F'; break;
case 7: bukvi[i]='J'; break;
case 8: bukvi[i]='N'; break;
case 9: bukvi[i]='c'; break;
case 10: bukvi[i]='g'; break;
case 11: bukvi[i]='k'; break;
case 12: bukvi[i]='o'; break;
case 13: bukvi[i]='d'; break;
case 14: bukvi[i]='h'; break;
case 15: bukvi[i]='l'; break;
case 16: bukvi[i]='p'; break;
}
 } // kraj na for
       Lcd_Cmd(_LCD_CURSOR_OFF);
       Lcd_Cmd(_LCD_CLEAR);
       Lcd_Out(1,1,bukvi);
}