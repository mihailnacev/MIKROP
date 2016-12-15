
_main:

;Zadaca_MP.c,27 :: 		void main() {
;Zadaca_MP.c,28 :: 		brojP=0;
	CLRF       _brojP+0
	CLRF       _brojP+1
;Zadaca_MP.c,29 :: 		ANSEL = 0x3;
	MOVLW      3
	MOVWF      ANSEL+0
;Zadaca_MP.c,30 :: 		ANSELH = 0;
	CLRF       ANSELH+0
;Zadaca_MP.c,31 :: 		while(m == 0)
L_main0:
	MOVLW      0
	XORWF      _m+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main34
	MOVLW      0
	XORWF      _m+0, 0
L__main34:
	BTFSS      STATUS+0, 2
	GOTO       L_main1
;Zadaca_MP.c,33 :: 		m = ADC_Read(0);
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _m+0
	MOVF       R0+1, 0
	MOVWF      _m+1
;Zadaca_MP.c,34 :: 		}
	GOTO       L_main0
L_main1:
;Zadaca_MP.c,35 :: 		while(broj == 0){
L_main2:
	MOVLW      0
	XORWF      _broj+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main35
	MOVLW      0
	XORWF      _broj+0, 0
L__main35:
	BTFSS      STATUS+0, 2
	GOTO       L_main3
;Zadaca_MP.c,36 :: 		broj = ADC_Read(1);
	MOVLW      1
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _broj+0
	MOVF       R0+1, 0
	MOVWF      _broj+1
;Zadaca_MP.c,37 :: 		}
	GOTO       L_main2
L_main3:
;Zadaca_MP.c,38 :: 		brojac=m;
	MOVF       _m+0, 0
	MOVWF      _brojac+0
	MOVF       _m+1, 0
	MOVWF      _brojac+1
;Zadaca_MP.c,39 :: 		EEPROM_Write(0x20,broj);
	MOVLW      32
	MOVWF      FARG_EEPROM_Write_Address+0
	MOVF       _broj+0, 0
	MOVWF      FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
;Zadaca_MP.c,40 :: 		Keypad_Init();
	CALL       _Keypad_Init+0
;Zadaca_MP.c,41 :: 		ANSEL = 0;
	CLRF       ANSEL+0
;Zadaca_MP.c,42 :: 		ANSELH = 0;
	CLRF       ANSELH+0
;Zadaca_MP.c,43 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;Zadaca_MP.c,44 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Zadaca_MP.c,45 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Zadaca_MP.c,46 :: 		for(i=0;i<m;i++)
	CLRF       _i+0
	CLRF       _i+1
L_main4:
	MOVLW      128
	XORWF      _i+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORWF      _m+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main36
	MOVF       _m+0, 0
	SUBWF      _i+0, 0
L__main36:
	BTFSC      STATUS+0, 0
	GOTO       L_main5
