
_main:

;ZADACA1.c,1 :: 		void main() {
;ZADACA1.c,3 :: 		int brojac=5;
	MOVLW      5
	MOVWF      main_brojac_L0+0
	MOVLW      0
	MOVWF      main_brojac_L0+1
;ZADACA1.c,4 :: 		ANSEL=0;
	CLRF       ANSEL+0
;ZADACA1.c,5 :: 		ANSELH=0;
	CLRF       ANSELH+0
;ZADACA1.c,6 :: 		TRISB=0;
	CLRF       TRISB+0
;ZADACA1.c,7 :: 		PORTB=0b10000000;
	MOVLW      128
	MOVWF      PORTB+0
;ZADACA1.c,8 :: 		flag=1;
	MOVLW      1
	MOVWF      R2+0
	MOVLW      0
	MOVWF      R2+1
;ZADACA1.c,9 :: 		while(brojac>0){
L_main0:
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      main_brojac_L0+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main9
	MOVF       main_brojac_L0+0, 0
	SUBLW      0
L__main9:
	BTFSC      STATUS+0, 0
	GOTO       L_main1
;ZADACA1.c,11 :: 		if(flag==1)
	MOVLW      0
	XORWF      R2+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main10
	MOVLW      1
	XORWF      R2+0, 0
L__main10:
	BTFSS      STATUS+0, 2
	GOTO       L_main2
;ZADACA1.c,13 :: 		if(PORTB>0)
	MOVF       PORTB+0, 0
	SUBLW      0
	BTFSC      STATUS+0, 0
	GOTO       L_main3
;ZADACA1.c,14 :: 		{PORTB=PORTB>>2;}
	MOVF       PORTB+0, 0
	MOVWF      R0+0
	RRF        R0+0, 1
	BCF        R0+0, 7
	RRF        R0+0, 1
	BCF        R0+0, 7
	MOVF       R0+0, 0
	MOVWF      PORTB+0
	GOTO       L_main4
L_main3:
;ZADACA1.c,16 :: 		{flag=0; PORTB=0b00000001; brojac--;}
	CLRF       R2+0
	CLRF       R2+1
	MOVLW      1
	MOVWF      PORTB+0
	MOVLW      1
	SUBWF      main_brojac_L0+0, 1
	BTFSS      STATUS+0, 0
	DECF       main_brojac_L0+1, 1
L_main4:
;ZADACA1.c,17 :: 		}
L_main2:
;ZADACA1.c,19 :: 		if(flag==0)
	MOVLW      0
	XORWF      R2+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main11
	MOVLW      0
	XORWF      R2+0, 0
L__main11:
	BTFSS      STATUS+0, 2
	GOTO       L_main5
;ZADACA1.c,21 :: 		if(PORTB<=32)
	MOVF       PORTB+0, 0
	SUBLW      32
	BTFSS      STATUS+0, 0
	GOTO       L_main6
;ZADACA1.c,22 :: 		{PORTB=PORTB<<2;}
	MOVF       PORTB+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	MOVWF      PORTB+0
	GOTO       L_main7
L_main6:
;ZADACA1.c,24 :: 		{flag=1; PORTB=0b10000000; brojac--;}
	MOVLW      1
	MOVWF      R2+0
	MOVLW      0
	MOVWF      R2+1
	MOVLW      128
	MOVWF      PORTB+0
	MOVLW      1
	SUBWF      main_brojac_L0+0, 1
	BTFSS      STATUS+0, 0
	DECF       main_brojac_L0+1, 1
;ZADACA1.c,25 :: 		}
L_main7:
;ZADACA1.c,26 :: 		}
L_main5:
;ZADACA1.c,28 :: 		}
	GOTO       L_main0
L_main1:
;ZADACA1.c,30 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
