
_main:

;Lab7_Cetvrtok.c,19 :: 		void main() {
;Lab7_Cetvrtok.c,20 :: 		ANSEL = 0;
	CLRF       ANSEL+0
;Lab7_Cetvrtok.c,21 :: 		ANSELH = 0;
	CLRF       ANSELH+0
;Lab7_Cetvrtok.c,22 :: 		C1ON_bit = 0;
	BCF        C1ON_bit+0, BitPos(C1ON_bit+0)
;Lab7_Cetvrtok.c,23 :: 		C2ON_bit = 0;
	BCF        C2ON_bit+0, BitPos(C2ON_bit+0)
;Lab7_Cetvrtok.c,24 :: 		i=0;
	CLRF       _i+0
	CLRF       _i+1
;Lab7_Cetvrtok.c,25 :: 		j=0;
	CLRF       _j+0
	CLRF       _j+1
;Lab7_Cetvrtok.c,26 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;Lab7_Cetvrtok.c,27 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Lab7_Cetvrtok.c,28 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Lab7_Cetvrtok.c,29 :: 		UART1_Init(9600);
	MOVLW      51
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;Lab7_Cetvrtok.c,30 :: 		Delay_ms(50);
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
;Lab7_Cetvrtok.c,31 :: 		while (1) {
L_main1:
;Lab7_Cetvrtok.c,32 :: 		if (UART1_Data_Ready()) {
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main3
;Lab7_Cetvrtok.c,33 :: 		uart_rd = UART1_Read();
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      _uart_rd+0
;Lab7_Cetvrtok.c,35 :: 		if(isAlpha(uart_rd)){
	MOVF       R0+0, 0
	MOVWF      FARG_isalpha_character+0
	CALL       _isalpha+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main4
;Lab7_Cetvrtok.c,37 :: 		zbor[j++]=uart_rd;
	MOVF       _j+0, 0
	ADDLW      _zbor+0
	MOVWF      FSR
	MOVF       _uart_rd+0, 0
	MOVWF      INDF+0
	INCF       _j+0, 1
	BTFSC      STATUS+0, 2
	INCF       _j+1, 1
;Lab7_Cetvrtok.c,38 :: 		}
	GOTO       L_main5
L_main4:
;Lab7_Cetvrtok.c,40 :: 		if(uart_rd==' '){
	MOVF       _uart_rd+0, 0
	XORLW      32
	BTFSS      STATUS+0, 2
	GOTO       L_main6
;Lab7_Cetvrtok.c,41 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Lab7_Cetvrtok.c,42 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Lab7_Cetvrtok.c,43 :: 		for(j=0;j<10;j++){
	CLRF       _j+0
	CLRF       _j+1
L_main7:
	MOVLW      128
	XORWF      _j+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main31
	MOVLW      10
	SUBWF      _j+0, 0
L__main31:
	BTFSC      STATUS+0, 0
	GOTO       L_main8
;Lab7_Cetvrtok.c,44 :: 		strings[i][j]=zbor[j];}
	MOVLW      10
	MOVWF      R0+0
	MOVLW      0
	MOVWF      R0+1
	MOVF       _i+0, 0
	MOVWF      R4+0
	MOVF       _i+1, 0
	MOVWF      R4+1
	CALL       _Mul_16X16_U+0
	MOVLW      _strings+0
	ADDWF      R0+0, 1
	MOVF       _j+0, 0
	ADDWF      R0+0, 0
	MOVWF      R1+0
	MOVF       _j+0, 0
	ADDLW      _zbor+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R0+0
	MOVF       R1+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;Lab7_Cetvrtok.c,43 :: 		for(j=0;j<10;j++){
	INCF       _j+0, 1
	BTFSC      STATUS+0, 2
	INCF       _j+1, 1
;Lab7_Cetvrtok.c,44 :: 		strings[i][j]=zbor[j];}
	GOTO       L_main7
L_main8:
;Lab7_Cetvrtok.c,45 :: 		Lcd_Out(1,1,strings[i]);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      10
	MOVWF      R0+0
	MOVLW      0
	MOVWF      R0+1
	MOVF       _i+0, 0
	MOVWF      R4+0
	MOVF       _i+1, 0
	MOVWF      R4+1
	CALL       _Mul_16X16_U+0
	MOVF       R0+0, 0
	ADDLW      _strings+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Lab7_Cetvrtok.c,46 :: 		Delay_ms(100);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main10:
	DECFSZ     R13+0, 1
	GOTO       L_main10
	DECFSZ     R12+0, 1
	GOTO       L_main10
	DECFSZ     R11+0, 1
	GOTO       L_main10
	NOP
;Lab7_Cetvrtok.c,47 :: 		for(j = 0; j < 10;  ++j )
	CLRF       _j+0
	CLRF       _j+1
L_main11:
	MOVLW      128
	XORWF      _j+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main32
	MOVLW      10
	SUBWF      _j+0, 0
L__main32:
	BTFSC      STATUS+0, 0
	GOTO       L_main12
;Lab7_Cetvrtok.c,48 :: 		zbor[j] = (char)0;
	MOVF       _j+0, 0
	ADDLW      _zbor+0
	MOVWF      FSR
	CLRF       INDF+0
;Lab7_Cetvrtok.c,47 :: 		for(j = 0; j < 10;  ++j )
	INCF       _j+0, 1
	BTFSC      STATUS+0, 2
	INCF       _j+1, 1
;Lab7_Cetvrtok.c,48 :: 		zbor[j] = (char)0;
	GOTO       L_main11
L_main12:
;Lab7_Cetvrtok.c,49 :: 		i++;
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;Lab7_Cetvrtok.c,50 :: 		j=0;
	CLRF       _j+0
	CLRF       _j+1
;Lab7_Cetvrtok.c,51 :: 		}
	GOTO       L_main14
L_main6:
;Lab7_Cetvrtok.c,52 :: 		else if(uart_rd=='.'){
	MOVF       _uart_rd+0, 0
	XORLW      46
	BTFSS      STATUS+0, 2
	GOTO       L_main15
;Lab7_Cetvrtok.c,53 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Lab7_Cetvrtok.c,54 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Lab7_Cetvrtok.c,55 :: 		for(j=0;j<10;j++){
	CLRF       _j+0
	CLRF       _j+1
L_main16:
	MOVLW      128
	XORWF      _j+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main33
	MOVLW      10
	SUBWF      _j+0, 0
L__main33:
	BTFSC      STATUS+0, 0
	GOTO       L_main17
;Lab7_Cetvrtok.c,56 :: 		strings[i][j]=zbor[j];}
	MOVLW      10
	MOVWF      R0+0
	MOVLW      0
	MOVWF      R0+1
	MOVF       _i+0, 0
	MOVWF      R4+0
	MOVF       _i+1, 0
	MOVWF      R4+1
	CALL       _Mul_16X16_U+0
	MOVLW      _strings+0
	ADDWF      R0+0, 1
	MOVF       _j+0, 0
	ADDWF      R0+0, 0
	MOVWF      R1+0
	MOVF       _j+0, 0
	ADDLW      _zbor+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R0+0
	MOVF       R1+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;Lab7_Cetvrtok.c,55 :: 		for(j=0;j<10;j++){
	INCF       _j+0, 1
	BTFSC      STATUS+0, 2
	INCF       _j+1, 1
;Lab7_Cetvrtok.c,56 :: 		strings[i][j]=zbor[j];}
	GOTO       L_main16
L_main17:
;Lab7_Cetvrtok.c,57 :: 		Delay_ms(100);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main19:
	DECFSZ     R13+0, 1
	GOTO       L_main19
	DECFSZ     R12+0, 1
	GOTO       L_main19
	DECFSZ     R11+0, 1
	GOTO       L_main19
	NOP
;Lab7_Cetvrtok.c,58 :: 		for(j = 0; j < 10;  ++j )
	CLRF       _j+0
	CLRF       _j+1
L_main20:
	MOVLW      128
	XORWF      _j+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main34
	MOVLW      10
	SUBWF      _j+0, 0
L__main34:
	BTFSC      STATUS+0, 0
	GOTO       L_main21
;Lab7_Cetvrtok.c,59 :: 		zbor[j] = (char)0;
	MOVF       _j+0, 0
	ADDLW      _zbor+0
	MOVWF      FSR
	CLRF       INDF+0
;Lab7_Cetvrtok.c,58 :: 		for(j = 0; j < 10;  ++j )
	INCF       _j+0, 1
	BTFSC      STATUS+0, 2
	INCF       _j+1, 1
;Lab7_Cetvrtok.c,59 :: 		zbor[j] = (char)0;
	GOTO       L_main20
L_main21:
;Lab7_Cetvrtok.c,60 :: 		i++;
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;Lab7_Cetvrtok.c,61 :: 		j=0;
	CLRF       _j+0
	CLRF       _j+1
;Lab7_Cetvrtok.c,62 :: 		break;
	GOTO       L_main2
;Lab7_Cetvrtok.c,63 :: 		}
L_main15:
;Lab7_Cetvrtok.c,65 :: 		for(j = 0; j < 10;  ++j )
	CLRF       _j+0
	CLRF       _j+1
L_main24:
	MOVLW      128
	XORWF      _j+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main35
	MOVLW      10
	SUBWF      _j+0, 0
L__main35:
	BTFSC      STATUS+0, 0
	GOTO       L_main25
;Lab7_Cetvrtok.c,66 :: 		zbor[j] = (char)0;
	MOVF       _j+0, 0
	ADDLW      _zbor+0
	MOVWF      FSR
	CLRF       INDF+0
;Lab7_Cetvrtok.c,65 :: 		for(j = 0; j < 10;  ++j )
	INCF       _j+0, 1
	BTFSC      STATUS+0, 2
	INCF       _j+1, 1
;Lab7_Cetvrtok.c,66 :: 		zbor[j] = (char)0;
	GOTO       L_main24
L_main25:
;Lab7_Cetvrtok.c,67 :: 		j=0;
	CLRF       _j+0
	CLRF       _j+1
;Lab7_Cetvrtok.c,68 :: 		}
L_main14:
;Lab7_Cetvrtok.c,70 :: 		}
L_main5:
;Lab7_Cetvrtok.c,71 :: 		}
L_main3:
;Lab7_Cetvrtok.c,72 :: 		}
	GOTO       L_main1
