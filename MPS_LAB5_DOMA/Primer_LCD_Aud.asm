
_main:

;Primer_LCD_Aud.c,19 :: 		void main() {
;Primer_LCD_Aud.c,20 :: 		ANSEL = 0;
	CLRF       ANSEL+0
;Primer_LCD_Aud.c,21 :: 		ANSELH = 0;
	CLRF       ANSELH+0
;Primer_LCD_Aud.c,22 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;Primer_LCD_Aud.c,23 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Primer_LCD_Aud.c,24 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Primer_LCD_Aud.c,25 :: 		Lcd_Cmd(_LCD_TURN_ON);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Primer_LCD_Aud.c,26 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Primer_LCD_Aud.c,27 :: 		strcpy(text,"Demo text");
	MOVLW      _text+0
	MOVWF      FARG_strcpy_to+0
	MOVLW      ?lstr1_Primer_LCD_Aud+0
	MOVWF      FARG_strcpy_from+0
	CALL       _strcpy+0
;Primer_LCD_Aud.c,28 :: 		Lcd_Out(1,1,text); //се печати Demo text во првиот ред
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Primer_LCD_Aud.c,29 :: 		strcpy(text2,"Second line");
	MOVLW      _text2+0
	MOVWF      FARG_strcpy_to+0
	MOVLW      ?lstr2_Primer_LCD_Aud+0
	MOVWF      FARG_strcpy_from+0
	CALL       _strcpy+0
;Primer_LCD_Aud.c,30 :: 		Lcd_Out(2,1,text2); //се печати Second line во вториот ред
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _text2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Primer_LCD_Aud.c,31 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
