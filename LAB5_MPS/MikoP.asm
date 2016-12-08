
_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;MikoP.c,26 :: 		void interrupt(){
;MikoP.c,27 :: 		if(INTCON.RBIE && INTCON.INTF && flag == 0){
	BTFSS      INTCON+0, 3
	GOTO       L_interrupt2
	BTFSS      INTCON+0, 1
	GOTO       L_interrupt2
	MOVLW      0
	XORWF      _flag+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt18
	MOVLW      0
	XORWF      _flag+0, 0
L__interrupt18:
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt2
L__interrupt15:
;MikoP.c,28 :: 		brojac++;
	INCF       _brojac+0, 1
	BTFSC      STATUS+0, 2
	INCF       _brojac+1, 1
;MikoP.c,29 :: 		TMR0=6;
	MOVLW      6
	MOVWF      TMR0+0
;MikoP.c,30 :: 		cnt1 = 0;
	CLRF       _cnt1+0
	CLRF       _cnt1+1
;MikoP.c,31 :: 		cnt2 = 0;
	CLRF       _cnt2+0
	CLRF       _cnt2+1
;MikoP.c,32 :: 		}
	GOTO       L_interrupt3
L_interrupt2:
;MikoP.c,34 :: 		else if(INTCON.T0IF){
	BTFSS      INTCON+0, 2
	GOTO       L_interrupt4
;MikoP.c,35 :: 		if(flag==0) cnt1++;
	MOVLW      0
	XORWF      _flag+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt19
	MOVLW      0
	XORWF      _flag+0, 0
L__interrupt19:
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt5
	INCF       _cnt1+0, 1
	BTFSC      STATUS+0, 2
	INCF       _cnt1+1, 1
	GOTO       L_interrupt6
L_interrupt5:
;MikoP.c,36 :: 		else cnt2++;
	INCF       _cnt2+0, 1
	BTFSC      STATUS+0, 2
	INCF       _cnt2+1, 1
L_interrupt6:
;MikoP.c,37 :: 		TMR0=6;
	MOVLW      6
	MOVWF      TMR0+0
;MikoP.c,38 :: 		}
L_interrupt4:
L_interrupt3:
;MikoP.c,39 :: 		INTCON=0xA8;
	MOVLW      168
	MOVWF      INTCON+0
;MikoP.c,40 :: 		}
L_end_interrupt:
L__interrupt17:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt

_main:

;MikoP.c,42 :: 		void main() {
;MikoP.c,43 :: 		ANSEL = 0;
	CLRF       ANSEL+0
;MikoP.c,44 :: 		ANSELH = 0;
	CLRF       ANSELH+0
;MikoP.c,45 :: 		TRISB = 0b00000001;
	MOVLW      1
	MOVWF      TRISB+0
;MikoP.c,46 :: 		text1="Tekoven broj:";
	MOVLW      ?lstr1_MikoP+0
	MOVWF      _text1+0
;MikoP.c,47 :: 		text2="NeRaboti";
	MOVLW      ?lstr2_MikoP+0
	MOVWF      _text2+0
;MikoP.c,48 :: 		OPTION_REG=0x86;
	MOVLW      134
	MOVWF      OPTION_REG+0
;MikoP.c,49 :: 		TMR0=6;
	MOVLW      6
	MOVWF      TMR0+0
;MikoP.c,50 :: 		INTCON=0xA8;
	MOVLW      168
	MOVWF      INTCON+0
;MikoP.c,51 :: 		cnt1=0;
	CLRF       _cnt1+0
	CLRF       _cnt1+1
;MikoP.c,52 :: 		cnt2=0;
	CLRF       _cnt2+0
	CLRF       _cnt2+1
;MikoP.c,53 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;MikoP.c,54 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MikoP.c,55 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MikoP.c,57 :: 		Lcd_Out(1,1,text1);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVF       _text1+0, 0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MikoP.c,58 :: 		IntToStr(brojac,cifra);
	MOVF       _brojac+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       _brojac+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _cifra+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;MikoP.c,59 :: 		text3 = Ltrim(cifra);
	MOVLW      _cifra+0
	MOVWF      FARG_Ltrim_string+0
	CALL       _Ltrim+0
	MOVF       R0+0, 0
	MOVWF      _text3+0
;MikoP.c,60 :: 		Lcd_Out(2,1,cifra);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _cifra+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MikoP.c,61 :: 		do {
L_main7:
;MikoP.c,62 :: 		if(flag==0){
	MOVLW      0
	XORWF      _flag+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main21
	MOVLW      0
	XORWF      _flag+0, 0
L__main21:
	BTFSS      STATUS+0, 2
	GOTO       L_main10
;MikoP.c,64 :: 		if(cnt1 == 0){
	MOVLW      0
	XORWF      _cnt1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main22
	MOVLW      0
	XORWF      _cnt1+0, 0
L__main22:
	BTFSS      STATUS+0, 2
	GOTO       L_main11
;MikoP.c,65 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MikoP.c,66 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MikoP.c,67 :: 		IntToStr(brojac,cifra);
	MOVF       _brojac+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       _brojac+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _cifra+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;MikoP.c,68 :: 		text3 = Ltrim(cifra);
	MOVLW      _cifra+0
	MOVWF      FARG_Ltrim_string+0
	CALL       _Ltrim+0
	MOVF       R0+0, 0
	MOVWF      _text3+0
;MikoP.c,69 :: 		Lcd_Out(1,1,text1);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVF       _text1+0, 0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MikoP.c,70 :: 		Lcd_Out(2,1,text3);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVF       _text3+0, 0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MikoP.c,71 :: 		}
L_main11:
;MikoP.c,73 :: 		if (cnt1>=3) {
	MOVLW      0
	SUBWF      _cnt1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main23
	MOVLW      3
	SUBWF      _cnt1+0, 0
L__main23:
	BTFSS      STATUS+0, 0
	GOTO       L_main12
;MikoP.c,74 :: 		cnt1 = 0;
	CLRF       _cnt1+0
	CLRF       _cnt1+1
;MikoP.c,75 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MikoP.c,76 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MikoP.c,77 :: 		Lcd_Out(1,1,text2);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVF       _text2+0, 0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MikoP.c,78 :: 		flag=1;
	MOVLW      1
	MOVWF      _flag+0
	MOVLW      0
	MOVWF      _flag+1
;MikoP.c,79 :: 		}
L_main12:
;MikoP.c,81 :: 		}
L_main10:
;MikoP.c,83 :: 		if(flag==1){
	MOVLW      0
	XORWF      _flag+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main24
	MOVLW      1
	XORWF      _flag+0, 0
L__main24:
	BTFSS      STATUS+0, 2
	GOTO       L_main13
;MikoP.c,85 :: 		if (cnt2>=6) {
	MOVLW      0
	SUBWF      _cnt2+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main25
	MOVLW      6
	SUBWF      _cnt2+0, 0
L__main25:
	BTFSS      STATUS+0, 0
	GOTO       L_main14
;MikoP.c,86 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MikoP.c,87 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MikoP.c,88 :: 		break;
	GOTO       L_main8
;MikoP.c,89 :: 		}
L_main14:
;MikoP.c,91 :: 		}
L_main13:
;MikoP.c,92 :: 		} while(1);
	GOTO       L_main7
L_main8:
;MikoP.c,93 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
