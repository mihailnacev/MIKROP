
_main:

;LABMPS_ZADACA.c,30 :: 		void main(){
;LABMPS_ZADACA.c,31 :: 		ANSEL=0;
	CLRF       ANSEL+0
;LABMPS_ZADACA.c,32 :: 		ANSELH=0;
	CLRF       ANSELH+0
;LABMPS_ZADACA.c,33 :: 		UART1_Init(9600);
	MOVLW      51
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;LABMPS_ZADACA.c,34 :: 		Delay_ms(100);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main0:
	DECFSZ     R13+0, 1
	GOTO       L_main0
	DECFSZ     R12+0, 1
	GOTO       L_main0
	DECFSZ     R11+0, 1
	GOTO       L_main0
	NOP
;LABMPS_ZADACA.c,35 :: 		i=0;
	CLRF       _i+0
	CLRF       _i+1
;LABMPS_ZADACA.c,36 :: 		j=0;
	CLRF       _j+0
	CLRF       _j+1
;LABMPS_ZADACA.c,37 :: 		k=0;
	CLRF       _k+0
	CLRF       _k+1
;LABMPS_ZADACA.c,38 :: 		l=0;
	CLRF       _l+0
	CLRF       _l+1
;LABMPS_ZADACA.c,39 :: 		q=0;
	CLRF       _q+0
	CLRF       _q+1
;LABMPS_ZADACA.c,40 :: 		poj=0;
	CLRF       _poj+0
	CLRF       _poj+1
;LABMPS_ZADACA.c,41 :: 		flag=1;
	MOVLW      1
	MOVWF      _flag+0
	MOVLW      0
	MOVWF      _flag+1
;LABMPS_ZADACA.c,42 :: 		while(1){
L_main1:
;LABMPS_ZADACA.c,43 :: 		if(UART1_Data_Ready()){
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main3
;LABMPS_ZADACA.c,44 :: 		uart_rd=UART1_Read();
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      _uart_rd+0
;LABMPS_ZADACA.c,46 :: 		if(uart_rd==' '){
	MOVF       R0+0, 0
	XORLW      32
	BTFSS      STATUS+0, 2
	GOTO       L_main4
;LABMPS_ZADACA.c,47 :: 		j=0;
	CLRF       _j+0
	CLRF       _j+1
;LABMPS_ZADACA.c,48 :: 		i++;
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;LABMPS_ZADACA.c,49 :: 		}
	GOTO       L_main5
L_main4:
;LABMPS_ZADACA.c,50 :: 		else if(uart_rd=='.'){
	MOVF       _uart_rd+0, 0
	XORLW      46
	BTFSS      STATUS+0, 2
	GOTO       L_main6
;LABMPS_ZADACA.c,51 :: 		i++;
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;LABMPS_ZADACA.c,52 :: 		break;
	GOTO       L_main2
;LABMPS_ZADACA.c,53 :: 		}
L_main6:
;LABMPS_ZADACA.c,55 :: 		matrica[i][j]=uart_rd;
	MOVLW      10
	MOVWF      R0+0
	MOVLW      0
	MOVWF      R0+1
	MOVF       _i+0, 0
	MOVWF      R4+0
	MOVF       _i+1, 0
	MOVWF      R4+1
	CALL       _Mul_16X16_U+0
	MOVLW      _matrica+0
	ADDWF      R0+0, 1
	MOVF       _j+0, 0
	ADDWF      R0+0, 0
	MOVWF      FSR
	MOVF       _uart_rd+0, 0
	MOVWF      INDF+0
;LABMPS_ZADACA.c,56 :: 		dolzina[i]++;
	MOVF       _i+0, 0
	MOVWF      R0+0
	MOVF       _i+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDLW      _dolzina+0
	MOVWF      R2+0
	MOVF       R2+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R0+0
	INCF       FSR, 1
	MOVF       INDF+0, 0
	MOVWF      R0+1
	INCF       R0+0, 1
	BTFSC      STATUS+0, 2
	INCF       R0+1, 1
	MOVF       R2+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
	MOVF       R0+1, 0
	INCF       FSR, 1
	MOVWF      INDF+0
;LABMPS_ZADACA.c,57 :: 		j++;
	INCF       _j+0, 1
	BTFSC      STATUS+0, 2
	INCF       _j+1, 1
;LABMPS_ZADACA.c,58 :: 		}
L_main5:
;LABMPS_ZADACA.c,59 :: 		}
L_main3:
;LABMPS_ZADACA.c,61 :: 		}
	GOTO       L_main1
