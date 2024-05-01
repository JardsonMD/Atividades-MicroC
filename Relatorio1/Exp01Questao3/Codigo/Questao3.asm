
_main:

;Questao3.c,3 :: 		void main() {
;Questao3.c,4 :: 		unsigned short x = 0, y = 0;
	CLRF        main_x_L0+0 
	CLRF        main_y_L0+0 
;Questao3.c,5 :: 		TrisD = 0x00;
	CLRF        TRISD+0 
;Questao3.c,6 :: 		TrisB = 0xFF;
	MOVLW       255
	MOVWF       TRISB+0 
;Questao3.c,7 :: 		PortD = 0xFF;
	MOVLW       255
	MOVWF       PORTD+0 
;Questao3.c,8 :: 		PortB = 0xFF;
	MOVLW       255
	MOVWF       PORTB+0 
;Questao3.c,9 :: 		ADCON1 = 0x0F;
	MOVLW       15
	MOVWF       ADCON1+0 
;Questao3.c,10 :: 		CMCON = 7;
	MOVLW       7
	MOVWF       CMCON+0 
;Questao3.c,11 :: 		RBPU_bit = 0;
	BCF         RBPU_bit+0, BitPos(RBPU_bit+0) 
;Questao3.c,12 :: 		while(1){
L_main0:
;Questao3.c,13 :: 		if(button1 == 0){
	BTFSC       RB0_bit+0, BitPos(RB0_bit+0) 
	GOTO        L_main2
;Questao3.c,14 :: 		x = 1;
	MOVLW       1
	MOVWF       main_x_L0+0 
;Questao3.c,15 :: 		y = 0;
	CLRF        main_y_L0+0 
;Questao3.c,16 :: 		}
L_main2:
;Questao3.c,17 :: 		if(button2 == 0){
	BTFSC       RB1_bit+0, BitPos(RB1_bit+0) 
	GOTO        L_main3
;Questao3.c,18 :: 		y = 1;
	MOVLW       1
	MOVWF       main_y_L0+0 
;Questao3.c,19 :: 		x = 0;
	CLRF        main_x_L0+0 
;Questao3.c,20 :: 		}
L_main3:
;Questao3.c,21 :: 		if(x == 1){
	MOVF        main_x_L0+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main4
;Questao3.c,22 :: 		RD1_bit = ~RD1_bit;
	BTG         RD1_bit+0, BitPos(RD1_bit+0) 
;Questao3.c,23 :: 		RD0_bit = ~RD0_bit;
	BTG         RD0_bit+0, BitPos(RD0_bit+0) 
;Questao3.c,24 :: 		delay_us(62500);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       150
	MOVWF       R12, 0
	MOVLW       213
	MOVWF       R13, 0
L_main5:
	DECFSZ      R13, 1, 1
	BRA         L_main5
	DECFSZ      R12, 1, 1
	BRA         L_main5
	DECFSZ      R11, 1, 1
	BRA         L_main5
;Questao3.c,25 :: 		RD1_bit = ~RD1_bit;
	BTG         RD1_bit+0, BitPos(RD1_bit+0) 
;Questao3.c,26 :: 		delay_us(62500);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       150
	MOVWF       R12, 0
	MOVLW       213
	MOVWF       R13, 0
L_main6:
	DECFSZ      R13, 1, 1
	BRA         L_main6
	DECFSZ      R12, 1, 1
	BRA         L_main6
	DECFSZ      R11, 1, 1
	BRA         L_main6
;Questao3.c,27 :: 		}
L_main4:
;Questao3.c,28 :: 		if(y == 1){
	MOVF        main_y_L0+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main7
;Questao3.c,29 :: 		RD0_bit = ~RD0_bit;
	BTG         RD0_bit+0, BitPos(RD0_bit+0) 
;Questao3.c,30 :: 		RD1_bit = ~RD1_bit;
	BTG         RD1_bit+0, BitPos(RD1_bit+0) 
;Questao3.c,31 :: 		delay_us(62500);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       150
	MOVWF       R12, 0
	MOVLW       213
	MOVWF       R13, 0
L_main8:
	DECFSZ      R13, 1, 1
	BRA         L_main8
	DECFSZ      R12, 1, 1
	BRA         L_main8
	DECFSZ      R11, 1, 1
	BRA         L_main8
;Questao3.c,32 :: 		RD0_bit = ~RD0_bit;
	BTG         RD0_bit+0, BitPos(RD0_bit+0) 
;Questao3.c,33 :: 		delay_us(62500);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       150
	MOVWF       R12, 0
	MOVLW       213
	MOVWF       R13, 0
L_main9:
	DECFSZ      R13, 1, 1
	BRA         L_main9
	DECFSZ      R12, 1, 1
	BRA         L_main9
	DECFSZ      R11, 1, 1
	BRA         L_main9
;Questao3.c,34 :: 		}
L_main7:
;Questao3.c,35 :: 		}
	GOTO        L_main0
;Questao3.c,36 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
