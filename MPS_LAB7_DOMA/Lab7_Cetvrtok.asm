
_main:

;Lab7_Cetvrtok.c,18 :: 		void main() {
;Lab7_Cetvrtok.c,19 :: 		ANSEL = 0;
	CLRF       ANSEL+0
;Lab7_Cetvrtok.c,20 :: 		ANSELH = 0;
	CLRF       ANSELH+0
;Lab7_Cetvrtok.c,21 :: 		C1ON_bit = 0;
	BCF        C1ON_bit+0, BitPos(C1ON_bit+0)
;Lab7_Cetvrtok.c,22 :: 		C2ON_bit = 0;
	BCF        C2ON_bit+0, BitPos(C2ON_bit+0)
;Lab7_Cetvrtok.c,23 :: 		i=0;
	CLRF       _i+0
	CLRF       _i+1
;Lab7_Cetvrtok.c,24 :: 		j=0;
	CLRF       _j+0
	CLRF       _j+1
;Lab7_Cetvrtok.c,25 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;Lab7_Cetvrtok.c,26 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Lab7_Cetvrtok.c,27 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Lab7_Cetvrtok.c,28 :: 		UART1_Init(9600);
	MOVLW      51
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;Lab7_Cetvrtok.c,29 :: 		Delay_ms(50);
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
;Lab7_Cetvrtok.c,30 :: 		while (1) {
L_main1:
;Lab7_Cetvrtok.c,31 :: 		if (UART1_Data_Ready()) {
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main3
;Lab7_Cetvrtok.c,32 :: 		uart_rd = UART1_Read();
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      _uart_rd+0
;Lab7_Cetvrtok.c,34 :: 		if(isAlpha(uart_rd)){
	MOVF       R0+0, 0
	MOVWF      FARG_isalpha_character+0
	CALL       _isalpha+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main4
;Lab7_Cetvrtok.c,36 :: 		zbor[j++]=uart_rd;
	MOVF       _j+0, 0
	ADDLW      _zbor+0
	MOVWF      FSR
	MOVF       _uart_rd+0, 0
	MOVWF      INDF+0
	INCF       _j+0, 1
	BTFSC      STATUS+0, 2
	INCF       _j+1, 1
;Lab7_Cetvrtok.c,37 :: 		}
	GOTO       L_main5
L_main4:
;Lab7_Cetvrtok.c,39 :: 		if(uart_rd==' '||uart_rd=='.'){
	MOVF       _uart_rd+0, 0
	XORLW      32
	BTFSC      STATUS+0, 2
	GOTO       L__main16
	MOVF       _uart_rd+0, 0
	XORLW      46
	BTFSC      STATUS+0, 2
	GOTO       L__main16
	GOTO       L_main8
L__main16:
;Lab7_Cetvrtok.c,40 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Lab7_Cetvrtok.c,41 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Lab7_Cetvrtok.c,42 :: 		strings[i]=zbor;
	MOVF       _i+0, 0
	ADDLW      _strings+0
	MOVWF      FSR
	MOVLW      _zbor+0
	MOVWF      INDF+0
;Lab7_Cetvrtok.c,43 :: 		Lcd_Out(1,1,strings[i]);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVF       _i+0, 0
	ADDLW      _strings+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Lab7_Cetvrtok.c,44 :: 		for(j = 0; j < 10;  ++j )
	CLRF       _j+0
	CLRF       _j+1
L_main9:
	MOVLW      128
	XORWF      _j+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main18
	MOVLW      10
	SUBWF      _j+0, 0
L__main18:
	BTFSC      STATUS+0, 0
	GOTO       L_main10
;Lab7_Cetvrtok.c,45 :: 		zbor[j] = (char)0;
	MOVF       _j+0, 0
	ADDLW      _zbor+0
	MOVWF      FSR
	CLRF       INDF+0
;Lab7_Cetvrtok.c,44 :: 		for(j = 0; j < 10;  ++j )
	INCF       _j+0, 1
	BTFSC      STATUS+0, 2
	INCF       _j+1, 1
;Lab7_Cetvrtok.c,45 :: 		zbor[j] = (char)0;
	GOTO       L_main9
L_main10:
;Lab7_Cetvrtok.c,46 :: 		i++;
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;Lab7_Cetvrtok.c,47 :: 		j=0;
	CLRF       _j+0
	CLRF       _j+1
;Lab7_Cetvrtok.c,48 :: 		}
	GOTO       L_main12
L_main8:
;Lab7_Cetvrtok.c,50 :: 		for(j = 0; j < 10;  ++j )
	CLRF       _j+0
	CLRF       _j+1
L_main13:
	MOVLW      128
	XORWF      _j+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main19
	MOVLW      10
	SUBWF      _j+0, 0
L__main19:
	BTFSC      STATUS+0, 0
	GOTO       L_main14
;Lab7_Cetvrtok.c,51 :: 		zbor[j] = (char)0;
	MOVF       _j+0, 0
	ADDLW      _zbor+0
	MOVWF      FSR
	CLRF       INDF+0
;Lab7_Cetvrtok.c,50 :: 		for(j = 0; j < 10;  ++j )
	INCF       _j+0, 1
	BTFSC      STATUS+0, 2
	INCF       _j+1, 1
;Lab7_Cetvrtok.c,51 :: 		zbor[j] = (char)0;
	GOTO       L_main13
L_main14:
;Lab7_Cetvrtok.c,52 :: 		j=0;
	CLRF       _j+0
	CLRF       _j+1
;Lab7_Cetvrtok.c,53 :: 		}
L_main12:
;Lab7_Cetvrtok.c,55 :: 		}
L_main5:
;Lab7_Cetvrtok.c,56 :: 		}
L_main3:
;Lab7_Cetvrtok.c,57 :: 		}
	GOTO       L_main1
;Lab7_Cetvrtok.c,58 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
