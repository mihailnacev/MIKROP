
_main:

;ZADACA2.c,3 :: 		void main() {
;ZADACA2.c,6 :: 		int P=0b01110011;
	MOVLW      115
	MOVWF      main_P_L0+0
	MOVLW      0
	MOVWF      main_P_L0+1
	MOVLW      119
	MOVWF      main_A_L0+0
	MOVLW      0
	MOVWF      main_A_L0+1
	MOVLW      121
	MOVWF      main_E_L0+0
	MOVLW      0
	MOVWF      main_E_L0+1
	CLRF       main_value_L0+0
	CLRF       main_value_L0+1
;ZADACA2.c,10 :: 		ANSEL=0;
	CLRF       ANSEL+0
;ZADACA2.c,11 :: 		ANSELH=0;
	CLRF       ANSELH+0
;ZADACA2.c,12 :: 		TRISD.B1=1;
	BSF        TRISD+0, 1
;ZADACA2.c,13 :: 		TRISB=0x00;
	CLRF       TRISB+0
;ZADACA2.c,14 :: 		TRISA=0b11111111;
	MOVLW      255
	MOVWF      TRISA+0
;ZADACA2.c,15 :: 		EEPROM_Write(0x22,12);
	MOVLW      34
	MOVWF      FARG_EEPROM_Write_Address+0
	MOVLW      12
	MOVWF      FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
;ZADACA2.c,18 :: 		while(1){
L_main0:
;ZADACA2.c,19 :: 		clock=EEPROM_Read(0x22);
	MOVLW      34
	MOVWF      FARG_EEPROM_Read_Address+0
	CALL       _EEPROM_Read+0
	MOVF       R0+0, 0
	MOVWF      main_clock_L0+0
	CLRF       main_clock_L0+1
;ZADACA2.c,20 :: 		while(prekinuvac==0){
L_main2:
	BTFSC      PORTD+0, 1
	GOTO       L_main3
;ZADACA2.c,21 :: 		value=PORTA;
	MOVF       PORTA+0, 0
	MOVWF      main_value_L0+0
	CLRF       main_value_L0+1
;ZADACA2.c,22 :: 		value=value>>1;
	RRF        main_value_L0+1, 1
	RRF        main_value_L0+0, 1
	BCF        main_value_L0+1, 7
	BTFSC      main_value_L0+1, 6
	BSF        main_value_L0+1, 7
;ZADACA2.c,23 :: 		value=value<<3;
	MOVLW      3
	MOVWF      R0+0
	MOVF       R0+0, 0
L__main26:
	BTFSC      STATUS+0, 2
	GOTO       L__main27
	RLF        main_value_L0+0, 1
	RLF        main_value_L0+1, 1
	BCF        main_value_L0+0, 0
	ADDLW      255
	GOTO       L__main26
L__main27:
;ZADACA2.c,24 :: 		value=value>>3;
	MOVLW      3
	MOVWF      R0+0
	MOVF       R0+0, 0
L__main28:
	BTFSC      STATUS+0, 2
	GOTO       L__main29
	RRF        main_value_L0+1, 1
	RRF        main_value_L0+0, 1
	BCF        main_value_L0+1, 7
	BTFSC      main_value_L0+1, 6
	BSF        main_value_L0+1, 7
	ADDLW      255
	GOTO       L__main28
L__main29:
;ZADACA2.c,25 :: 		PORTB=0;
	CLRF       PORTB+0
;ZADACA2.c,26 :: 		}
	GOTO       L_main2
L_main3:
;ZADACA2.c,27 :: 		while(prekinuvac==1)
L_main4:
	BTFSS      PORTD+0, 1
	GOTO       L_main5
;ZADACA2.c,29 :: 		value=PORTA;
	MOVF       PORTA+0, 0
	MOVWF      main_value_L0+0
	CLRF       main_value_L0+1
;ZADACA2.c,30 :: 		value=value>>1;
	MOVF       main_value_L0+0, 0
	MOVWF      R1+0
	MOVF       main_value_L0+1, 0
	MOVWF      R1+1
	RRF        R1+1, 1
	RRF        R1+0, 1
	BCF        R1+1, 7
	BTFSC      R1+1, 6
	BSF        R1+1, 7
	MOVF       R1+0, 0
	MOVWF      main_value_L0+0
	MOVF       R1+1, 0
	MOVWF      main_value_L0+1
;ZADACA2.c,31 :: 		value=value<<3;
	MOVLW      3
	MOVWF      R0+0
	MOVF       R1+0, 0
	MOVWF      R3+0
	MOVF       R1+1, 0
	MOVWF      R3+1
	MOVF       R0+0, 0
L__main30:
	BTFSC      STATUS+0, 2
	GOTO       L__main31
	RLF        R3+0, 1
	RLF        R3+1, 1
	BCF        R3+0, 0
	ADDLW      255
	GOTO       L__main30
L__main31:
	MOVF       R3+0, 0
	MOVWF      main_value_L0+0
	MOVF       R3+1, 0
	MOVWF      main_value_L0+1
;ZADACA2.c,32 :: 		value=value>>3;
	MOVLW      3
	MOVWF      R0+0
	MOVF       R3+0, 0
	MOVWF      R1+0
	MOVF       R3+1, 0
	MOVWF      R1+1
	MOVF       R0+0, 0
L__main32:
	BTFSC      STATUS+0, 2
	GOTO       L__main33
	RRF        R1+1, 1
	RRF        R1+0, 1
	BCF        R1+1, 7
	BTFSC      R1+1, 6
	BSF        R1+1, 7
	ADDLW      255
	GOTO       L__main32
L__main33:
	MOVF       R1+0, 0
	MOVWF      main_value_L0+0
	MOVF       R1+1, 0
	MOVWF      main_value_L0+1
;ZADACA2.c,33 :: 		if(value>=0&&value<=12){
	MOVLW      128
	XORWF      R1+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main34
	MOVLW      0
	SUBWF      R1+0, 0
L__main34:
	BTFSS      STATUS+0, 0
	GOTO       L_main8
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      main_value_L0+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main35
	MOVF       main_value_L0+0, 0
	SUBLW      12
L__main35:
	BTFSS      STATUS+0, 0
	GOTO       L_main8
L__main24:
;ZADACA2.c,34 :: 		if(value==clock){
	MOVF       main_value_L0+1, 0
	XORWF      main_clock_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main36
	MOVF       main_clock_L0+0, 0
	XORWF      main_value_L0+0, 0
L__main36:
	BTFSS      STATUS+0, 2
	GOTO       L_main9
;ZADACA2.c,35 :: 		PORTB=A;
	MOVF       main_A_L0+0, 0
	MOVWF      PORTB+0
;ZADACA2.c,36 :: 		DELAY_ms(15);
	MOVLW      39
	MOVWF      R12+0
	MOVLW      245
	MOVWF      R13+0
L_main10:
	DECFSZ     R13+0, 1
	GOTO       L_main10
	DECFSZ     R12+0, 1
	GOTO       L_main10
;ZADACA2.c,37 :: 		PORTB=0;
	CLRF       PORTB+0
;ZADACA2.c,38 :: 		DELAY_ms(15);
	MOVLW      39
	MOVWF      R12+0
	MOVLW      245
	MOVWF      R13+0
L_main11:
	DECFSZ     R13+0, 1
	GOTO       L_main11
	DECFSZ     R12+0, 1
	GOTO       L_main11
;ZADACA2.c,39 :: 		}
L_main9:
;ZADACA2.c,40 :: 		PORTB=A;
	MOVF       main_A_L0+0, 0
	MOVWF      PORTB+0
;ZADACA2.c,41 :: 		}
	GOTO       L_main12
L_main8:
;ZADACA2.c,42 :: 		else if(value>=13&&value<=23){
	MOVLW      128
	XORWF      main_value_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main37
	MOVLW      13
	SUBWF      main_value_L0+0, 0
L__main37:
	BTFSS      STATUS+0, 0
	GOTO       L_main15
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      main_value_L0+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main38
	MOVF       main_value_L0+0, 0
	SUBLW      23
L__main38:
	BTFSS      STATUS+0, 0
	GOTO       L_main15
L__main23:
;ZADACA2.c,43 :: 		if(value==clock){
	MOVF       main_value_L0+1, 0
	XORWF      main_clock_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main39
	MOVF       main_clock_L0+0, 0
	XORWF      main_value_L0+0, 0
L__main39:
	BTFSS      STATUS+0, 2
	GOTO       L_main16
;ZADACA2.c,44 :: 		PORTB=P;
	MOVF       main_P_L0+0, 0
	MOVWF      PORTB+0
;ZADACA2.c,45 :: 		DELAY_ms(15);
	MOVLW      39
	MOVWF      R12+0
	MOVLW      245
	MOVWF      R13+0
L_main17:
	DECFSZ     R13+0, 1
	GOTO       L_main17
	DECFSZ     R12+0, 1
	GOTO       L_main17
;ZADACA2.c,46 :: 		PORTB=0;
	CLRF       PORTB+0
;ZADACA2.c,47 :: 		DELAY_ms(15);
	MOVLW      39
	MOVWF      R12+0
	MOVLW      245
	MOVWF      R13+0
L_main18:
	DECFSZ     R13+0, 1
	GOTO       L_main18
	DECFSZ     R12+0, 1
	GOTO       L_main18
;ZADACA2.c,48 :: 		}
L_main16:
;ZADACA2.c,49 :: 		PORTB=P;
	MOVF       main_P_L0+0, 0
	MOVWF      PORTB+0
;ZADACA2.c,50 :: 		}
	GOTO       L_main19
L_main15:
;ZADACA2.c,52 :: 		if(value==clock){
	MOVF       main_value_L0+1, 0
	XORWF      main_clock_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main40
	MOVF       main_clock_L0+0, 0
	XORWF      main_value_L0+0, 0
L__main40:
	BTFSS      STATUS+0, 2
	GOTO       L_main20
;ZADACA2.c,53 :: 		PORTB=E;
	MOVF       main_E_L0+0, 0
	MOVWF      PORTB+0
;ZADACA2.c,54 :: 		DELAY_ms(15);
	MOVLW      39
	MOVWF      R12+0
	MOVLW      245
	MOVWF      R13+0
L_main21:
	DECFSZ     R13+0, 1
	GOTO       L_main21
	DECFSZ     R12+0, 1
	GOTO       L_main21
;ZADACA2.c,55 :: 		PORTB=0;
	CLRF       PORTB+0
;ZADACA2.c,56 :: 		DELAY_ms(15);
	MOVLW      39
	MOVWF      R12+0
	MOVLW      245
	MOVWF      R13+0
L_main22:
	DECFSZ     R13+0, 1
	GOTO       L_main22
	DECFSZ     R12+0, 1
	GOTO       L_main22
;ZADACA2.c,57 :: 		}
L_main20:
;ZADACA2.c,58 :: 		PORTB=E;
	MOVF       main_E_L0+0, 0
	MOVWF      PORTB+0
;ZADACA2.c,59 :: 		}
L_main19:
L_main12:
;ZADACA2.c,60 :: 		}
	GOTO       L_main4
L_main5:
;ZADACA2.c,62 :: 		}
	GOTO       L_main0
;ZADACA2.c,63 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
