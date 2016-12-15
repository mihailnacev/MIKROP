
_main:

;Lab7_Sreda.c,32 :: 		void main() {
;Lab7_Sreda.c,33 :: 		ANSEL = 0;
	CLRF       ANSEL+0
;Lab7_Sreda.c,34 :: 		ANSELH = 0;
	CLRF       ANSELH+0
;Lab7_Sreda.c,35 :: 		C1ON_bit = 0;
	BCF        C1ON_bit+0, BitPos(C1ON_bit+0)
;Lab7_Sreda.c,36 :: 		C2ON_bit = 0;
	BCF        C2ON_bit+0, BitPos(C2ON_bit+0)
;Lab7_Sreda.c,37 :: 		counter = 0;
	CLRF       _counter+0
	CLRF       _counter+1
;Lab7_Sreda.c,38 :: 		sequenceCounter = 0;
	CLRF       _sequenceCounter+0
;Lab7_Sreda.c,39 :: 		i = 0;
	CLRF       _i+0
	CLRF       _i+1
;Lab7_Sreda.c,40 :: 		j = 0;
	CLRF       _j+0
	CLRF       _j+1
;Lab7_Sreda.c,42 :: 		Soft_SPI_Init();
	CALL       _Soft_SPI_Init+0
;Lab7_Sreda.c,44 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;Lab7_Sreda.c,45 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Lab7_Sreda.c,46 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Lab7_Sreda.c,48 :: 		UART1_Init(9600);
	MOVLW      51
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;Lab7_Sreda.c,49 :: 		Delay_ms(50);
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
;Lab7_Sreda.c,50 :: 		while(1)
L_main1:
;Lab7_Sreda.c,52 :: 		if(UART1_Data_Ready())
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main3
;Lab7_Sreda.c,54 :: 		beingRead = UART1_Read();
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      _beingRead+0
;Lab7_Sreda.c,55 :: 		if(counter == 3)
	MOVLW      0
	XORWF      _counter+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main18
	MOVLW      3
	XORWF      _counter+0, 0
L__main18:
	BTFSS      STATUS+0, 2
	GOTO       L_main4
;Lab7_Sreda.c,57 :: 		if(!isdigit(beingRead))
	MOVF       _beingRead+0, 0
	MOVWF      FARG_isdigit_character+0
	CALL       _isdigit+0
	MOVF       R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_main5
;Lab7_Sreda.c,59 :: 		counter = 0;
	CLRF       _counter+0
	CLRF       _counter+1
;Lab7_Sreda.c,60 :: 		appendStr[0] = pChar;
	MOVF       _pChar+0, 0
	MOVWF      _appendStr+0
;Lab7_Sreda.c,61 :: 		appendStr[1] = ppChar;
	MOVF       _ppChar+0, 0
	MOVWF      _appendStr+1
;Lab7_Sreda.c,62 :: 		appendStr[2] = pppChar;
	MOVF       _pppChar+0, 0
	MOVWF      _appendStr+2
;Lab7_Sreda.c,63 :: 		strings[i] = appendStr;
	MOVF       _i+0, 0
	ADDLW      _strings+0
	MOVWF      FSR
	MOVLW      _appendStr+0
	MOVWF      INDF+0
;Lab7_Sreda.c,65 :: 		Lcd_Out(1, 1, appendStr);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _appendStr+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Lab7_Sreda.c,67 :: 		i++;
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;Lab7_Sreda.c,68 :: 		sequenceCounter++;
	INCF       _sequenceCounter+0, 1
;Lab7_Sreda.c,70 :: 		for(j = 0; j < 20; j++)
	CLRF       _j+0
	CLRF       _j+1
L_main6:
	MOVLW      128
	XORWF      _j+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main19
	MOVLW      20
	SUBWF      _j+0, 0
L__main19:
	BTFSC      STATUS+0, 0
	GOTO       L_main7
;Lab7_Sreda.c,72 :: 		if(strcmp(strings[j], appendStr) == 0)
	MOVF       _j+0, 0
	ADDLW      _strings+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_strcmp_s1+0
	MOVLW      _appendStr+0
	MOVWF      FARG_strcmp_s2+0
	CALL       _strcmp+0
	MOVLW      0
	XORWF      R0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main20
	MOVLW      0
	XORWF      R0+0, 0
L__main20:
	BTFSS      STATUS+0, 2
	GOTO       L_main9
;Lab7_Sreda.c,74 :: 		Soft_SPI_Write(sequenceCounter);
	MOVF       _sequenceCounter+0, 0
	MOVWF      FARG_Soft_SPI_Write_sdata+0
	CALL       _Soft_SPI_Write+0
;Lab7_Sreda.c,75 :: 		break;
	GOTO       L_main7
;Lab7_Sreda.c,76 :: 		}
L_main9:
;Lab7_Sreda.c,70 :: 		for(j = 0; j < 20; j++)
	INCF       _j+0, 1
	BTFSC      STATUS+0, 2
	INCF       _j+1, 1
;Lab7_Sreda.c,77 :: 		}
	GOTO       L_main6
L_main7:
;Lab7_Sreda.c,78 :: 		}
L_main5:
;Lab7_Sreda.c,79 :: 		}
	GOTO       L_main10
L_main4:
;Lab7_Sreda.c,82 :: 		if(isdigit(beingRead))
	MOVF       _beingRead+0, 0
	MOVWF      FARG_isdigit_character+0
	CALL       _isdigit+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main11
;Lab7_Sreda.c,84 :: 		if(counter == 0)
	MOVLW      0
	XORWF      _counter+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main21
	MOVLW      0
	XORWF      _counter+0, 0
L__main21:
	BTFSS      STATUS+0, 2
	GOTO       L_main12
;Lab7_Sreda.c,86 :: 		pChar = beingRead;
	MOVF       _beingRead+0, 0
	MOVWF      _pChar+0
;Lab7_Sreda.c,87 :: 		}
	GOTO       L_main13
L_main12:
;Lab7_Sreda.c,88 :: 		else if(counter == 1)
	MOVLW      0
	XORWF      _counter+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main22
	MOVLW      1
	XORWF      _counter+0, 0
L__main22:
	BTFSS      STATUS+0, 2
	GOTO       L_main14
;Lab7_Sreda.c,90 :: 		ppChar = beingRead;
	MOVF       _beingRead+0, 0
	MOVWF      _ppChar+0
;Lab7_Sreda.c,91 :: 		}
	GOTO       L_main15
L_main14:
;Lab7_Sreda.c,92 :: 		else if(counter == 2)
	MOVLW      0
	XORWF      _counter+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main23
	MOVLW      2
	XORWF      _counter+0, 0
L__main23:
	BTFSS      STATUS+0, 2
	GOTO       L_main16
;Lab7_Sreda.c,94 :: 		pppChar = beingRead;
	MOVF       _beingRead+0, 0
	MOVWF      _pppChar+0
;Lab7_Sreda.c,95 :: 		}
L_main16:
L_main15:
L_main13:
;Lab7_Sreda.c,96 :: 		counter++;
	INCF       _counter+0, 1
	BTFSC      STATUS+0, 2
	INCF       _counter+1, 1
;Lab7_Sreda.c,97 :: 		}
L_main11:
;Lab7_Sreda.c,98 :: 		}
L_main10:
;Lab7_Sreda.c,99 :: 		}
L_main3:
;Lab7_Sreda.c,100 :: 		}
	GOTO       L_main1
;Lab7_Sreda.c,101 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
