#line 1 "C:/Users/Nacev/Desktop/MIKROP/MPS_LAB7_DOMA/Lab7_Cetvrtok.c"
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
char uart_rd;
char zbor[10];
char strings[5][10];
int i;
int j;
int brZborovi;
void main() {
 ANSEL = 0;
 ANSELH = 0;
 C1ON_bit = 0;
 C2ON_bit = 0;
 i=0;
 j=0;
Lcd_Init();
Lcd_Cmd(_LCD_CLEAR);
Lcd_Cmd(_LCD_CURSOR_OFF);
UART1_Init(9600);
Delay_ms(50);
while (1) {
if (UART1_Data_Ready()) {
uart_rd = UART1_Read();

 if(isAlpha(uart_rd)){

 zbor[j++]=uart_rd;
 }
 else{
 if(uart_rd==' '){
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);
 for(j=0;j<10;j++){
 strings[i][j]=zbor[j];}
 Lcd_Out(1,1,strings[i]);
 Delay_ms(100);
 for(j = 0; j < 10; ++j )
 zbor[j] = (char)0;
 i++;
 j=0;
 }
 else if(uart_rd=='.'){
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);
 for(j=0;j<10;j++){
 strings[i][j]=zbor[j];}
 Delay_ms(100);
 for(j = 0; j < 10; ++j )
 zbor[j] = (char)0;
 i++;
 j=0;
 break;
 }
 else{
 for(j = 0; j < 10; ++j )
 zbor[j] = (char)0;
 j=0;
 }

 }
}
}
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);
 Lcd_Out(1,1,"OUT");
brZborovi=i-1;
for(j=0;j<20;i++){
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);
 Lcd_Chr(1,j,strings[0][j]);
}
}
