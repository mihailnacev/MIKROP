// Поставување на конекции за LCD
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

const int len = 16;
char ch;
int i;
char text[20], text2[20];
void main() {
ANSEL = 0;
ANSELH = 0;
Lcd_Init();
Lcd_Cmd(_LCD_CURSOR_OFF);
Lcd_Cmd(_LCD_CLEAR);
Lcd_Cmd(_LCD_TURN_ON);
Lcd_Cmd(_LCD_CLEAR);
strcpy(text,"Demo text");
Lcd_Out(1,1,text); //се печати Demo text во првиот ред
strcpy(text2,"Second line");
Lcd_Out(2,1,text2); //се печати Second line во вториот ред
}