;Zadaca_MP.c,49 :: 		do{
L_main7:
;Zadaca_MP.c,50 :: 		do
L_main10:
;Zadaca_MP.c,51 :: 		kp=Keypad_Key_Click();
	CALL       _Keypad_Key_Click+0
	MOVF       R0+0, 0
	MOVWF      _kp+0
;Zadaca_MP.c,52 :: 		while(!kp);
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main10
;Zadaca_MP.c,54 :: 		switch(kp){
	GOTO       L_main13
;Zadaca_MP.c,55 :: 		case 1: brojP=brojP*10+1; break;
L_main15:
	MOVF       _brojP+0, 0
	MOVWF      R0+0
	MOVF       _brojP+1, 0
	MOVWF      R0+1
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Mul_16X16_U+0
	MOVF       R0+0, 0
	ADDLW      1
	MOVWF      _brojP+0
	MOVLW      0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      R0+1, 0
	MOVWF      _brojP+1
	GOTO       L_main14
;Zadaca_MP.c,56 :: 		case 2:  brojP=brojP*10+2; break;
L_main16:
	MOVF       _brojP+0, 0
	MOVWF      R0+0
	MOVF       _brojP+1, 0
	MOVWF      R0+1
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Mul_16X16_U+0
	MOVLW      2
	ADDWF      R0+0, 0
	MOVWF      _brojP+0
	MOVF       R0+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	MOVWF      _brojP+1
	GOTO       L_main14
;Zadaca_MP.c,57 :: 		case 3: brojP=brojP*10+3; break;
L_main17:
	MOVF       _brojP+0, 0
	MOVWF      R0+0
	MOVF       _brojP+1, 0
	MOVWF      R0+1
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Mul_16X16_U+0
	MOVLW      3
	ADDWF      R0+0, 0
	MOVWF      _brojP+0
	MOVF       R0+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	MOVWF      _brojP+1
	GOTO       L_main14
;Zadaca_MP.c,58 :: 		case 4:     break;
L_main18:
	GOTO       L_main14
;Zadaca_MP.c,59 :: 		case 5:    brojP=brojP*10+4; break;
L_main19:
	MOVF       _brojP+0, 0
	MOVWF      R0+0
	MOVF       _brojP+1, 0
	MOVWF      R0+1
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Mul_16X16_U+0
	MOVLW      4
	ADDWF      R0+0, 0
	MOVWF      _brojP+0
	MOVF       R0+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	MOVWF      _brojP+1
	GOTO       L_main14
;Zadaca_MP.c,60 :: 		case 6:    brojP=brojP*10+5; break;
L_main20:
	MOVF       _brojP+0, 0
	MOVWF      R0+0
	MOVF       _brojP+1, 0
	MOVWF      R0+1
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Mul_16X16_U+0
	MOVLW      5
	ADDWF      R0+0, 0
	MOVWF      _brojP+0
	MOVF       R0+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	MOVWF      _brojP+1
	GOTO       L_main14
;Zadaca_MP.c,61 :: 		case 7:    brojP=brojP*10+6; break;
L_main21:
	MOVF       _brojP+0, 0
	MOVWF      R0+0
	MOVF       _brojP+1, 0
	MOVWF      R0+1
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Mul_16X16_U+0
	MOVLW      6
	ADDWF      R0+0, 0
	MOVWF      _brojP+0
	MOVF       R0+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	MOVWF      _brojP+1
	GOTO       L_main14
;Zadaca_MP.c,62 :: 		case 8:    break;
L_main22:
	GOTO       L_main14
;Zadaca_MP.c,63 :: 		case 9:    brojP=brojP*10+7; break;
L_main23:
	MOVF       _brojP+0, 0
	MOVWF      R0+0
	MOVF       _brojP+1, 0
	MOVWF      R0+1
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Mul_16X16_U+0
	MOVLW      7
	ADDWF      R0+0, 0
	MOVWF      _brojP+0
	MOVF       R0+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	MOVWF      _brojP+1
	GOTO       L_main14
;Zadaca_MP.c,64 :: 		case 10:   brojP=brojP*10+8; break;
L_main24:
	MOVF       _brojP+0, 0
	MOVWF      R0+0
	MOVF       _brojP+1, 0
	MOVWF      R0+1
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Mul_16X16_U+0
	MOVLW      8
	ADDWF      R0+0, 0
	MOVWF      _brojP+0
	MOVF       R0+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	MOVWF      _brojP+1
	GOTO       L_main14
;Zadaca_MP.c,65 :: 		case 11:   brojP=brojP*10+9; break;
L_main25:
	MOVF       _brojP+0, 0
	MOVWF      R0+0
	MOVF       _brojP+1, 0
	MOVWF      R0+1
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Mul_16X16_U+0
	MOVLW      9
	ADDWF      R0+0, 0
	MOVWF      _brojP+0
	MOVF       R0+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	MOVWF      _brojP+1
	GOTO       L_main14
;Zadaca_MP.c,66 :: 		case 12:             break;
L_main26:
	GOTO       L_main14
;Zadaca_MP.c,67 :: 		case 13:   kp='*' ;    break;
L_main27:
	MOVLW      42
	MOVWF      _kp+0
	GOTO       L_main14
;Zadaca_MP.c,68 :: 		case 14:             break;
L_main28:
	GOTO       L_main14
;Zadaca_MP.c,69 :: 		case 15:             break;
L_main29:
	GOTO       L_main14
;Zadaca_MP.c,70 :: 		case 16:             break;
L_main30:
	GOTO       L_main14
;Zadaca_MP.c,71 :: 		};
L_main13:
	MOVF       _kp+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_main15
	MOVF       _kp+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_main16
	MOVF       _kp+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_main17
	MOVF       _kp+0, 0
	XORLW      4
	BTFSC      STATUS+0, 2
	GOTO       L_main18
	MOVF       _kp+0, 0
	XORLW      5
	BTFSC      STATUS+0, 2
	GOTO       L_main19
	MOVF       _kp+0, 0
	XORLW      6
	BTFSC      STATUS+0, 2
	GOTO       L_main20
	MOVF       _kp+0, 0
	XORLW      7
	BTFSC      STATUS+0, 2
	GOTO       L_main21
	MOVF       _kp+0, 0
	XORLW      8
	BTFSC      STATUS+0, 2
	GOTO       L_main22
	MOVF       _kp+0, 0
	XORLW      9
	BTFSC      STATUS+0, 2
	GOTO       L_main23
	MOVF       _kp+0, 0
	XORLW      10
	BTFSC      STATUS+0, 2
	GOTO       L_main24
	MOVF       _kp+0, 0
	XORLW      11
	BTFSC      STATUS+0, 2
	GOTO       L_main25
	MOVF       _kp+0, 0
	XORLW      12
	BTFSC      STATUS+0, 2
	GOTO       L_main26
	MOVF       _kp+0, 0
	XORLW      13
	BTFSC      STATUS+0, 2
	GOTO       L_main27
	MOVF       _kp+0, 0
	XORLW      14
	BTFSC      STATUS+0, 2
	GOTO       L_main28
	MOVF       _kp+0, 0
	XORLW      15
	BTFSC      STATUS+0, 2
	GOTO       L_main29
	MOVF       _kp+0, 0
	XORLW      16
	BTFSC      STATUS+0, 2
	GOTO       L_main30
L_main14:
;Zadaca_MP.c,72 :: 		} while(kp!='*');
	MOVF       _kp+0, 0
	XORLW      42
	BTFSS      STATUS+0, 2
	GOTO       L_main7
