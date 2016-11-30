#line 1 "C:/Users/Nacev/Desktop/MPS_LAB5_DOMA/zad1.c"








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

char *text1;
char *text2;
char *text;
int i;
char ch;
short number;
unsigned counter;
bit prv;
void interrupt()
{
 if(TMR0IF_bit)
 {
 TMR0IF_bit=0;
 counter++;
 TMR0=0;
 }
}
void main() {
 OPTION_REG=0x86;
 ANSEL=0;
 ANSELH=0;
 number=0;
 INTCON=0xA0;
 strcpy(text1,"Popust1$");
 strcpy(text2,"Popust2$");
 for(i=0; i<8; i++)
 {
 EEPROM_Write(0x00 + i, text1[i]);
 }
 for(i=0; i<8; i++)
 {
 EEPROM_Write(0x20 + i, text2[i]);
 }
 for (i=0;i<8;i++)
 {
 ch=EEPROM_Read(0x00+i);
 if(ch!='$')
 {
 number++;
 text1[i]=ch;
 }
 }
 for (i=0;i<8;i++)
 {
 ch=EEPROM_Read(0x20+i);
 if(ch!='$')
 {
 number++;
 text2[i]=ch;
 }
 }
 Lcd_Init();
 if(number>16)
 {
 Lcd_Cmd(_LCD_CURSOR_OFF);
 Lcd_Cmd(_LCD_CLEAR);
 strcpy(text,"Greshka");
 Lcd_Out(1,1,text);
 }
 else
 {
 while(1)
 {
 if(prv)
 {
 if(counter<235)
 {
 Lcd_Cmd(_LCD_CURSOR_OFF);
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(1,1,text1);
 }
 else
 {
 prv=0;
 }
 }
 else
 {
 if(counter<313)
 {
 Lcd_Cmd(_LCD_CURSOR_OFF);
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(2,1,text2);
 }
 else
 {
 prv=1;
 }
 }
 }
 }
}
