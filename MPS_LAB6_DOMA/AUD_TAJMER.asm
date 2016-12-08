
_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;AUD_TAJMER.c,17 :: 		void interrupt(){
;AUD_TAJMER.c,18 :: 		if(TMR0IF_bit){
	BTFSS      TMR0IF_bit+0, BitPos(TMR0IF_bit+0)
	GOTO       L_interrupt0
;AUD_TAJMER.c,19 :: 		cnt++;
	INCF       _cnt+0, 1
	BTFSC      STATUS+0, 2
	INCF       _cnt+1, 1
;AUD_TAJMER.c,20 :: 		TMR0IF_bit=0;
	BCF        TMR0IF_bit+0, BitPos(TMR0IF_bit+0)
;AUD_TAJMER.c,21 :: 		TMR0=96;
	MOVLW      96
	MOVWF      TMR0+0
;AUD_TAJMER.c,22 :: 		}
L_interrupt0:
;AUD_TAJMER.c,23 :: 		}
L_end_interrupt:
L__interrupt28:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt

_main:

;AUD_TAJMER.c,31 :: 		void main() {
;AUD_TAJMER.c,32 :: 		OPTION_REG=0x84; //prescaler 1:32
	MOVLW      132
	MOVWF      OPTION_REG+0
;AUD_TAJMER.c,33 :: 		ANSEL=0;
	CLRF       ANSEL+0
;AUD_TAJMER.c,34 :: 		ANSELH=0;
	CLRF       ANSELH+0
;AUD_TAJMER.c,35 :: 		C1ON_bit=0;
	BCF        C1ON_bit+0, BitPos(C1ON_bit+0)
;AUD_TAJMER.c,36 :: 		C2ON_bit=0;
	BCF        C2ON_bit+0, BitPos(C2ON_bit+0)
;AUD_TAJMER.c,37 :: 		Keypad_Init();
	CALL       _Keypad_Init+0
;AUD_TAJMER.c,38 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;AUD_TAJMER.c,39 :: 		Delay_ms(100);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main1:
	DECFSZ     R13+0, 1
	GOTO       L_main1
	DECFSZ     R12+0, 1
	GOTO       L_main1
	DECFSZ     R11+0, 1
	GOTO       L_main1
	NOP
;AUD_TAJMER.c,40 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;AUD_TAJMER.c,41 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;AUD_TAJMER.c,42 :: 		TMR0=96;
	MOVLW      96
	MOVWF      TMR0+0
;AUD_TAJMER.c,43 :: 		INTCON=0xA0;
	MOVLW      160
	MOVWF      INTCON+0
;AUD_TAJMER.c,44 :: 		cnt=0;
	CLRF       _cnt+0
	CLRF       _cnt+1
;AUD_TAJMER.c,45 :: 		for(i=0;i<=9;i++){
	CLRF       _i+0
	CLRF       _i+1
L_main2:
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _i+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main30
	MOVF       _i+0, 0
	SUBLW      9
L__main30:
	BTFSS      STATUS+0, 0
	GOTO       L_main3
;AUD_TAJMER.c,46 :: 		IntToStr(i,print);
	MOVF       _i+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       _i+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _print+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;AUD_TAJMER.c,47 :: 		Lcd_Out(1,1,"vnesi sifra za");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_AUD_TAJMER+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;AUD_TAJMER.c,48 :: 		Lcd_Out(2,1,print);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _print+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;AUD_TAJMER.c,49 :: 		cnt=0;
	CLRF       _cnt+0
	CLRF       _cnt+1
;AUD_TAJMER.c,51 :: 		do{
L_main5:
;AUD_TAJMER.c,52 :: 		kp=Keypad_Key_Click();
	CALL       _Keypad_Key_Click+0
	MOVF       R0+0, 0
	MOVWF      _kp+0
;AUD_TAJMER.c,55 :: 		if(cnt>=10){
	MOVLW      0
	SUBWF      _cnt+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main31
	MOVLW      10
	SUBWF      _cnt+0, 0
L__main31:
	BTFSS      STATUS+0, 0
	GOTO       L_main8
;AUD_TAJMER.c,56 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;AUD_TAJMER.c,57 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;AUD_TAJMER.c,58 :: 		Lcd_Out(1,1,"Vremeto istece");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_AUD_TAJMER+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;AUD_TAJMER.c,59 :: 		Lcd_Out(2,1,"Pobrzajte");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr3_AUD_TAJMER+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;AUD_TAJMER.c,60 :: 		}
L_main8:
;AUD_TAJMER.c,62 :: 		}while(!kp);
	MOVF       _kp+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main5
;AUD_TAJMER.c,64 :: 		switch (kp)
	GOTO       L_main9
;AUD_TAJMER.c,66 :: 		case 1: bukvi[i]='a'; break;
L_main11:
	MOVF       _i+0, 0
	ADDLW      _bukvi+0
	MOVWF      FSR
	MOVLW      97
	MOVWF      INDF+0
	GOTO       L_main10
;AUD_TAJMER.c,67 :: 		case 2: bukvi[i]='e'; break;
L_main12:
	MOVF       _i+0, 0
	ADDLW      _bukvi+0
	MOVWF      FSR
	MOVLW      101
	MOVWF      INDF+0
	GOTO       L_main10
;AUD_TAJMER.c,68 :: 		case 3: bukvi[i]='i'; break;
L_main13:
	MOVF       _i+0, 0
	ADDLW      _bukvi+0
	MOVWF      FSR
	MOVLW      105
	MOVWF      INDF+0
	GOTO       L_main10
;AUD_TAJMER.c,69 :: 		case 4: bukvi[i]='m'; break;
L_main14:
	MOVF       _i+0, 0
	ADDLW      _bukvi+0
	MOVWF      FSR
	MOVLW      109
	MOVWF      INDF+0
	GOTO       L_main10
;AUD_TAJMER.c,70 :: 		case 5: bukvi[i]='B'; break;
L_main15:
	MOVF       _i+0, 0
	ADDLW      _bukvi+0
	MOVWF      FSR
	MOVLW      66
	MOVWF      INDF+0
	GOTO       L_main10
;AUD_TAJMER.c,71 :: 		case 6: bukvi[i]='F'; break;
L_main16:
	MOVF       _i+0, 0
	ADDLW      _bukvi+0
	MOVWF      FSR
	MOVLW      70
	MOVWF      INDF+0
	GOTO       L_main10
;AUD_TAJMER.c,72 :: 		case 7: bukvi[i]='J'; break;
L_main17:
	MOVF       _i+0, 0
	ADDLW      _bukvi+0
	MOVWF      FSR
	MOVLW      74
	MOVWF      INDF+0
	GOTO       L_main10
;AUD_TAJMER.c,73 :: 		case 8: bukvi[i]='N'; break;
L_main18:
	MOVF       _i+0, 0
	ADDLW      _bukvi+0
	MOVWF      FSR
	MOVLW      78
	MOVWF      INDF+0
	GOTO       L_main10
;AUD_TAJMER.c,74 :: 		case 9: bukvi[i]='c'; break;
L_main19:
	MOVF       _i+0, 0
	ADDLW      _bukvi+0
	MOVWF      FSR
	MOVLW      99
	MOVWF      INDF+0
	GOTO       L_main10
;AUD_TAJMER.c,75 :: 		case 10: bukvi[i]='g'; break;
L_main20:
	MOVF       _i+0, 0
	ADDLW      _bukvi+0
	MOVWF      FSR
	MOVLW      103
	MOVWF      INDF+0
	GOTO       L_main10
;AUD_TAJMER.c,76 :: 		case 11: bukvi[i]='k'; break;
L_main21:
	MOVF       _i+0, 0
	ADDLW      _bukvi+0
	MOVWF      FSR
	MOVLW      107
	MOVWF      INDF+0
	GOTO       L_main10
;AUD_TAJMER.c,77 :: 		case 12: bukvi[i]='o'; break;
L_main22:
	MOVF       _i+0, 0
	ADDLW      _bukvi+0
	MOVWF      FSR
	MOVLW      111
	MOVWF      INDF+0
	GOTO       L_main10
;AUD_TAJMER.c,78 :: 		case 13: bukvi[i]='d'; break;
L_main23:
	MOVF       _i+0, 0
	ADDLW      _bukvi+0
	MOVWF      FSR
	MOVLW      100
	MOVWF      INDF+0
	GOTO       L_main10
;AUD_TAJMER.c,79 :: 		case 14: bukvi[i]='h'; break;
L_main24:
	MOVF       _i+0, 0
	ADDLW      _bukvi+0
	MOVWF      FSR
	MOVLW      104
	MOVWF      INDF+0
	GOTO       L_main10
;AUD_TAJMER.c,80 :: 		case 15: bukvi[i]='l'; break;
L_main25:
	MOVF       _i+0, 0
	ADDLW      _bukvi+0
	MOVWF      FSR
	MOVLW      108
	MOVWF      INDF+0
	GOTO       L_main10
;AUD_TAJMER.c,81 :: 		case 16: bukvi[i]='p'; break;
L_main26:
	MOVF       _i+0, 0
	ADDLW      _bukvi+0
	MOVWF      FSR
	MOVLW      112
	MOVWF      INDF+0
	GOTO       L_main10
;AUD_TAJMER.c,82 :: 		}
L_main9:
	MOVF       _kp+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_main11
	MOVF       _kp+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_main12
	MOVF       _kp+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_main13
	MOVF       _kp+0, 0
	XORLW      4
	BTFSC      STATUS+0, 2
	GOTO       L_main14
	MOVF       _kp+0, 0
	XORLW      5
	BTFSC      STATUS+0, 2
	GOTO       L_main15
	MOVF       _kp+0, 0
	XORLW      6
	BTFSC      STATUS+0, 2
	GOTO       L_main16
	MOVF       _kp+0, 0
	XORLW      7
	BTFSC      STATUS+0, 2
	GOTO       L_main17
	MOVF       _kp+0, 0
	XORLW      8
	BTFSC      STATUS+0, 2
	GOTO       L_main18
	MOVF       _kp+0, 0
	XORLW      9
	BTFSC      STATUS+0, 2
	GOTO       L_main19
	MOVF       _kp+0, 0
	XORLW      10
	BTFSC      STATUS+0, 2
	GOTO       L_main20
	MOVF       _kp+0, 0
	XORLW      11
	BTFSC      STATUS+0, 2
	GOTO       L_main21
	MOVF       _kp+0, 0
	XORLW      12
	BTFSC      STATUS+0, 2
	GOTO       L_main22
	MOVF       _kp+0, 0
	XORLW      13
	BTFSC      STATUS+0, 2
	GOTO       L_main23
	MOVF       _kp+0, 0
	XORLW      14
	BTFSC      STATUS+0, 2
	GOTO       L_main24
	MOVF       _kp+0, 0
	XORLW      15
	BTFSC      STATUS+0, 2
	GOTO       L_main25
	MOVF       _kp+0, 0
	XORLW      16
	BTFSC      STATUS+0, 2
	GOTO       L_main26
L_main10:
;AUD_TAJMER.c,45 :: 		for(i=0;i<=9;i++){
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;AUD_TAJMER.c,83 :: 		} // kraj na for
	GOTO       L_main2
L_main3:
;AUD_TAJMER.c,84 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;AUD_TAJMER.c,85 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;AUD_TAJMER.c,86 :: 		Lcd_Out(1,1,bukvi);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _bukvi+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;AUD_TAJMER.c,87 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
