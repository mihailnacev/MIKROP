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
char matrica[8][10];
int dolzina[8]={0,0,0,0,0,0,0,0};
int pojavuvanja[8]={0,0,0,0,0,0,0,0};
int broi[8];
char tekoven[10];
int i;
int j;
int k;
int l;
int brZborovi;
int flag;
char sifra[16];
char *text;
int poj;
int q;
void main(){
    ANSEL=0;
    ANSELH=0;
    UART1_Init(9600);
    Delay_ms(100);
    i=0;
    j=0;
    k=0;
    l=0;
    q=0;
    poj=0;
    flag=1;
    while(1){
       if(UART1_Data_Ready()){
         uart_rd=UART1_Read();
         
         if(uart_rd==' '){
           j=0;
           i++;
         }
         else if(uart_rd=='.'){
            i++;
            break;
         }
         else{
            matrica[i][j]=uart_rd;
            dolzina[i]++;
            j++;
         }
       }
    
    }
    
    Lcd_Init();
    Lcd_Cmd(_LCD_CURSOR_OFF);
    Lcd_Cmd(_LCD_CLEAR);
    brZborovi=i;
    for(i=0;i<5;i++){
         broi[i]=0;

    }
    for(i=0;i<brZborovi;i++){
       for(q = 0; q < 10;  ++q )
          tekoven[q] = (char)0;
       for(j=0;j<dolzina[i];j++){
         Lcd_Chr(1,j+1,matrica[i][j]);
         tekoven[j]=matrica[i][j];
       }
      Delay_ms(20);
      Lcd_Cmd(_LCD_CURSOR_OFF);
      Lcd_Cmd(_LCD_CLEAR);
      for(k=0;k<brZborovi;k++){
         flag=1;
       for(l=0;l<dolzina[k];l++){
         if(tekoven[l]==matrica[k][l]){
            flag=1;
         }
         else{
            flag=0;
            break;
         }
       }
       if(flag==1) {broi[k]=broi[k]+1;}
       }
      /* IntToStr(broi[k],sifra);
       text=Ltrim(sifra);
       Lcd_Out(2,1,text); */
    }
    
    for(i=0;i<brZborovi;i++){
         Lcd_Cmd(_LCD_CURSOR_OFF);
         Lcd_Cmd(_LCD_CLEAR);
       for(j=0;j<dolzina[i];j++){
         Lcd_Chr(1,j+1,matrica[i][j]);
         tekoven[j]=matrica[i][j];
       }
      IntToStr(broi[i],sifra);
       text=Ltrim(sifra);
       Lcd_Out(2,1,text);
       Delay_ms(30);
    }
/*    for(i=0;i<brZborovi;i++){
         Lcd_Cmd(_LCD_CURSOR_OFF);
         Lcd_Cmd(_LCD_CLEAR);
         IntToStr(broi[i],sifra);
         text=Ltrim(sifra);
         Lcd_Out(2,1,text);
     }*/
}