;Zadaca_MP.c,73 :: 		if(brojP==broj){
	MOVF       _brojP+1, 0
	XORWF      _broj+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main37
	MOVF       _broj+0, 0
	XORWF      _brojP+0, 0
L__main37:
	BTFSS      STATUS+0, 2
	GOTO       L_main31
;Zadaca_MP.c,74 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Zadaca_MP.c,75 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Zadaca_MP.c,76 :: 		Lcd_Out(1,1,"Pogodok");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_Zadaca_MP+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Zadaca_MP.c,77 :: 		break;
	GOTO       L_main5
;Zadaca_MP.c,78 :: 		}
L_main31:
;Zadaca_MP.c,80 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Zadaca_MP.c,81 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Zadaca_MP.c,82 :: 		Lcd_Out(1,1,"Vnesovte: ");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_Zadaca_MP+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Zadaca_MP.c,83 :: 		IntToStr(brojP,sifra);
	MOVF       _brojP+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       _brojP+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _sifra+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;Zadaca_MP.c,84 :: 		text=Ltrim(sifra);
	MOVLW      _sifra+0
	MOVWF      FARG_Ltrim_string+0
	CALL       _Ltrim+0
	MOVF       R0+0, 0
	MOVWF      _text+0
;Zadaca_MP.c,85 :: 		Lcd_Out(1,11,text);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      11
	MOVWF      FARG_Lcd_Out_column+0
	MOVF       R0+0, 0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Zadaca_MP.c,86 :: 		Lcd_Out(2,1,"Imate ");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr3_Zadaca_MP+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Zadaca_MP.c,87 :: 		brojac--;
	MOVLW      1
	SUBWF      _brojac+0, 1
	BTFSS      STATUS+0, 0
	DECF       _brojac+1, 1
;Zadaca_MP.c,88 :: 		IntToStr(brojac,sifra);
	MOVF       _brojac+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       _brojac+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _sifra+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;Zadaca_MP.c,89 :: 		text=Ltrim(sifra);
	MOVLW      _sifra+0
	MOVWF      FARG_Ltrim_string+0
	CALL       _Ltrim+0
	MOVF       R0+0, 0
	MOVWF      _text+0
;Zadaca_MP.c,90 :: 		Lcd_Out(2,7,sifra);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      7
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _sifra+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Zadaca_MP.c,91 :: 		brojP=0;
	CLRF       _brojP+0
	CLRF       _brojP+1
;Zadaca_MP.c,46 :: 		for(i=0;i<m;i++)
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;Zadaca_MP.c,93 :: 		}
	GOTO       L_main4
L_main5:
;Zadaca_MP.c,99 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Zadaca_MP.c,100 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Zadaca_MP.c,101 :: 		Lcd_Out(1,1,"Kraj");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr4_Zadaca_MP+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Zadaca_MP.c,112 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
