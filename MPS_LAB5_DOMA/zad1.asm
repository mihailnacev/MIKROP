
_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;zad1.c,30 :: 		void interrupt()
;zad1.c,32 :: 		if(TMR0IF_bit)
	BTFSS      TMR0IF_bit+0, BitPos(TMR0IF_bit+0)
	GOTO       L_interrupt0
;zad1.c,34 :: 		TMR0IF_bit=0;
	BCF        TMR0IF_bit+0, BitPos(TMR0IF_bit+0)
;zad1.c,35 :: 		counter++;
	INCF       _counter+0, 1
	BTFSC      STATUS+0, 2
	INCF       _counter+1, 1
;zad1.c,36 :: 		TMR0=0;
	CLRF       TMR0+0
;zad1.c,37 :: 		}
L_interrupt0:
;zad1.c,38 :: 		}
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

;zad1.c,39 :: 		void main() {
;zad1.c,40 :: 		OPTION_REG=0x86;
	MOVLW      134
	MOVWF      OPTION_REG+0
;zad1.c,41 :: 		ANSEL=0;
	CLRF       ANSEL+0
;zad1.c,42 :: 		ANSELH=0;
	CLRF       ANSELH+0
;zad1.c,43 :: 		number=0;
	CLRF       _number+0
;zad1.c,44 :: 		INTCON=0xA0;
	MOVLW      160
	MOVWF      INTCON+0
;zad1.c,45 :: 		strcpy(text1,"Popust1$");
	MOVF       _text1+0, 0
	MOVWF      FARG_strcpy_to+0
	MOVLW      ?lstr1_zad1+0
	MOVWF      FARG_strcpy_from+0
	CALL       _strcpy+0
;zad1.c,46 :: 		strcpy(text2,"Popust2$");
	MOVF       _text2+0, 0
	MOVWF      FARG_strcpy_to+0
	MOVLW      ?lstr2_zad1+0
	MOVWF      FARG_strcpy_from+0
	CALL       _strcpy+0
;zad1.c,47 :: 		for(i=0; i<8; i++)
	CLRF       _i+0
	CLRF       _i+1
L_main1:
	MOVLW      128
	XORWF      _i+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main28
	MOVLW      8
	SUBWF      _i+0, 0
L__main28:
	BTFSC      STATUS+0, 0
	GOTO       L_main2
;zad1.c,49 :: 		EEPROM_Write(0x00 + i, text1[i]);
	MOVF       _i+0, 0
	MOVWF      FARG_EEPROM_Write_Address+0
	MOVF       _i+0, 0
	ADDWF      _text1+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
;zad1.c,47 :: 		for(i=0; i<8; i++)
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;zad1.c,50 :: 		}
	GOTO       L_main1
L_main2:
;zad1.c,51 :: 		for(i=0; i<8; i++)
	CLRF       _i+0
	CLRF       _i+1
L_main4:
	MOVLW      128
	XORWF      _i+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main29
	MOVLW      8
	SUBWF      _i+0, 0
L__main29:
	BTFSC      STATUS+0, 0
	GOTO       L_main5
;zad1.c,53 :: 		EEPROM_Write(0x20 + i, text2[i]);
	MOVF       _i+0, 0
	ADDLW      32
	MOVWF      FARG_EEPROM_Write_Address+0
	MOVF       _i+0, 0
	ADDWF      _text2+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
;zad1.c,51 :: 		for(i=0; i<8; i++)
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;zad1.c,54 :: 		}
	GOTO       L_main4
L_main5:
;zad1.c,55 :: 		for (i=0;i<8;i++)
	CLRF       _i+0
	CLRF       _i+1
L_main7:
	MOVLW      128
	XORWF      _i+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main30
	MOVLW      8
	SUBWF      _i+0, 0
L__main30:
	BTFSC      STATUS+0, 0
	GOTO       L_main8
;zad1.c,57 :: 		ch=EEPROM_Read(0x00+i);
	MOVF       _i+0, 0
	MOVWF      FARG_EEPROM_Read_Address+0
	CALL       _EEPROM_Read+0
	MOVF       R0+0, 0
	MOVWF      _ch+0
;zad1.c,58 :: 		if(ch!='$')
	MOVF       R0+0, 0
	XORLW      36
	BTFSC      STATUS+0, 2
	GOTO       L_main10
;zad1.c,60 :: 		number++;
	INCF       _number+0, 1
