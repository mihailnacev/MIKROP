
char uart_rd;
void main() {
ANSEL = 0;
ANSELH = 0;
C1ON_bit = 0; // �� ����������� �������������
C2ON_bit = 0;
UART1_Init(9600); // ������������ �� UART ������� �� 9600 bps
Delay_ms(50); // ������ ������� �� �� �����������
UART1_Write_Text("Start"); // ����� ����� ����� �������
UART1_Write(10); // ����� ��� ���
UART1_Write(13);
while (1) { // ���������� ������
if (UART1_Data_Ready()) { // ��� ��� �������� �� �������,
uart_rd = UART1_Read(); // ������� �� ����������,
UART1_Write(uart_rd); // � ����� �� ����� ����� UART
}
}
}
