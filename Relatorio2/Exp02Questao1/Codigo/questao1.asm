
_main:

;questao1.c,4 :: 		void main(){
;questao1.c,5 :: 		unsigned short atual = 0, antiga = 0;
	CLRF        main_atual_L0+0 
	CLRF        main_antiga_L0+0 
;questao1.c,6 :: 		TrisB = 0x0F;
	MOVLW       15
	MOVWF       TRISB+0 
;questao1.c,7 :: 		TrisE = 0x00;
	CLRF        TRISE+0 
;questao1.c,8 :: 		TrisD = 0x00;
	CLRF        TRISD+0 
;questao1.c,9 :: 		PortB = 0xFF;
	MOVLW       255
	MOVWF       PORTB+0 
;questao1.c,10 :: 		PortD = 0xFF;
	MOVLW       255
	MOVWF       PORTD+0 
;questao1.c,11 :: 		CMCON = 7;
	MOVLW       7
	MOVWF       CMCON+0 
;questao1.c,12 :: 		ADCON1 = 0x0F;
	MOVLW       15
	MOVWF       ADCON1+0 
;questao1.c,13 :: 		RBPU_bit = 0;
	BCF         RBPU_bit+0, BitPos(RBPU_bit+0) 
;questao1.c,14 :: 		RE2_bit = 1;
	BSF         RE2_bit+0, BitPos(RE2_bit+0) 
;questao1.c,15 :: 		while(1){
L_main0:
;questao1.c,16 :: 		atual = ~PortB;
	COMF        PORTB+0, 0 
	MOVWF       R1 
	MOVF        R1, 0 
	MOVWF       main_atual_L0+0 
;questao1.c,17 :: 		if(atual != antiga){
	MOVF        R1, 0 
	XORWF       main_antiga_L0+0, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L_main2
;questao1.c,18 :: 		antiga = atual;
	MOVF        main_atual_L0+0, 0 
	MOVWF       main_antiga_L0+0 
;questao1.c,19 :: 		PortD = caracter[antiga];
	MOVLW       _caracter+0
	MOVWF       FSR0L+0 
	MOVLW       hi_addr(_caracter+0)
	MOVWF       FSR0L+1 
	MOVF        main_atual_L0+0, 0 
	ADDWF       FSR0L+0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0L+1, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       PORTD+0 
;questao1.c,20 :: 		delay_ms(50);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       69
	MOVWF       R12, 0
	MOVLW       169
	MOVWF       R13, 0
L_main3:
	DECFSZ      R13, 1, 1
	BRA         L_main3
	DECFSZ      R12, 1, 1
	BRA         L_main3
	DECFSZ      R11, 1, 1
	BRA         L_main3
	NOP
	NOP
;questao1.c,21 :: 		}
L_main2:
;questao1.c,22 :: 		}
	GOTO        L_main0
;questao1.c,23 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
