#line 1 "C:/Users/Nacev/Desktop/MPS_Lab7/Lab7_Sreda.c"
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

sbit SoftSpi_CLK at RA3_bit;
sbit SoftSpi_SDI at RA4_bit;
sbit SoftSpi_SDO at RA5_bit;
sbit SoftSpi_CLK_Direction at TRISA3_bit;
sbit SoftSpi_SDI_Direction at TRISA4_bit;
sbit SoftSpi_SDO_Direction at TRISA5_bit;

char beingRead;
int counter;
short int sequenceCounter;
char pChar;
char ppChar;
char pppChar;
char *strings[20];
char appendStr[4];
int i;
int j;

void main() {
 ANSEL = 0;
 ANSELH = 0;
 C1ON_bit = 0;
 C2ON_bit = 0;
 counter = 0;
 sequenceCounter = 0;
 i = 0;
 j = 0;

 Soft_SPI_Init();

 Lcd_Init();
 Lcd_Cmd(_LCD_CURSOR_OFF);
 Lcd_Cmd(_LCD_CLEAR);

 UART1_Init(9600);
 Delay_ms(50);
 while(1)
 {
 if(UART1_Data_Ready())
 {
 beingRead = UART1_Read();
 if(counter == 3)
 {
 if(!isdigit(beingRead))
 {
 counter = 0;
 appendStr[0] = pChar;
 appendStr[1] = ppChar;
 appendStr[2] = pppChar;
 strings[i] = appendStr;

 Lcd_Out(1, 1, appendStr);

 i++;
 sequenceCounter++;

 for(j = 0; j < 20; j++)
 {
 if(strcmp(strings[j], appendStr) == 0)
 {
 Soft_SPI_Write(sequenceCounter);
 break;
 }
 }
 }
 }
 else
 {
 if(isdigit(beingRead))
 {
 if(counter == 0)
 {
 pChar = beingRead;
 }
 else if(counter == 1)
 {
 ppChar = beingRead;
 }
 else if(counter == 2)
 {
 pppChar = beingRead;
 }
 counter++;
 }
 }
 }
 }
}
