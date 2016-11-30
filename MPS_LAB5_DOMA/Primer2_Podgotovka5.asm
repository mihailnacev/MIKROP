
_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;Primer2_Podgotovka5.c,2 :: 		void interrupt() { // код кој се извршува при секој настанат прекин
;Primer2_Podgotovka5.c,3 :: 		if (TMR0IF_bit) { // доколку настанал прекин од тајмер 0
	BTFSS      TMR0IF_bit+0, BitPos(TMR0IF_bit+0)
	GOTO       L_interrupt0
;Primer2_Podgotovka5.c,4 :: 		cnt++; // зголеми го бројачот
	INCF       _cnt+0, 1
	BTFSC      STATUS+0, 2
	INCF       _cnt+1, 1
;Primer2_Podgotovka5.c,5 :: 		TMR0IF_bit = 0; // ресетирај го TMR0IF
	BCF        TMR0IF_bit+0, BitPos(TMR0IF_bit+0)
;Primer2_Podgotovka5.c,6 :: 		TMR0 = 96; // постави го TMR0 на основната вредност
	MOVLW      96
	MOVWF      TMR0+0
;Primer2_Podgotovka5.c,7 :: 		}
L_interrupt0:
;Primer2_Podgotovka5.c,8 :: 		}
L_end_interrupt:
L__interrupt6:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt

_main:

;Primer2_Podgotovka5.c,10 :: 		void main() {
;Primer2_Podgotovka5.c,11 :: 		OPTION_REG = 0x84; // додели prescaler на TMR0
	MOVLW      132
	MOVWF      OPTION_REG+0
;Primer2_Podgotovka5.c,12 :: 		ANSEL = 0; // постави ги аналогните пинови како дигитални
	CLRF       ANSEL+0
;Primer2_Podgotovka5.c,13 :: 		ANSELH = 0;
	CLRF       ANSELH+0
;Primer2_Podgotovka5.c,14 :: 		C1ON_bit = 0; // исклучи компаратори
	BCF        C1ON_bit+0, BitPos(C1ON_bit+0)
;Primer2_Podgotovka5.c,15 :: 		C2ON_bit = 0;
	BCF        C2ON_bit+0, BitPos(C2ON_bit+0)
;Primer2_Podgotovka5.c,16 :: 		TRISB = 0; // PORTB е излез
	CLRF       TRISB+0
;Primer2_Podgotovka5.c,17 :: 		PORTB = 0xFF; // иницијализирај го PORTB
	MOVLW      255
	MOVWF      PORTB+0
;Primer2_Podgotovka5.c,18 :: 		TMR0 = 96; // почетна вредност на Timer0
	MOVLW      96
	MOVWF      TMR0+0
;Primer2_Podgotovka5.c,19 :: 		INTCON = 0xA0; // овозможи прекини генерирани од TMRO
	MOVLW      160
	MOVWF      INTCON+0
;Primer2_Podgotovka5.c,20 :: 		cnt = 0; // иницијализирај го cnt
	CLRF       _cnt+0
	CLRF       _cnt+1
;Primer2_Podgotovka5.c,21 :: 		do {
L_main1:
;Primer2_Podgotovka5.c,22 :: 		if (cnt >= 391) {
	MOVLW      1
	SUBWF      _cnt+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main8
	MOVLW      135
	SUBWF      _cnt+0, 0
L__main8:
	BTFSS      STATUS+0, 0
	GOTO       L_main4
;Primer2_Podgotovka5.c,23 :: 		PORTB = ~PORTB; // инвертирај ги PORTB LED-те
	COMF       PORTB+0, 1
;Primer2_Podgotovka5.c,24 :: 		cnt = 0; // ресетирај го cnt
	CLRF       _cnt+0
	CLRF       _cnt+1
;Primer2_Podgotovka5.c,25 :: 		}
L_main4:
;Primer2_Podgotovka5.c,26 :: 		} while(1);
	GOTO       L_main1
;Primer2_Podgotovka5.c,27 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