L_main2:
;LABMPS_ZADACA.c,63 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;LABMPS_ZADACA.c,64 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;LABMPS_ZADACA.c,65 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;LABMPS_ZADACA.c,66 :: 		brZborovi=i;
	MOVF       _i+0, 0
	MOVWF      _brZborovi+0
	MOVF       _i+1, 0
	MOVWF      _brZborovi+1
;LABMPS_ZADACA.c,67 :: 		for(i=0;i<5;i++){
	CLRF       _i+0
	CLRF       _i+1
L_main8:
	MOVLW      128
	XORWF      _i+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main38
	MOVLW      5
	SUBWF      _i+0, 0
L__main38:
	BTFSC      STATUS+0, 0
	GOTO       L_main9
;LABMPS_ZADACA.c,68 :: 		broi[i]=0;
	MOVF       _i+0, 0
	MOVWF      R0+0
	MOVF       _i+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDLW      _broi+0
	MOVWF      FSR
	CLRF       INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
;LABMPS_ZADACA.c,67 :: 		for(i=0;i<5;i++){
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;LABMPS_ZADACA.c,70 :: 		}
	GOTO       L_main8
L_main9:
;LABMPS_ZADACA.c,71 :: 		for(i=0;i<brZborovi;i++){
	CLRF       _i+0
	CLRF       _i+1
L_main11:
	MOVLW      128
	XORWF      _i+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORWF      _brZborovi+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main39
	MOVF       _brZborovi+0, 0
	SUBWF      _i+0, 0
L__main39:
	BTFSC      STATUS+0, 0
	GOTO       L_main12
;LABMPS_ZADACA.c,72 :: 		for(q = 0; q < 10;  ++q )
	CLRF       _q+0
	CLRF       _q+1
L_main14:
	MOVLW      128
	XORWF      _q+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main40
	MOVLW      10
	SUBWF      _q+0, 0
L__main40:
	BTFSC      STATUS+0, 0
	GOTO       L_main15
;LABMPS_ZADACA.c,73 :: 		tekoven[q] = (char)0;
	MOVF       _q+0, 0
	ADDLW      _tekoven+0
	MOVWF      FSR
	CLRF       INDF+0
;LABMPS_ZADACA.c,72 :: 		for(q = 0; q < 10;  ++q )
	INCF       _q+0, 1
	BTFSC      STATUS+0, 2
	INCF       _q+1, 1
;LABMPS_ZADACA.c,73 :: 		tekoven[q] = (char)0;
	GOTO       L_main14
L_main15:
;LABMPS_ZADACA.c,74 :: 		for(j=0;j<dolzina[i];j++){
	CLRF       _j+0
	CLRF       _j+1
L_main17:
	MOVF       _i+0, 0
	MOVWF      R0+0
	MOVF       _i+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDLW      _dolzina+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R1+0
	INCF       FSR, 1
	MOVF       INDF+0, 0
	MOVWF      R1+1
	MOVLW      128
	XORWF      _j+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORWF      R1+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main41
	MOVF       R1+0, 0
	SUBWF      _j+0, 0
L__main41:
	BTFSC      STATUS+0, 0
	GOTO       L_main18
;LABMPS_ZADACA.c,75 :: 		Lcd_Chr(1,j+1,matrica[i][j]);
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_row+0
	INCF       _j+0, 0
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      10
	MOVWF      R0+0
	MOVLW      0
	MOVWF      R0+1
	MOVF       _i+0, 0
	MOVWF      R4+0
	MOVF       _i+1, 0
	MOVWF      R4+1
	CALL       _Mul_16X16_U+0
	MOVLW      _matrica+0
	ADDWF      R0+0, 1
	MOVF       _j+0, 0
	ADDWF      R0+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;LABMPS_ZADACA.c,76 :: 		tekoven[j]=matrica[i][j];
	MOVF       _j+0, 0
	ADDLW      _tekoven+0
	MOVWF      FLOC__main+0
	MOVLW      10
	MOVWF      R0+0
	MOVLW      0
	MOVWF      R0+1
	MOVF       _i+0, 0
	MOVWF      R4+0
	MOVF       _i+1, 0
	MOVWF      R4+1
	CALL       _Mul_16X16_U+0
	MOVLW      _matrica+0
	ADDWF      R0+0, 1
	MOVF       _j+0, 0
	ADDWF      R0+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R0+0
	MOVF       FLOC__main+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;LABMPS_ZADACA.c,74 :: 		for(j=0;j<dolzina[i];j++){
	INCF       _j+0, 1
	BTFSC      STATUS+0, 2
	INCF       _j+1, 1
;LABMPS_ZADACA.c,77 :: 		}
	GOTO       L_main17
L_main18:
;LABMPS_ZADACA.c,78 :: 		Delay_ms(20);
	MOVLW      52
	MOVWF      R12+0
	MOVLW      241
	MOVWF      R13+0
L_main20:
	DECFSZ     R13+0, 1
	GOTO       L_main20
	DECFSZ     R12+0, 1
	GOTO       L_main20
	NOP
	NOP
;LABMPS_ZADACA.c,79 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;LABMPS_ZADACA.c,80 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;LABMPS_ZADACA.c,81 :: 		for(k=0;k<brZborovi;k++){
	CLRF       _k+0
	CLRF       _k+1
L_main21:
	MOVLW      128
	XORWF      _k+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORWF      _brZborovi+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main42
	MOVF       _brZborovi+0, 0
	SUBWF      _k+0, 0
L__main42:
	BTFSC      STATUS+0, 0
	GOTO       L_main22
;LABMPS_ZADACA.c,82 :: 		flag=1;
	MOVLW      1
	MOVWF      _flag+0
	MOVLW      0
	MOVWF      _flag+1
;LABMPS_ZADACA.c,83 :: 		for(l=0;l<dolzina[k];l++){
	CLRF       _l+0
	CLRF       _l+1
L_main24:
	MOVF       _k+0, 0
	MOVWF      R0+0
	MOVF       _k+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDLW      _dolzina+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R1+0
	INCF       FSR, 1
	MOVF       INDF+0, 0
	MOVWF      R1+1
	MOVLW      128
	XORWF      _l+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORWF      R1+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main43
	MOVF       R1+0, 0
	SUBWF      _l+0, 0
L__main43:
	BTFSC      STATUS+0, 0
	GOTO       L_main25
;LABMPS_ZADACA.c,84 :: 		if(tekoven[l]==matrica[k][l]){
	MOVF       _l+0, 0
	ADDLW      _tekoven+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FLOC__main+0
	MOVLW      10
	MOVWF      R0+0
	MOVLW      0
	MOVWF      R0+1
	MOVF       _k+0, 0
	MOVWF      R4+0
	MOVF       _k+1, 0
	MOVWF      R4+1
	CALL       _Mul_16X16_U+0
	MOVLW      _matrica+0
	ADDWF      R0+0, 1
	MOVF       _l+0, 0
	ADDWF      R0+0, 0
	MOVWF      FSR
	MOVF       FLOC__main+0, 0
	XORWF      INDF+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_main27
;LABMPS_ZADACA.c,85 :: 		flag=1;
	MOVLW      1
	MOVWF      _flag+0
	MOVLW      0
	MOVWF      _flag+1
;LABMPS_ZADACA.c,86 :: 		}
	GOTO       L_main28
L_main27:
;LABMPS_ZADACA.c,88 :: 		flag=0;
	CLRF       _flag+0
	CLRF       _flag+1
;LABMPS_ZADACA.c,89 :: 		break;
	GOTO       L_main25
;LABMPS_ZADACA.c,90 :: 		}
L_main28:
;LABMPS_ZADACA.c,83 :: 		for(l=0;l<dolzina[k];l++){
	INCF       _l+0, 1
	BTFSC      STATUS+0, 2
	INCF       _l+1, 1
;LABMPS_ZADACA.c,91 :: 		}
	GOTO       L_main24
L_main25:
;LABMPS_ZADACA.c,92 :: 		if(flag==1) {broi[k]=broi[k]+1;}
	MOVLW      0
	XORWF      _flag+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main44
	MOVLW      1
	XORWF      _flag+0, 0
L__main44:
	BTFSS      STATUS+0, 2
	GOTO       L_main29
	MOVF       _k+0, 0
	MOVWF      R0+0
	MOVF       _k+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDLW      _broi+0
	MOVWF      R2+0
	MOVF       R2+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	ADDLW      1
	MOVWF      R0+0
	MOVLW      0
	BTFSC      STATUS+0, 0
	ADDLW      1
	INCF       FSR, 1
	ADDWF      INDF+0, 0
	MOVWF      R0+1
	MOVF       R2+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
	MOVF       R0+1, 0
	INCF       FSR, 1
	MOVWF      INDF+0
L_main29:
;LABMPS_ZADACA.c,81 :: 		for(k=0;k<brZborovi;k++){
	INCF       _k+0, 1
	BTFSC      STATUS+0, 2
	INCF       _k+1, 1
;LABMPS_ZADACA.c,93 :: 		}
	GOTO       L_main21
L_main22:
;LABMPS_ZADACA.c,71 :: 		for(i=0;i<brZborovi;i++){
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;LABMPS_ZADACA.c,97 :: 		}
	GOTO       L_main11
L_main12:
;LABMPS_ZADACA.c,99 :: 		for(i=0;i<brZborovi;i++){
	CLRF       _i+0
	CLRF       _i+1
L_main30:
	MOVLW      128
	XORWF      _i+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORWF      _brZborovi+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main45
	MOVF       _brZborovi+0, 0
	SUBWF      _i+0, 0
L__main45:
	BTFSC      STATUS+0, 0
	GOTO       L_main31
;LABMPS_ZADACA.c,100 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;LABMPS_ZADACA.c,101 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;LABMPS_ZADACA.c,102 :: 		for(j=0;j<dolzina[i];j++){
	CLRF       _j+0
	CLRF       _j+1
L_main33:
	MOVF       _i+0, 0
	MOVWF      R0+0
	MOVF       _i+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDLW      _dolzina+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R1+0
	INCF       FSR, 1
	MOVF       INDF+0, 0
	MOVWF      R1+1
	MOVLW      128
	XORWF      _j+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORWF      R1+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main46
	MOVF       R1+0, 0
	SUBWF      _j+0, 0
L__main46:
	BTFSC      STATUS+0, 0
	GOTO       L_main34
;LABMPS_ZADACA.c,103 :: 		Lcd_Chr(1,j+1,matrica[i][j]);
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_row+0
	INCF       _j+0, 0
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      10
	MOVWF      R0+0
	MOVLW      0
	MOVWF      R0+1
	MOVF       _i+0, 0
	MOVWF      R4+0
	MOVF       _i+1, 0
	MOVWF      R4+1
	CALL       _Mul_16X16_U+0
	MOVLW      _matrica+0
	ADDWF      R0+0, 1
	MOVF       _j+0, 0
	ADDWF      R0+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;LABMPS_ZADACA.c,104 :: 		tekoven[j]=matrica[i][j];
	MOVF       _j+0, 0
	ADDLW      _tekoven+0
	MOVWF      FLOC__main+0
	MOVLW      10
	MOVWF      R0+0
	MOVLW      0
	MOVWF      R0+1
	MOVF       _i+0, 0
	MOVWF      R4+0
	MOVF       _i+1, 0
	MOVWF      R4+1
	CALL       _Mul_16X16_U+0
	MOVLW      _matrica+0
	ADDWF      R0+0, 1
	MOVF       _j+0, 0
	ADDWF      R0+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R0+0
	MOVF       FLOC__main+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;LABMPS_ZADACA.c,102 :: 		for(j=0;j<dolzina[i];j++){
	INCF       _j+0, 1
	BTFSC      STATUS+0, 2
	INCF       _j+1, 1
;LABMPS_ZADACA.c,105 :: 		}
	GOTO       L_main33
L_main34:
;LABMPS_ZADACA.c,106 :: 		IntToStr(broi[i],sifra);
	MOVF       _i+0, 0
	MOVWF      R0+0
	MOVF       _i+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDLW      _broi+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_IntToStr_input+0
	INCF       FSR, 1
	MOVF       INDF+0, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _sifra+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;LABMPS_ZADACA.c,107 :: 		text=Ltrim(sifra);
	MOVLW      _sifra+0
	MOVWF      FARG_Ltrim_string+0
	CALL       _Ltrim+0
	MOVF       R0+0, 0
	MOVWF      _text+0
;LABMPS_ZADACA.c,108 :: 		Lcd_Out(2,1,text);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVF       R0+0, 0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;LABMPS_ZADACA.c,109 :: 		Delay_ms(30);
	MOVLW      78
	MOVWF      R12+0
	MOVLW      235
	MOVWF      R13+0
L_main36:
	DECFSZ     R13+0, 1
	GOTO       L_main36
	DECFSZ     R12+0, 1
	GOTO       L_main36
;LABMPS_ZADACA.c,99 :: 		for(i=0;i<brZborovi;i++){
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;LABMPS_ZADACA.c,110 :: 		}
	GOTO       L_main30
L_main31:
;LABMPS_ZADACA.c,118 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
