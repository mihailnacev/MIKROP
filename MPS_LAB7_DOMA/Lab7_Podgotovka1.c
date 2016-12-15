
char uart_rd;
void main() {
ANSEL = 0;
ANSELH = 0;
C1ON_bit = 0; // се исклучуваат компараторите
C2ON_bit = 0;
UART1_Init(9600); // Иницијализирај го UART модулот на 9600 bps
Delay_ms(50); // Почекај модулот да се стабилизира
UART1_Write_Text("Start"); // Прати текст преку модулот
UART1_Write(10); // Прати нов ред
UART1_Write(13);
while (1) { // Бесконечен циклус
if (UART1_Data_Ready()) { // Ако има податоци за примање,
uart_rd = UART1_Read(); // преземи ги податоците,
UART1_Write(uart_rd); // и прати ги назад преку UART
}
}
}
