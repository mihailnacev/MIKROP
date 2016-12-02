unsigned cnt;
void interrupt() { // код кој се извршува при секој настанат прекин
if (TMR0IF_bit) { // доколку настанал прекин од тајмер 0
cnt++; // зголеми го бројачот
TMR0IF_bit = 0; // ресетирај го TMR0IF
TMR0 = 96; // постави го TMR0 на основната вредност
}
}

void main() {
OPTION_REG = 0x84; // додели prescaler на TMR0
ANSEL = 0; // постави ги аналогните пинови како дигитални
ANSELH = 0;
C1ON_bit = 0; // исклучи компаратори
C2ON_bit = 0;
TRISB = 0; // PORTB е излез
PORTB = 0xFF; // иницијализирај го PORTB
TMR0 = 96; // почетна вредност на Timer0
INTCON = 0xA0; // овозможи прекини генерирани од TMRO
cnt = 0; // иницијализирај го cnt
do {
if (cnt >= 391) {
PORTB = ~PORTB; // инвертирај ги PORTB LED-те
cnt = 0; // ресетирај го cnt
}
} while(1);
}