
_main:

;Exp02Quest2.c,4 :: 		void main() {
;Exp02Quest2.c,5 :: 		unsigned short x = 0, i = 0;
	CLRF        main_x_L0+0 
	CLRF        main_i_L0+0 
;Exp02Quest2.c,6 :: 		TrisB = 0xFF;
	MOVLW       255
	MOVWF       TRISB+0 
;Exp02Quest2.c,7 :: 		TrisA = 0x00;
	CLRF        TRISA+0 
;Exp02Quest2.c,8 :: 		TrisD = 0x00;
	CLRF        TRISD+0 
;Exp02Quest2.c,9 :: 		PortB = 0xFF;
	MOVLW       255
	MOVWF       PORTB+0 
;Exp02Quest2.c,10 :: 		PortB = 0x00;
	CLRF        PORTB+0 
;Exp02Quest2.c,11 :: 		CMCON = 7;
	MOVLW       7
	MOVWF       CMCON+0 
;Exp02Quest2.c,12 :: 		ADCON1 = 0x0F;
	MOVLW       15
	MOVWF       ADCON1+0 
;Exp02Quest2.c,13 :: 		RBPU_bit = 0;
	BCF         RBPU_bit+0, BitPos(RBPU_bit+0) 
;Exp02Quest2.c,14 :: 		RA5_bit = 1;
	BSF         RA5_bit+0, BitPos(RA5_bit+0) 
;Exp02Quest2.c,16 :: 		while(1){
L_main0:
;Exp02Quest2.c,17 :: 		if(BOT1 == 0){
	BTFSC       INT0_bit+0, BitPos(INT0_bit+0) 
	GOTO        L_main2
;Exp02Quest2.c,18 :: 		x = 1;
	MOVLW       1
	MOVWF       main_x_L0+0 
;Exp02Quest2.c,19 :: 		}
L_main2:
;Exp02Quest2.c,20 :: 		if(BOT2 == 0){
	BTFSC       INT1_bit+0, BitPos(INT1_bit+0) 
	GOTO        L_main3
;Exp02Quest2.c,21 :: 		x = 0;
	CLRF        main_x_L0+0 
;Exp02Quest2.c,22 :: 		}
L_main3:
;Exp02Quest2.c,23 :: 		if(x == 1){
	MOVF        main_x_L0+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main4
;Exp02Quest2.c,24 :: 		if(i > 10){
	MOVF        main_i_L0+0, 0 
	SUBLW       10
	BTFSC       STATUS+0, 0 
	GOTO        L_main5
;Exp02Quest2.c,25 :: 		RA5_bit = 0;
	BCF         RA5_bit+0, BitPos(RA5_bit+0) 
;Exp02Quest2.c,26 :: 		delay_ms(2000);
	MOVLW       51
	MOVWF       R11, 0
	MOVLW       187
	MOVWF       R12, 0
	MOVLW       223
	MOVWF       R13, 0
L_main6:
	DECFSZ      R13, 1, 1
	BRA         L_main6
	DECFSZ      R12, 1, 1
	BRA         L_main6
	DECFSZ      R11, 1, 1
	BRA         L_main6
	NOP
	NOP
;Exp02Quest2.c,27 :: 		i = 0;
	CLRF        main_i_L0+0 
;Exp02Quest2.c,28 :: 		RA5_bit = 1;
	BSF         RA5_bit+0, BitPos(RA5_bit+0) 
;Exp02Quest2.c,29 :: 		}
L_main5:
;Exp02Quest2.c,30 :: 		PortD = display[i];
	MOVLW       _display+0
	MOVWF       FSR0L+0 
	MOVLW       hi_addr(_display+0)
	MOVWF       FSR0L+1 
	MOVF        main_i_L0+0, 0 
	ADDWF       FSR0L+0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0L+1, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       PORTD+0 
;Exp02Quest2.c,31 :: 		delay_ms(500);
	MOVLW       13
	MOVWF       R11, 0
	MOVLW       175
	MOVWF       R12, 0
	MOVLW       182
	MOVWF       R13, 0
L_main7:
	DECFSZ      R13, 1, 1
	BRA         L_main7
	DECFSZ      R12, 1, 1
	BRA         L_main7
	DECFSZ      R11, 1, 1
	BRA         L_main7
	NOP
;Exp02Quest2.c,32 :: 		i++;
	INCF        main_i_L0+0, 1 
;Exp02Quest2.c,33 :: 		}
L_main4:
;Exp02Quest2.c,35 :: 		}
	GOTO        L_main0
;Exp02Quest2.c,38 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
