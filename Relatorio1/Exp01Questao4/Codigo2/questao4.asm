
_main:

;questao4.c,1 :: 		void main() {
;questao4.c,3 :: 		int y = 0;
	CLRF        main_y_L0+0 
	CLRF        main_y_L0+1 
;questao4.c,4 :: 		TrisD = 0x00;
	CLRF        TRISD+0 
;questao4.c,5 :: 		PortD = 0xFF;
	MOVLW       255
	MOVWF       PORTD+0 
;questao4.c,6 :: 		ADCON1 = 0x0F;
	MOVLW       15
	MOVWF       ADCON1+0 
;questao4.c,7 :: 		CMCON = 7;
	MOVLW       7
	MOVWF       CMCON+0 
;questao4.c,8 :: 		RBPU_bit = 0;
	BCF         RBPU_bit+0, BitPos(RBPU_bit+0) 
;questao4.c,9 :: 		x = ~PortD;
	COMF        PORTD+0, 0 
	MOVWF       R2 
;questao4.c,10 :: 		while(1){
L_main0:
;questao4.c,11 :: 		if(PortD == 0x00){
	MOVF        PORTD+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_main2
;questao4.c,12 :: 		y = 1;
	MOVLW       1
	MOVWF       main_y_L0+0 
	MOVLW       0
	MOVWF       main_y_L0+1 
;questao4.c,13 :: 		}else if(PortD == 0xFF){
	GOTO        L_main3
L_main2:
	MOVF        PORTD+0, 0 
	XORLW       255
	BTFSS       STATUS+0, 2 
	GOTO        L_main4
;questao4.c,14 :: 		y = 0;
	CLRF        main_y_L0+0 
	CLRF        main_y_L0+1 
;questao4.c,15 :: 		}
L_main4:
L_main3:
;questao4.c,16 :: 		if(y == 0){
	MOVLW       0
	XORWF       main_y_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main12
	MOVLW       0
	XORWF       main_y_L0+0, 0 
L__main12:
	BTFSS       STATUS+0, 2 
	GOTO        L_main5
;questao4.c,17 :: 		if(PortD == 0xFF){
	MOVF        PORTD+0, 0 
	XORLW       255
	BTFSS       STATUS+0, 2 
	GOTO        L_main6
;questao4.c,18 :: 		x = 0x00;
	CLRF        R2 
;questao4.c,19 :: 		}
L_main6:
;questao4.c,20 :: 		delay_ms(300);
	MOVLW       8
	MOVWF       R11, 0
	MOVLW       157
	MOVWF       R12, 0
	MOVLW       5
	MOVWF       R13, 0
L_main7:
	DECFSZ      R13, 1, 1
	BRA         L_main7
	DECFSZ      R12, 1, 1
	BRA         L_main7
	DECFSZ      R11, 1, 1
	BRA         L_main7
	NOP
	NOP
;questao4.c,21 :: 		x += 0x80;
	MOVLW       128
	ADDWF       R2, 0 
	MOVWF       R1 
	MOVF        R1, 0 
	MOVWF       R2 
;questao4.c,22 :: 		PortD = ~x;
	COMF        R1, 0 
	MOVWF       PORTD+0 
;questao4.c,23 :: 		x = x >> 1;
	MOVF        R1, 0 
	MOVWF       R2 
	RRCF        R2, 1 
	BCF         R2, 7 
;questao4.c,24 :: 		}
L_main5:
;questao4.c,25 :: 		if(y == 1){
	MOVLW       0
	XORWF       main_y_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main13
	MOVLW       1
	XORWF       main_y_L0+0, 0 
L__main13:
	BTFSS       STATUS+0, 2 
	GOTO        L_main8
;questao4.c,26 :: 		delay_ms(300);
	MOVLW       8
	MOVWF       R11, 0
	MOVLW       157
	MOVWF       R12, 0
	MOVLW       5
	MOVWF       R13, 0
L_main9:
	DECFSZ      R13, 1, 1
	BRA         L_main9
	DECFSZ      R12, 1, 1
	BRA         L_main9
	DECFSZ      R11, 1, 1
	BRA         L_main9
	NOP
	NOP
;questao4.c,27 :: 		if(PortD == 0x00){
	MOVF        PORTD+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_main10
;questao4.c,28 :: 		x = 0x00;
	CLRF        R2 
;questao4.c,29 :: 		}
L_main10:
;questao4.c,30 :: 		x += 1;
	INCF        R2, 1 
;questao4.c,31 :: 		PortD = x;
	MOVF        R2, 0 
	MOVWF       PORTD+0 
;questao4.c,32 :: 		x = x << 1;
	RLCF        R2, 1 
	BCF         R2, 0 
;questao4.c,33 :: 		y = 1;
	MOVLW       1
	MOVWF       main_y_L0+0 
	MOVLW       0
	MOVWF       main_y_L0+1 
;questao4.c,34 :: 		}
L_main8:
;questao4.c,36 :: 		}
	GOTO        L_main0
;questao4.c,37 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
