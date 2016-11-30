
_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;Lab5_Vtornik.c,28 :: 		void interrupt(){
;Lab5_Vtornik.c,29 :: 		if(flag==0) cnt1++;
	MOVLW      0
	XORWF      _flag+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt27
	MOVLW      0
	XORWF      _flag+0, 0
L__interrupt27:
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt0
	INCF       _cnt1+0, 1
	BTFSC      STATUS+0, 2
	INCF       _cnt1+1, 1
	GOTO       L_interrupt1
L_interrupt0:
;Lab5_Vtornik.c,30 :: 		else cnt2++;
	INCF       _cnt2+0, 1
	BTFSC      STATUS+0, 2
	INCF       _cnt2+1, 1
L_interrupt1:
;Lab5_Vtornik.c,31 :: 		TMR0=236;
	MOVLW      236
	MOVWF      TMR0+0
;Lab5_Vtornik.c,32 :: 		INTCON=0xA0;
	MOVLW      160
	MOVWF      INTCON+0
;Lab5_Vtornik.c,33 :: 		}
L_end_interrupt:
L__interrupt26:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt

_main:

;Lab5_Vtornik.c,34 :: 		void main() {
;Lab5_Vtornik.c,35 :: 		ANSEL = 0;
	CLRF       ANSEL+0
;Lab5_Vtornik.c,36 :: 		ANSELH = 0;
	CLRF       ANSELH+0
;Lab5_Vtornik.c,37 :: 		text1="Popust$";
	MOVLW      ?lstr1_Lab5_Vtornik+0
	MOVWF      _text1+0
;Lab5_Vtornik.c,38 :: 		text2="Golem$";
	MOVLW      ?lstr2_Lab5_Vtornik+0
	MOVWF      _text2+0
;Lab5_Vtornik.c,39 :: 		text3="GRESKA";
	MOVLW      ?lstr3_Lab5_Vtornik+0
	MOVWF      _text3+0
;Lab5_Vtornik.c,40 :: 		Delay_ms(20);
	MOVLW      52
	MOVWF      R12+0
	MOVLW      241
	MOVWF      R13+0
L_main2:
	DECFSZ     R13+0, 1
	GOTO       L_main2
	DECFSZ     R12+0, 1
	GOTO       L_main2
	NOP
	NOP
;Lab5_Vtornik.c,41 :: 		for(i=0;i<len1-1;i++){
	CLRF       _i+0
	CLRF       _i+1
L_main3:
	MOVLW      128
	XORWF      _i+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main29
	MOVLW      6
	SUBWF      _i+0, 0
L__main29:
	BTFSC      STATUS+0, 0
	GOTO       L_main4
;Lab5_Vtornik.c,42 :: 		EEPROM_Write(0x00 + i, text1[i]);
	MOVF       _i+0, 0
	MOVWF      FARG_EEPROM_Write_Address+0
	MOVF       _i+0, 0
	ADDWF      _text1+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
;Lab5_Vtornik.c,43 :: 		Delay_ms(20);
	MOVLW      52
	MOVWF      R12+0
	MOVLW      241
	MOVWF      R13+0
L_main6:
	DECFSZ     R13+0, 1
	GOTO       L_main6
	DECFSZ     R12+0, 1
	GOTO       L_main6
	NOP
	NOP
;Lab5_Vtornik.c,41 :: 		for(i=0;i<len1-1;i++){
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;Lab5_Vtornik.c,44 :: 		}
	GOTO       L_main3
L_main4:
;Lab5_Vtornik.c,45 :: 		Delay_ms(20);
	MOVLW      52
	MOVWF      R12+0
	MOVLW      241
	MOVWF      R13+0
L_main7:
	DECFSZ     R13+0, 1
	GOTO       L_main7
	DECFSZ     R12+0, 1
	GOTO       L_main7
	NOP
	NOP
;Lab5_Vtornik.c,46 :: 		for(i=0;i<len2-1;i++){
	CLRF       _i+0
	CLRF       _i+1
L_main8:
	MOVLW      128
	XORWF      _i+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main30
	MOVLW      5
	SUBWF      _i+0, 0
L__main30:
	BTFSC      STATUS+0, 0
	GOTO       L_main9
;Lab5_Vtornik.c,47 :: 		EEPROM_Write(0x20 + i,text2[i]);
	MOVF       _i+0, 0
	ADDLW      32
	MOVWF      FARG_EEPROM_Write_Address+0
	MOVF       _i+0, 0
	ADDWF      _text2+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
;Lab5_Vtornik.c,48 :: 		Delay_ms(20);
	MOVLW      52
	MOVWF      R12+0
	MOVLW      241
	MOVWF      R13+0
L_main11:
	DECFSZ     R13+0, 1
	GOTO       L_main11
	DECFSZ     R12+0, 1
	GOTO       L_main11
	NOP
	NOP
;Lab5_Vtornik.c,46 :: 		for(i=0;i<len2-1;i++){
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;Lab5_Vtornik.c,49 :: 		}
	GOTO       L_main8
L_main9:
;Lab5_Vtornik.c,51 :: 		for(i=0;i<len1-2;i++){
	CLRF       _i+0
	CLRF       _i+1
L_main12:
	MOVLW      128
	XORWF      _i+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main31
	MOVLW      5
	SUBWF      _i+0, 0
L__main31:
	BTFSC      STATUS+0, 0
	GOTO       L_main13
;Lab5_Vtornik.c,52 :: 		ch=EEPROM_Read(0x00+i);
	MOVF       _i+0, 0
	MOVWF      FARG_EEPROM_Read_Address+0
	CALL       _EEPROM_Read+0
	MOVF       R0+0, 0
	MOVWF      _ch+0
;Lab5_Vtornik.c,53 :: 		brojac++;
	INCF       _brojac+0, 1
	BTFSC      STATUS+0, 2
	INCF       _brojac+1, 1
;Lab5_Vtornik.c,54 :: 		text1[i]=ch;
	MOVF       _i+0, 0
	ADDWF      _text1+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;Lab5_Vtornik.c,51 :: 		for(i=0;i<len1-2;i++){
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;Lab5_Vtornik.c,55 :: 		}
	GOTO       L_main12
L_main13:
;Lab5_Vtornik.c,57 :: 		for(i=0;i<len2-2;i++){
	CLRF       _i+0
	CLRF       _i+1
L_main15:
	MOVLW      128
	XORWF      _i+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main32
	MOVLW      4
	SUBWF      _i+0, 0
L__main32:
	BTFSC      STATUS+0, 0
	GOTO       L_main16
;Lab5_Vtornik.c,58 :: 		ch=EEPROM_Read(0x20+i);
	MOVF       _i+0, 0
	ADDLW      32
	MOVWF      FARG_EEPROM_Read_Address+0
	CALL       _EEPROM_Read+0
	MOVF       R0+0, 0
	MOVWF      _ch+0
;Lab5_Vtornik.c,59 :: 		brojac++;
	INCF       _brojac+0, 1
	BTFSC      STATUS+0, 2
	INCF       _brojac+1, 1
;Lab5_Vtornik.c,60 :: 		text2[i]=ch;
	MOVF       _i+0, 0
	ADDWF      _text2+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;Lab5_Vtornik.c,57 :: 		for(i=0;i<len2-2;i++){
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;Lab5_Vtornik.c,61 :: 		}
	GOTO       L_main15
L_main16:
;Lab5_Vtornik.c,63 :: 		OPTION_REG=0x86;
	MOVLW      134
	MOVWF      OPTION_REG+0
;Lab5_Vtornik.c,64 :: 		TMR0=236;
	MOVLW      236
	MOVWF      TMR0+0
;Lab5_Vtornik.c,65 :: 		INTCON=0xA0;
	MOVLW      160
	MOVWF      INTCON+0
;Lab5_Vtornik.c,66 :: 		cnt1=0;
	CLRF       _cnt1+0
	CLRF       _cnt1+1
;Lab5_Vtornik.c,67 :: 		cnt2=0;
	CLRF       _cnt2+0
	CLRF       _cnt2+1
;Lab5_Vtornik.c,68 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;Lab5_Vtornik.c,69 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Lab5_Vtornik.c,70 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Lab5_Vtornik.c,72 :: 		do {
L_main18:
;Lab5_Vtornik.c,74 :: 		if(flag==0){
	MOVLW      0
	XORWF      _flag+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main33
	MOVLW      0
	XORWF      _flag+0, 0
L__main33:
	BTFSS      STATUS+0, 2
	GOTO       L_main21
;Lab5_Vtornik.c,76 :: 		if (cnt1>=12) {
	MOVLW      0
	SUBWF      _cnt1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main34
	MOVLW      12
	SUBWF      _cnt1+0, 0
L__main34:
	BTFSS      STATUS+0, 0
	GOTO       L_main22
;Lab5_Vtornik.c,77 :: 		cnt1 = 0;
	CLRF       _cnt1+0
	CLRF       _cnt1+1
;Lab5_Vtornik.c,78 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Lab5_Vtornik.c,79 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Lab5_Vtornik.c,80 :: 		Lcd_Out(1,1,text1);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVF       _text1+0, 0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Lab5_Vtornik.c,81 :: 		flag=1;}
	MOVLW      1
	MOVWF      _flag+0
	MOVLW      0
	MOVWF      _flag+1
L_main22:
;Lab5_Vtornik.c,82 :: 		}
L_main21:
;Lab5_Vtornik.c,84 :: 		if(flag==1){
	MOVLW      0
	XORWF      _flag+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main35
	MOVLW      1
	XORWF      _flag+0, 0
L__main35:
	BTFSS      STATUS+0, 2
	GOTO       L_main23
;Lab5_Vtornik.c,86 :: 		if (cnt2>=16) {
	MOVLW      0
	SUBWF      _cnt2+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main36
	MOVLW      16
	SUBWF      _cnt2+0, 0
L__main36:
	BTFSS      STATUS+0, 0
	GOTO       L_main24
;Lab5_Vtornik.c,87 :: 		cnt2 = 0;
	CLRF       _cnt2+0
	CLRF       _cnt2+1
;Lab5_Vtornik.c,88 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Lab5_Vtornik.c,89 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Lab5_Vtornik.c,90 :: 		Lcd_Out(2,1,text2);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVF       _text2+0, 0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Lab5_Vtornik.c,91 :: 		flag=0;}
	CLRF       _flag+0
	CLRF       _flag+1
L_main24:
;Lab5_Vtornik.c,92 :: 		}
L_main23:
;Lab5_Vtornik.c,95 :: 		} while(1);
	GOTO       L_main18
;Lab5_Vtornik.c,96 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