L_main2:
;Lab7_Cetvrtok.c,73 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Lab7_Cetvrtok.c,74 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Lab7_Cetvrtok.c,75 :: 		Lcd_Out(1,1,"OUT");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_Lab7_Cetvrtok+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Lab7_Cetvrtok.c,76 :: 		brZborovi=i-1;
	MOVLW      1
	SUBWF      _i+0, 0
	MOVWF      _brZborovi+0
	MOVLW      0
	BTFSS      STATUS+0, 0
	ADDLW      1
	SUBWF      _i+1, 0
	MOVWF      _brZborovi+1
;Lab7_Cetvrtok.c,77 :: 		for(j=0;j<20;i++){
	CLRF       _j+0
	CLRF       _j+1
L_main27:
	MOVLW      128
	XORWF      _j+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main36
	MOVLW      20
	SUBWF      _j+0, 0
L__main36:
	BTFSC      STATUS+0, 0
	GOTO       L_main28
;Lab7_Cetvrtok.c,78 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Lab7_Cetvrtok.c,79 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Lab7_Cetvrtok.c,80 :: 		Lcd_Chr(1,j,strings[0][j]);
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_row+0
	MOVF       _j+0, 0
	MOVWF      FARG_Lcd_Chr_column+0
	MOVF       _j+0, 0
	ADDLW      _strings+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;Lab7_Cetvrtok.c,77 :: 		for(j=0;j<20;i++){
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;Lab7_Cetvrtok.c,81 :: 		}
	GOTO       L_main27
L_main28:
;Lab7_Cetvrtok.c,82 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
