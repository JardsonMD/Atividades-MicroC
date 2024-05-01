
_interrupt:

;questao3.c,1 :: 		void interrupt(){
;questao3.c,2 :: 		if(INT1IF_bit){
	BTFSS       INT1IF_bit+0, BitPos(INT1IF_bit+0) 
	GOTO        L_interrupt0
;questao3.c,3 :: 		unsigned short i = 0;
	CLRF        interrupt_i_L1+0 
;questao3.c,4 :: 		INT1IF_bit = 0;
	BCF         INT1IF_bit+0, BitPos(INT1IF_bit+0) 
;questao3.c,5 :: 		TrisD = 0xF0;
	MOVLW       240
	MOVWF       TRISD+0 
;questao3.c,6 :: 		while(i < 20){
L_interrupt1:
	MOVLW       20
	SUBWF       interrupt_i_L1+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_interrupt2
;questao3.c,7 :: 		PortD = ~PortD;
	COMF        PORTD+0, 1 
;questao3.c,8 :: 		delay_ms(250);
	MOVLW       7
	MOVWF       R11, 0
	MOVLW       88
	MOVWF       R12, 0
	MOVLW       89
	MOVWF       R13, 0
L_interrupt3:
	DECFSZ      R13, 1, 1
	BRA         L_interrupt3
	DECFSZ      R12, 1, 1
	BRA         L_interrupt3
	DECFSZ      R11, 1, 1
	BRA         L_interrupt3
	NOP
	NOP
;questao3.c,9 :: 		i++;
	INCF        interrupt_i_L1+0, 1 
;questao3.c,10 :: 		}
	GOTO        L_interrupt1
L_interrupt2:
;questao3.c,11 :: 		TrisD = 0x00;
	CLRF        TRISD+0 
;questao3.c,12 :: 		PortD = 0xFF;
	MOVLW       255
	MOVWF       PORTD+0 
;questao3.c,13 :: 		}
L_interrupt0:
;questao3.c,14 :: 		if(INT2IF_bit){
	BTFSS       INT2IF_bit+0, BitPos(INT2IF_bit+0) 
	GOTO        L_interrupt4
;questao3.c,15 :: 		unsigned short i = 0;
	CLRF        interrupt_i_L1_L1+0 
;questao3.c,16 :: 		INT2IF_bit = 0;
	BCF         INT2IF_bit+0, BitPos(INT2IF_bit+0) 
;questao3.c,17 :: 		TrisD = 0x0F;
	MOVLW       15
	MOVWF       TRISD+0 
;questao3.c,18 :: 		while(i < 20){
L_interrupt5:
	MOVLW       20
	SUBWF       interrupt_i_L1_L1+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_interrupt6
;questao3.c,19 :: 		PortD = ~PortD;
	COMF        PORTD+0, 1 
;questao3.c,20 :: 		delay_ms(250);
	MOVLW       7
	MOVWF       R11, 0
	MOVLW       88
	MOVWF       R12, 0
	MOVLW       89
	MOVWF       R13, 0
L_interrupt7:
	DECFSZ      R13, 1, 1
	BRA         L_interrupt7
	DECFSZ      R12, 1, 1
	BRA         L_interrupt7
	DECFSZ      R11, 1, 1
	BRA         L_interrupt7
	NOP
	NOP
;questao3.c,21 :: 		i++;
	INCF        interrupt_i_L1_L1+0, 1 
;questao3.c,22 :: 		}
	GOTO        L_interrupt5
L_interrupt6:
;questao3.c,23 :: 		TrisD = 0x00;
	CLRF        TRISD+0 
;questao3.c,24 :: 		PortD = 0xFF;
	MOVLW       255
	MOVWF       PORTD+0 
;questao3.c,25 :: 		}
L_interrupt4:
;questao3.c,26 :: 		}
L_end_interrupt:
L__interrupt12:
	RETFIE      1
; end of _interrupt

_main:

;questao3.c,27 :: 		void main() {
;questao3.c,28 :: 		TrisB = 0xFF;
	MOVLW       255
	MOVWF       TRISB+0 
;questao3.c,29 :: 		TrisD = 0x00;
	CLRF        TRISD+0 
;questao3.c,30 :: 		PortB = 0xFF;
	MOVLW       255
	MOVWF       PORTB+0 
;questao3.c,31 :: 		PortD = 0xFF;
	MOVLW       255
	MOVWF       PORTD+0 
;questao3.c,32 :: 		CMCON = 7;
	MOVLW       7
	MOVWF       CMCON+0 
;questao3.c,33 :: 		GIE_bit = 1;
	BSF         GIE_bit+0, BitPos(GIE_bit+0) 
;questao3.c,34 :: 		PEIE_bit = 1;
	BSF         PEIE_bit+0, BitPos(PEIE_bit+0) 
;questao3.c,35 :: 		ADCON1 = 0x0F;
	MOVLW       15
	MOVWF       ADCON1+0 
;questao3.c,37 :: 		INT1IE_bit = 1;
	BSF         INT1IE_bit+0, BitPos(INT1IE_bit+0) 
;questao3.c,38 :: 		INT2IE_bit = 1;
	BSF         INT2IE_bit+0, BitPos(INT2IE_bit+0) 
;questao3.c,39 :: 		INTEDG1_bit = 1;
	BSF         INTEDG1_bit+0, BitPos(INTEDG1_bit+0) 
;questao3.c,40 :: 		INTEDG2_bit = 1;
	BSF         INTEDG2_bit+0, BitPos(INTEDG2_bit+0) 
;questao3.c,41 :: 		IPEN_bit = 0;
	BCF         IPEN_bit+0, BitPos(IPEN_bit+0) 
;questao3.c,42 :: 		while(1){
L_main8:
;questao3.c,43 :: 		PortD = ~PortD;
	COMF        PORTD+0, 1 
;questao3.c,44 :: 		delay_ms(250);
	MOVLW       7
	MOVWF       R11, 0
	MOVLW       88
	MOVWF       R12, 0
	MOVLW       89
	MOVWF       R13, 0
L_main10:
	DECFSZ      R13, 1, 1
	BRA         L_main10
	DECFSZ      R12, 1, 1
	BRA         L_main10
	DECFSZ      R11, 1, 1
	BRA         L_main10
	NOP
	NOP
;questao3.c,45 :: 		}
	GOTO        L_main8
;questao3.c,46 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
