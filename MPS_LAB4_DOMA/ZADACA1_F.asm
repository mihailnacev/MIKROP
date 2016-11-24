
_main:

;ZADACA1_F.c,2 :: 		void main() {
;ZADACA1_F.c,3 :: 		int count = 5;
	MOVLW      5
	MOVWF      main_count_L0+0
	MOVLW      0
	MOVWF      main_count_L0+1
;ZADACA1_F.c,4 :: 		ANSEL = 0;
	CLRF       ANSEL+0
;ZADACA1_F.c,5 :: 		ANSELH = 0;
	CLRF       ANSELH+0
;ZADACA1_F.c,6 :: 		TRISB=0x00; // ??????????? ?? ??????? B ???? ??????? ?????
	CLRF       TRISB+0
;ZADACA1_F.c,7 :: 		PORTB=0x00; // ??????????? ?? ???? ?????? ?? ??????? B ?? ??????? 0
	CLRF       PORTB+0
;ZADACA1_F.c,14 :: 		while(count>0){ // ?????????? ?????????
L_main0:
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      main_count_L0+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main7
	MOVF       main_count_L0+0, 0
	SUBLW      0
L__main7:
	BTFSC      STATUS+0, 0
	GOTO       L_main1
;ZADACA1_F.c,15 :: 		PORTB=0b10000000;
	MOVLW      128
	MOVWF      PORTB+0
;ZADACA1_F.c,16 :: 		while(PORTB > 0){
L_main2:
	MOVF       PORTB+0, 0
	SUBLW      0
	BTFSC      STATUS+0, 0
	GOTO       L_main3
;ZADACA1_F.c,18 :: 		PORTB = PORTB / 4;
	MOVF       PORTB+0, 0
	MOVWF      R0+0
	RRF        R0+0, 1
	BCF        R0+0, 7
	RRF        R0+0, 1
	BCF        R0+0, 7
	MOVF       R0+0, 0
	MOVWF      PORTB+0
;ZADACA1_F.c,19 :: 		}
	GOTO       L_main2
L_main3:
;ZADACA1_F.c,20 :: 		PORTB=0b00000001;
	MOVLW      1
	MOVWF      PORTB+0
;ZADACA1_F.c,21 :: 		while(PORTB <=32){
L_main4:
	MOVF       PORTB+0, 0
	SUBLW      32
	BTFSS      STATUS+0, 0
	GOTO       L_main5
;ZADACA1_F.c,23 :: 		PORTB =  PORTB * 4;
	MOVF       PORTB+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	MOVWF      PORTB+0
;ZADACA1_F.c,24 :: 		}
	GOTO       L_main4
L_main5:
;ZADACA1_F.c,25 :: 		count--;
	MOVLW      1
	SUBWF      main_count_L0+0, 1
	BTFSS      STATUS+0, 0
	DECF       main_count_L0+1, 1
;ZADACA1_F.c,26 :: 		}
	GOTO       L_main0
L_main1:
;ZADACA1_F.c,27 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
