// Поставување на конекции за keypad
char keypadPort at PORTD;
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
int cnt;
char kp,oldstate;
char txt[30];
void main()
{
cnt = 0; // се ресетира бројачот на исти последователно притиснати тастери
Keypad_Init(); // иницијализација keypad
ANSEL = 0; // AN пиновите се конфигурираат на дигитални
ANSELH = 0;
Lcd_Init(); // иницијализација на LCD
Lcd_Cmd(_LCD_CLEAR); // екранот се чисти
Lcd_Cmd(_LCD_CURSOR_OFF); // се исклучува курсорот
Lcd_Out(1, 1, "Key :"); // се печати порака на LCD
Lcd_Out(2, 1, "Times:");
do // се повторува постојано читање на нов тастер
{
kp = 0; // се ресетира kp во која се чува кодот за притиснатиот тастер
// се чека да се притисне тастер
do
kp = Keypad_Key_Click(); // се чува кодот на тастерот во kp
while (!kp); //kp ќе биде 0 ако не е притиснат тастер
// се трансформира kp во соодветен ASCII код на тастерот (табелата дадена погоре)
switch (kp)
{
case 1: kp = 49; break; // 1
case 2: kp = 50; break; // 2
case 3: kp = 51; break; // 3
case 4: kp = 65; break; // A
case 5: kp = 52; break; // 4
case 6: kp = 53; break; // 5
case 7: kp = 54; break; // 6
case 8: kp = 66; break; // B
case 9: kp = 55; break; // 7
case 10: kp = 56; break; // 8
case 11: kp = 57; break; // 9
case 12: kp = 67; break; // C
case 13: kp = 42; break; // *
case 14: kp = 48; break; // 0
case 15: kp = 35; break; // #
case 16: kp = 68; break; // D
}
if (kp != oldstate)
{
// ако притиснатиот тастер е различен од претходниот
cnt = 1;
oldstate = kp;
}
else
{
// ако притиснатиот тастер е ист со претходниот
cnt++;
}
Lcd_Chr(1, 10, kp); // се печати ASCII кодот на LCD
if (cnt == 255)
{
// ако настане overflow на cnt тогаш се ресетира
cnt = 0;
Lcd_Out(2, 10, " ");
}
WordToStr(cnt, txt); // се трансформира вредноста на бројачот во стринг Lcd_Out(2, 10, txt); // се прикажува бројачот на LCD
} while (1);
}