unsigned cnt;
void interrupt() { // ��� �� �� �������� ��� ���� �������� ������
if (TMR0IF_bit) { // ������� �������� ������ �� ����� 0
cnt++; // ������� �� �������
TMR0IF_bit = 0; // �������� �� TMR0IF
TMR0 = 96; // ������� �� TMR0 �� ��������� ��������
}
}

void main() {
OPTION_REG = 0x84; // ������ prescaler �� TMR0
ANSEL = 0; // ������� �� ���������� ������ ���� ���������
ANSELH = 0;
C1ON_bit = 0; // ������� �����������
C2ON_bit = 0;
TRISB = 0; // PORTB � �����
PORTB = 0xFF; // ������������ �� PORTB
TMR0 = 96; // ������� �������� �� Timer0
INTCON = 0xA0; // �������� ������� ���������� �� TMRO
cnt = 0; // ������������ �� cnt
do {
if (cnt >= 391) {
PORTB = ~PORTB; // ��������� �� PORTB LED-��
cnt = 0; // �������� �� cnt
}
} while(1);
}