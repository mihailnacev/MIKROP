
_main:

;ZADACA1.c,1 :: 		void main() {
;ZADACA1.c,2 :: 		int br1=10;
	MOVLW      10
	MOVWF      main_br1_L0+0
	MOVLW      0
	MOVWF      main_br1_L0+1
	MOVLW      10
	MOVWF      main_br2_L0+0
	MOVLW      0
	MOVWF      main_br2_L0+1
	MOVLW      10
	MOVWF      main_count_L0+0
	MOVLW      0
	MOVWF      main_count_L0+1
	MOVLW      128
	MOVWF      main_brojac1_L0+0
	MOVLW      0
	MOVWF      main_brojac1_L0+1
	MOVLW      1
	MOVWF      main_brojac2_L0+0
	MOVLW      0
	MOVWF      main_brojac2_L0+1
	MOVLW      1
	MOVWF      main_flag_L0+0
	MOVLW      0
	MOVWF      main_flag_L0+1
;ZADACA1.c,8 :: 		ANSEL=0;
	CLRF       ANSEL+0
;ZADACA1.c,9 :: 		ANSELH=0;
	CLRF       ANSELH+0
;ZADACA1.c,10 :: 		TRISB=0x00;
	CLRF       TRISB+0
;ZADACA1.c,11 :: 		while(count>0){
L_main0:
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      main_count_L0+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main11
	MOVF       main_count_L0+0, 0
	SUBLW      0
L__main11:
	BTFSC      STATUS+0, 0
	GOTO       L_main1
;ZADACA1.c,12 :: 		PORTB=brojac1+brojac2;
	MOVF       main_brojac2_L0+0, 0
	ADDWF      main_brojac1_L0+0, 0
	MOVWF      PORTB+0
;ZADACA1.c,13 :: 		br2=br1;
	MOVF       main_br1_L0+0, 0
	MOVWF      main_br2_L0+0
	MOVF       main_br1_L0+1, 0
	MOVWF      main_br2_L0+1
;ZADACA1.c,14 :: 		while(br2>0){
L_main2:
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      main_br2_L0+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main12
	MOVF       main_br2_L0+0, 0
	SUBLW      0
L__main12:
	BTFSC      STATUS+0, 0
	GOTO       L_main3
;ZADACA1.c,15 :: 		DELAY_ms(1);
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_main4:
	DECFSZ     R13+0, 1
	GOTO       L_main4
	DECFSZ     R12+0, 1
	GOTO       L_main4
	NOP
	NOP
;ZADACA1.c,16 :: 		br2--;
	MOVLW      1
	SUBWF      main_br2_L0+0, 1
	BTFSS      STATUS+0, 0
	DECF       main_br2_L0+1, 1
;ZADACA1.c,17 :: 		}
	GOTO       L_main2
L_main3:
;ZADACA1.c,20 :: 		if(flag==1){
	MOVLW      0
	XORWF      main_flag_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main13
	MOVLW      1
	XORWF      main_flag_L0+0, 0
L__main13:
	BTFSS      STATUS+0, 2
	GOTO       L_main5
;ZADACA1.c,21 :: 		if(brojac1>0){
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      main_brojac1_L0+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main14
	MOVF       main_brojac1_L0+0, 0
	SUBLW      0
L__main14:
	BTFSC      STATUS+0, 0
	GOTO       L_main6
;ZADACA1.c,22 :: 		brojac1=brojac1>>1;
	RRF        main_brojac1_L0+1, 1
	RRF        main_brojac1_L0+0, 1
	BCF        main_brojac1_L0+1, 7
	BTFSC      main_brojac1_L0+1, 6
	BSF        main_brojac1_L0+1, 7
;ZADACA1.c,23 :: 		brojac2=brojac2<<1;
	RLF        main_brojac2_L0+0, 1
	RLF        main_brojac2_L0+1, 1
	BCF        main_brojac2_L0+0, 0
;ZADACA1.c,24 :: 		}
	GOTO       L_main7
L_main6:
;ZADACA1.c,27 :: 		flag=0; brojac1=1; brojac2=128;count--;
	CLRF       main_flag_L0+0
	CLRF       main_flag_L0+1
	MOVLW      1
	MOVWF      main_brojac1_L0+0
	MOVLW      0
	MOVWF      main_brojac1_L0+1
	MOVLW      128
	MOVWF      main_brojac2_L0+0
	CLRF       main_brojac2_L0+1
	MOVLW      1
	SUBWF      main_count_L0+0, 1
	BTFSS      STATUS+0, 0
	DECF       main_count_L0+1, 1
;ZADACA1.c,28 :: 		}
L_main7:
;ZADACA1.c,29 :: 		}
L_main5:
;ZADACA1.c,31 :: 		if(flag==0){
	MOVLW      0
	XORWF      main_flag_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main15
	MOVLW      0
	XORWF      main_flag_L0+0, 0
L__main15:
	BTFSS      STATUS+0, 2
	GOTO       L_main8
;ZADACA1.c,32 :: 		if(brojac1<=32){
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      main_brojac1_L0+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main16
	MOVF       main_brojac1_L0+0, 0
	SUBLW      32
L__main16:
	BTFSS      STATUS+0, 0
	GOTO       L_main9
;ZADACA1.c,33 :: 		brojac1=brojac1<<1;
	RLF        main_brojac1_L0+0, 1
	RLF        main_brojac1_L0+1, 1
	BCF        main_brojac1_L0+0, 0
;ZADACA1.c,34 :: 		brojac2=brojac2>>1;
	RRF        main_brojac2_L0+1, 1
	RRF        main_brojac2_L0+0, 1
	BCF        main_brojac2_L0+1, 7
	BTFSC      main_brojac2_L0+1, 6
	BSF        main_brojac2_L0+1, 7
;ZADACA1.c,35 :: 		}
	GOTO       L_main10
L_main9:
;ZADACA1.c,38 :: 		flag=1; brojac1=128; brojac2=1;count--; br1--;
	MOVLW      1
	MOVWF      main_flag_L0+0
	MOVLW      0
	MOVWF      main_flag_L0+1
	MOVLW      128
	MOVWF      main_brojac1_L0+0
	CLRF       main_brojac1_L0+1
	MOVLW      1
	MOVWF      main_brojac2_L0+0
	MOVLW      0
	MOVWF      main_brojac2_L0+1
	MOVLW      1
	SUBWF      main_count_L0+0, 1
	BTFSS      STATUS+0, 0
	DECF       main_count_L0+1, 1
	MOVLW      1
	SUBWF      main_br1_L0+0, 1
	BTFSS      STATUS+0, 0
	DECF       main_br1_L0+1, 1
;ZADACA1.c,39 :: 		}
L_main10:
;ZADACA1.c,40 :: 		}
L_main8:
;ZADACA1.c,41 :: 		}
	GOTO       L_main0
L_main1:
;ZADACA1.c,42 :: 		PORTB=0;
	CLRF       PORTB+0
;ZADACA1.c,43 :: 		}
	GOTO       $+0
; end of _main
