
_main:

;ZADACA2.c,6 :: 		void main() {
;ZADACA2.c,7 :: 		ANSEL=0;
	CLRF       ANSEL+0
;ZADACA2.c,8 :: 		ANSELH=0;
	CLRF       ANSELH+0
;ZADACA2.c,9 :: 		TRISA.B0=1;
	BSF        TRISA+0, 0
;ZADACA2.c,10 :: 		TRISA.B1=1;
	BSF        TRISA+0, 1
;ZADACA2.c,11 :: 		TRISD=0x00;
	CLRF       TRISD+0
;ZADACA2.c,14 :: 		while(1){
L_main0:
;ZADACA2.c,15 :: 		while(otvorena==0){
L_main2:
	BTFSC      PORTA+0, 0
	GOTO       L_main3
;ZADACA2.c,16 :: 		crveno=1;
	BSF        PORTD+0, 7
;ZADACA2.c,18 :: 		crveno=0;
	BCF        PORTD+0, 7
;ZADACA2.c,19 :: 		zolto=1;
	BSF        PORTD+0, 6
;ZADACA2.c,21 :: 		zolto=0;
	BCF        PORTD+0, 6
;ZADACA2.c,22 :: 		zeleno=1;
	BSF        PORTD+0, 5
;ZADACA2.c,24 :: 		zeleno=0;
	BCF        PORTD+0, 5
;ZADACA2.c,25 :: 		}
	GOTO       L_main2
L_main3:
;ZADACA2.c,27 :: 		while(otvorena==1&&raboti==0){
L_main4:
	BTFSS      PORTA+0, 0
	GOTO       L_main5
	BTFSC      PORTA+0, 1
	GOTO       L_main5
L__main13:
;ZADACA2.c,28 :: 		zolto=1;
	BSF        PORTD+0, 6
;ZADACA2.c,30 :: 		zolto=0;
	BCF        PORTD+0, 6
;ZADACA2.c,31 :: 		crveno=1;
	BSF        PORTD+0, 7
;ZADACA2.c,33 :: 		crveno=0;
	BCF        PORTD+0, 7
;ZADACA2.c,34 :: 		}
	GOTO       L_main4
L_main5:
;ZADACA2.c,35 :: 		while(otvorena==1&&raboti==1){
L_main8:
	BTFSS      PORTA+0, 0
	GOTO       L_main9
	BTFSS      PORTA+0, 1
	GOTO       L_main9
L__main12:
;ZADACA2.c,36 :: 		zeleno=1;
	BSF        PORTD+0, 5
;ZADACA2.c,37 :: 		}
	GOTO       L_main8
L_main9:
;ZADACA2.c,39 :: 		}
	GOTO       L_main0
;ZADACA2.c,40 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
