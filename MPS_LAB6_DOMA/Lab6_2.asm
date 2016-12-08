
_main:

;Lab6_2.c,23 :: 		void main() {
;Lab6_2.c,24 :: 		brojac=0;
	CLRF       _brojac+0
	CLRF       _brojac+1
;Lab6_2.c,25 :: 		ANSEL = 0;
	CLRF       ANSEL+0
;Lab6_2.c,26 :: 		ANSELH = 0b00001000;
	MOVLW      8
	MOVWF      ANSELH+0
;Lab6_2.c,27 :: 		while(res == 0)
L_main0:
	MOVLW      0
	XORWF      _res+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main21
	MOVLW      0
	XORWF      _res+0, 0
L__main21:
	BTFSS      STATUS+0, 2
	GOTO       L_main1
;Lab6_2.c,29 :: 		res = ADC_Read(11);
	MOVLW      11
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _res+0
	MOVF       R0+1, 0
	MOVWF      _res+1
;Lab6_2.c,30 :: 		}
	GOTO       L_main0
L_main1:
;Lab6_2.c,31 :: 		broj=res%100;
	MOVLW      100
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _res+0, 0
	MOVWF      R0+0
	MOVF       _res+1, 0
	MOVWF      R0+1
	CALL       _Div_16X16_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      _broj+0
	MOVF       R0+1, 0
	MOVWF      _broj+1
;Lab6_2.c,32 :: 		Keypad_Init();
	CALL       _Keypad_Init+0
;Lab6_2.c,33 :: 		ANSEL = 0;
	CLRF       ANSEL+0
;Lab6_2.c,34 :: 		ANSELH = 0;
	CLRF       ANSELH+0
;Lab6_2.c,35 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;Lab6_2.c,36 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Lab6_2.c,37 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Lab6_2.c,38 :: 		for(i=0;i<2;i++)
	CLRF       _i+0
	CLRF       _i+1
L_main2:
	MOVLW      128
	XORWF      _i+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main22
	MOVLW      2
	SUBWF      _i+0, 0
L__main22:
	BTFSC      STATUS+0, 0
	GOTO       L_main3
;Lab6_2.c,40 :: 		do
L_main5:
;Lab6_2.c,41 :: 		kp=Keypad_Key_Click();
	CALL       _Keypad_Key_Click+0
	MOVF       R0+0, 0
	MOVWF      _kp+0
;Lab6_2.c,42 :: 		while(!kp);
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main5
;Lab6_2.c,44 :: 		switch(kp){
	GOTO       L_main8
;Lab6_2.c,45 :: 		case 1: vnes[i]='1'; break;
L_main10:
	MOVF       _i+0, 0
	ADDLW      _vnes+0
	MOVWF      FSR
	MOVLW      49
	MOVWF      INDF+0
	GOTO       L_main9
;Lab6_2.c,46 :: 		case 2:  vnes[i]='2'; break;
L_main11:
	MOVF       _i+0, 0
	ADDLW      _vnes+0
	MOVWF      FSR
	MOVLW      50
	MOVWF      INDF+0
	GOTO       L_main9
;Lab6_2.c,47 :: 		case 3: vnes[i]='3'; break;
L_main12:
	MOVF       _i+0, 0
	ADDLW      _vnes+0
	MOVWF      FSR
	MOVLW      51
	MOVWF      INDF+0
	GOTO       L_main9
;Lab6_2.c,48 :: 		case 4:  vnes[i]='4'; break;
L_main13:
	MOVF       _i+0, 0
	ADDLW      _vnes+0
	MOVWF      FSR
	MOVLW      52
	MOVWF      INDF+0
	GOTO       L_main9
;Lab6_2.c,49 :: 		case 5: vnes[i]='5'; break;
L_main14:
	MOVF       _i+0, 0
	ADDLW      _vnes+0
	MOVWF      FSR
	MOVLW      53
	MOVWF      INDF+0
	GOTO       L_main9
;Lab6_2.c,50 :: 		case 6:   vnes[i]='6'; break;
L_main15:
	MOVF       _i+0, 0
	ADDLW      _vnes+0
	MOVWF      FSR
	MOVLW      54
	MOVWF      INDF+0
	GOTO       L_main9
;Lab6_2.c,51 :: 		case 7: vnes[i]='7'; break;
L_main16:
	MOVF       _i+0, 0
	ADDLW      _vnes+0
	MOVWF      FSR
	MOVLW      55
	MOVWF      INDF+0
	GOTO       L_main9
;Lab6_2.c,52 :: 		case 8:  vnes[i]='8'; break;
L_main17:
	MOVF       _i+0, 0
	ADDLW      _vnes+0
	MOVWF      FSR
	MOVLW      56
	MOVWF      INDF+0
	GOTO       L_main9
;Lab6_2.c,53 :: 		case 9:  vnes[i]='9'; break;
L_main18:
	MOVF       _i+0, 0
	ADDLW      _vnes+0
	MOVWF      FSR
	MOVLW      57
	MOVWF      INDF+0
	GOTO       L_main9
;Lab6_2.c,54 :: 		};
L_main8:
	MOVF       _kp+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_main10
	MOVF       _kp+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_main11
	MOVF       _kp+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_main12
	MOVF       _kp+0, 0
	XORLW      4
	BTFSC      STATUS+0, 2
	GOTO       L_main13
	MOVF       _kp+0, 0
	XORLW      5
	BTFSC      STATUS+0, 2
	GOTO       L_main14
	MOVF       _kp+0, 0
	XORLW      6
	BTFSC      STATUS+0, 2
	GOTO       L_main15
	MOVF       _kp+0, 0
	XORLW      7
	BTFSC      STATUS+0, 2
	GOTO       L_main16
	MOVF       _kp+0, 0
	XORLW      8
	BTFSC      STATUS+0, 2
	GOTO       L_main17
	MOVF       _kp+0, 0
	XORLW      9
	BTFSC      STATUS+0, 2
	GOTO       L_main18
L_main9:
;Lab6_2.c,38 :: 		for(i=0;i<2;i++)
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;Lab6_2.c,55 :: 		}
	GOTO       L_main2
L_main3:
;Lab6_2.c,61 :: 		Lcd_Out(1,1,vnes);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _vnes+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Lab6_2.c,62 :: 		IntToStr(broj,sifra);
	MOVF       _broj+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       _broj+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _sifra+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;Lab6_2.c,63 :: 		text=Ltrim(sifra);
	MOVLW      _sifra+0
	MOVWF      FARG_Ltrim_string+0
	CALL       _Ltrim+0
	MOVF       R0+0, 0
	MOVWF      _text+0
;Lab6_2.c,64 :: 		Lcd_Out(2,1,text);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVF       R0+0, 0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Lab6_2.c,65 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Lab6_2.c,66 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Lab6_2.c,67 :: 		if(memcmp(vnes,text,2)==0){
	MOVLW      _vnes+0
	MOVWF      FARG_memcmp_s1+0
	MOVF       _text+0, 0
	MOVWF      FARG_memcmp_s2+0
	MOVLW      2
	MOVWF      FARG_memcmp_n+0
	MOVLW      0
	MOVWF      FARG_memcmp_n+1
	CALL       _memcmp+0
	MOVLW      0
	XORWF      R0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main23
	MOVLW      0
	XORWF      R0+0, 0
L__main23:
	BTFSS      STATUS+0, 2
	GOTO       L_main19
;Lab6_2.c,68 :: 		Lcd_Out(1,1,"Tocna Sifra");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_Lab6_2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Lab6_2.c,69 :: 		}
L_main19:
;Lab6_2.c,72 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
