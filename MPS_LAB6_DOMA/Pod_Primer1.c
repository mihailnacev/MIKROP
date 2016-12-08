// ����������� �� �������� �� keypad
char keypadPort at PORTD;
// ����������� �� �������� �� LCD
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
cnt = 0; // �� �������� ������� �� ���� �������������� ���������� �������
Keypad_Init(); // ������������� keypad
ANSEL = 0; // AN �������� �� ������������� �� ���������
ANSELH = 0;
Lcd_Init(); // ������������� �� LCD
Lcd_Cmd(_LCD_CLEAR); // ������� �� �����
Lcd_Cmd(_LCD_CURSOR_OFF); // �� ��������� ��������
Lcd_Out(1, 1, "Key :"); // �� ������ ������ �� LCD
Lcd_Out(2, 1, "Times:");
do // �� ��������� �������� ������ �� ��� ������
{
kp = 0; // �� �������� kp �� ��� �� ���� ����� �� ������������ ������
// �� ���� �� �� �������� ������
do
kp = Keypad_Key_Click(); // �� ���� ����� �� �������� �� kp
while (!kp); //kp �� ���� 0 ��� �� � ��������� ������
// �� ������������ kp �� ��������� ASCII ��� �� �������� (�������� ������ ������)
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
// ��� ������������ ������ � �������� �� �����������
cnt = 1;
oldstate = kp;
}
else
{
// ��� ������������ ������ � ��� �� �����������
cnt++;
}
Lcd_Chr(1, 10, kp); // �� ������ ASCII ����� �� LCD
if (cnt == 255)
{
// ��� ������� overflow �� cnt ����� �� ��������
cnt = 0;
Lcd_Out(2, 10, " ");
}
WordToStr(cnt, txt); // �� ������������ ��������� �� ������� �� ������ Lcd_Out(2, 10, txt); // �� ��������� ������� �� LCD
} while (1);
}