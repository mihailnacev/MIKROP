
_main:

;Lab7_Podgotovka1.c,3 :: 		void main() {
;Lab7_Podgotovka1.c,4 :: 		ANSEL = 0;
	CLRF       ANSEL+0
;Lab7_Podgotovka1.c,5 :: 		ANSELH = 0;
	CLRF       ANSELH+0
;Lab7_Podgotovka1.c,6 :: 		C1ON_bit = 0; // се исклучуваат компараторите
	BCF        C1ON_bit+0, BitPos(C1ON_bit+0)
;Lab7_Podgotovka1.c,7 :: 		C2ON_bit = 0;
	BCF        C2ON_bit+0, BitPos(C2ON_bit+0)
;Lab7_Podgotovka1.c,8 :: 		UART1_Init(9600); // Иницијализирај го UART модулот на 9600 bps
	MOVLW      51
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;Lab7_Podgotovka1.c,9 :: 		Delay_ms(50); // Почекај модулот да се стабилизира
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main0:
	DECFSZ     R13+0, 1
	GOTO       L_main0
	DECFSZ     R12+0, 1
	GOTO       L_main0
	NOP
	NOP
;Lab7_Podgotovka1.c,10 :: 		UART1_Write_Text("Start"); // Прати текст преку модулот
	MOVLW      ?lstr1_Lab7_Podgotovka1+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;Lab7_Podgotovka1.c,11 :: 		UART1_Write(10); // Прати нов ред
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Lab7_Podgotovka1.c,12 :: 		UART1_Write(13);
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Lab7_Podgotovka1.c,13 :: 		while (1) { // Бесконечен циклус
L_main1:
;Lab7_Podgotovka1.c,14 :: 		if (UART1_Data_Ready()) { // Ако има податоци за примање,
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main3
;Lab7_Podgotovka1.c,15 :: 		uart_rd = UART1_Read(); // преземи ги податоците,
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      _uart_rd+0
;Lab7_Podgotovka1.c,16 :: 		UART1_Write(uart_rd); // и прати ги назад преку UART
	MOVF       R0+0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Lab7_Podgotovka1.c,17 :: 		}
L_main3:
;Lab7_Podgotovka1.c,18 :: 		}
	GOTO       L_main1
;Lab7_Podgotovka1.c,19 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