;zad1.c,61 :: 		text1[i]=ch;
	MOVF       _i+0, 0
	ADDWF      _text1+0, 0
	MOVWF      FSR
	MOVF       _ch+0, 0
	MOVWF      INDF+0
;zad1.c,62 :: 		}
L_main10:
;zad1.c,55 :: 		for (i=0;i<8;i++)
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;zad1.c,63 :: 		}
	GOTO       L_main7
L_main8:
;zad1.c,64 :: 		for (i=0;i<8;i++)
	CLRF       _i+0
	CLRF       _i+1
L_main11:
	MOVLW      128
	XORWF      _i+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main31
	MOVLW      8
	SUBWF      _i+0, 0
L__main31:
	BTFSC      STATUS+0, 0
	GOTO       L_main12
;zad1.c,66 :: 		ch=EEPROM_Read(0x20+i);
	MOVF       _i+0, 0
	ADDLW      32
	MOVWF      FARG_EEPROM_Read_Address+0
	CALL       _EEPROM_Read+0
	MOVF       R0+0, 0
	MOVWF      _ch+0
;zad1.c,67 :: 		if(ch!='$')
	MOVF       R0+0, 0
	XORLW      36
	BTFSC      STATUS+0, 2
	GOTO       L_main14
;zad1.c,69 :: 		number++;
	INCF       _number+0, 1
;zad1.c,70 :: 		text2[i]=ch;
	MOVF       _i+0, 0
	ADDWF      _text2+0, 0
	MOVWF      FSR
	MOVF       _ch+0, 0
	MOVWF      INDF+0
;zad1.c,71 :: 		}
L_main14:
;zad1.c,64 :: 		for (i=0;i<8;i++)
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;zad1.c,72 :: 		}
	GOTO       L_main11
L_main12:
;zad1.c,73 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;zad1.c,74 :: 		if(number>16)
	MOVLW      128
	XORLW      16
	MOVWF      R0+0
	MOVLW      128
	XORWF      _number+0, 0
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main15
;zad1.c,76 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;zad1.c,77 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;zad1.c,78 :: 		strcpy(text,"Greshka");
	MOVF       _text+0, 0
	MOVWF      FARG_strcpy_to+0
	MOVLW      ?lstr3_zad1+0
	MOVWF      FARG_strcpy_from+0
	CALL       _strcpy+0
;zad1.c,79 :: 		Lcd_Out(1,1,text);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVF       _text+0, 0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;zad1.c,80 :: 		}
	GOTO       L_main16
L_main15:
;zad1.c,83 :: 		while(1)
L_main17:
;zad1.c,85 :: 		if(prv)
	BTFSS      _prv+0, BitPos(_prv+0)
	GOTO       L_main19
;zad1.c,87 :: 		if(counter<235) //se prikazuva prviot text
	MOVLW      0
	SUBWF      _counter+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main32
	MOVLW      235
	SUBWF      _counter+0, 0
L__main32:
	BTFSC      STATUS+0, 0
	GOTO       L_main20
;zad1.c,89 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;zad1.c,90 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;zad1.c,91 :: 		Lcd_Out(1,1,text1);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVF       _text1+0, 0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;zad1.c,92 :: 		}
	GOTO       L_main21
L_main20:
;zad1.c,95 :: 		prv=0;
	BCF        _prv+0, BitPos(_prv+0)
;zad1.c,96 :: 		}
L_main21:
;zad1.c,97 :: 		}
	GOTO       L_main22
L_main19:
;zad1.c,100 :: 		if(counter<313) //se prikazuva vtoriot text
	MOVLW      1
	SUBWF      _counter+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main33
	MOVLW      57
	SUBWF      _counter+0, 0
L__main33:
	BTFSC      STATUS+0, 0
	GOTO       L_main23
;zad1.c,102 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;zad1.c,103 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;zad1.c,104 :: 		Lcd_Out(2,1,text2);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVF       _text2+0, 0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;zad1.c,105 :: 		}
	GOTO       L_main24
L_main23:
;zad1.c,108 :: 		prv=1;
	BSF        _prv+0, BitPos(_prv+0)
;zad1.c,109 :: 		}
L_main24:
;zad1.c,110 :: 		}
L_main22:
;zad1.c,111 :: 		}
	GOTO       L_main17
;zad1.c,112 :: 		}
L_main16:
;zad1.c,113 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
