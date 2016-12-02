
_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;Lab5_Vtornik.c,29 :: 		void interrupt(){
;Lab5_Vtornik.c,30 :: 		if(flag==0) cnt1++;
	MOVLW      0
	XORWF      _flag+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt11
	MOVLW      0
	XORWF      _flag+0, 0
L__interrupt11:
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt0
	INCF       _cnt1+0, 1
	BTFSC      STATUS+0, 2
	INCF       _cnt1+1, 1
	GOTO       L_interrupt1
L_interrupt0:
;Lab5_Vtornik.c,31 :: 		else cnt2++;
	INCF       _cnt2+0, 1
	BTFSC      STATUS+0, 2
	INCF       _cnt2+1, 1
L_interrupt1:
;Lab5_Vtornik.c,32 :: 		TMR0=6;
	MOVLW      6
	MOVWF      TMR0+0
;Lab5_Vtornik.c,33 :: 		INTCON=0xA0;
	MOVLW      160
	MOVWF      INTCON+0
;Lab5_Vtornik.c,34 :: 		}
L_end_interrupt:
L__interrupt10:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt

_main:

;Lab5_Vtornik.c,35 :: 		void main() {
;Lab5_Vtornik.c,36 :: 		ANSEL = 0;
	CLRF       ANSEL+0
;Lab5_Vtornik.c,37 :: 		ANSELH = 0;
	CLRF       ANSELH+0
;Lab5_Vtornik.c,38 :: 		text1="Popust$";
	MOVLW      ?lstr1_Lab5_Vtornik+0
	MOVWF      _text1+0
;Lab5_Vtornik.c,39 :: 		text2="Golem$";
	MOVLW      ?lstr2_Lab5_Vtornik+0
	MOVWF      _text2+0
;Lab5_Vtornik.c,40 :: 		text3="GRESKA";
	MOVLW      ?lstr3_Lab5_Vtornik+0
	MOVWF      _text3+0
;Lab5_Vtornik.c,64 :: 		OPTION_REG=0x85;
	MOVLW      133
	MOVWF      OPTION_REG+0
;Lab5_Vtornik.c,65 :: 		TMR0=6;
	MOVLW      6
	MOVWF      TMR0+0
;Lab5_Vtornik.c,66 :: 		INTCON=0xA0;
	MOVLW      160
	MOVWF      INTCON+0
;Lab5_Vtornik.c,67 :: 		cnt1=0;
	CLRF       _cnt1+0
	CLRF       _cnt1+1
;Lab5_Vtornik.c,68 :: 		cnt2=0;
	CLRF       _cnt2+0
	CLRF       _cnt2+1
;Lab5_Vtornik.c,69 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;Lab5_Vtornik.c,70 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Lab5_Vtornik.c,71 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Lab5_Vtornik.c,73 :: 		Lcd_Out(1,3,"Tekoven broj:");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      3
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr4_Lab5_Vtornik+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Lab5_Vtornik.c,74 :: 		IntToStr(brb,cifra); //се претвора broj во стрингот cifra
	MOVF       _brb+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       _brb+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _cifra+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;Lab5_Vtornik.c,75 :: 		Lcd_Out(2,1,cifra);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _cifra+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Lab5_Vtornik.c,76 :: 		do {
L_main2:
;Lab5_Vtornik.c,77 :: 		if(flag==0){
	MOVLW      0
	XORWF      _flag+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main13
	MOVLW      0
	XORWF      _flag+0, 0
L__main13:
	BTFSS      STATUS+0, 2
	GOTO       L_main5
;Lab5_Vtornik.c,79 :: 		if (cnt1>=40) {
	MOVLW      0
	SUBWF      _cnt1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main14
	MOVLW      40
	SUBWF      _cnt1+0, 0
L__main14:
	BTFSS      STATUS+0, 0
	GOTO       L_main6
;Lab5_Vtornik.c,80 :: 		cnt1 = 0;
	CLRF       _cnt1+0
	CLRF       _cnt1+1
;Lab5_Vtornik.c,81 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Lab5_Vtornik.c,82 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Lab5_Vtornik.c,83 :: 		Lcd_Out(1,1,text1);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVF       _text1+0, 0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Lab5_Vtornik.c,84 :: 		flag=1;}
	MOVLW      1
	MOVWF      _flag+0
	MOVLW      0
	MOVWF      _flag+1
L_main6:
;Lab5_Vtornik.c,85 :: 		}
L_main5:
;Lab5_Vtornik.c,87 :: 		if(flag==1){
	MOVLW      0
	XORWF      _flag+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main15
	MOVLW      1
	XORWF      _flag+0, 0
L__main15:
	BTFSS      STATUS+0, 2
	GOTO       L_main7
;Lab5_Vtornik.c,89 :: 		if (cnt2>=7) {
	MOVLW      0
	SUBWF      _cnt2+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main16
	MOVLW      7
	SUBWF      _cnt2+0, 0
L__main16:
	BTFSS      STATUS+0, 0
	GOTO       L_main8
;Lab5_Vtornik.c,90 :: 		cnt2 = 0;
	CLRF       _cnt2+0
	CLRF       _cnt2+1
;Lab5_Vtornik.c,91 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Lab5_Vtornik.c,92 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Lab5_Vtornik.c,93 :: 		Lcd_Out(2,1,text2);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVF       _text2+0, 0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Lab5_Vtornik.c,94 :: 		flag=0;}
	CLRF       _flag+0
	CLRF       _flag+1
L_main8:
;Lab5_Vtornik.c,95 :: 		}
L_main7:
;Lab5_Vtornik.c,98 :: 		} while(1);
	GOTO       L_main2
;Lab5_Vtornik.c,99 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
