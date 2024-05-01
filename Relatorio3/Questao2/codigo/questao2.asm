
_interrupt:

;questao2.c,1 :: 		void interrupt(){
;questao2.c,2 :: 		if(INT1IF_bit){
	BTFSS       INT1IF_bit+0, BitPos(INT1IF_bit+0) 
	GOTO        L_interrupt0
;questao2.c,3 :: 		unsigned short i = 0;
	CLRF        interrupt_i_L1+0 
;questao2.c,4 :: 		INT1IF_bit = 0;
	BCF         INT1IF_bit+0, BitPos(INT1IF_bit+0) 
;questao2.c,5 :: 		TrisD = 0xF0;
	MOVLW       240
	MOVWF       TRISD+0 
;questao2.c,6 :: 		while(i < 20){
L_interrupt1:
	MOVLW       20
	SUBWF       interrupt_i_L1+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_interrupt2
;questao2.c,7 :: 		PortD = ~PortD;
	COMF        PORTD+0, 1 
;questao2.c,8 :: 		delay_ms(250);
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
;questao2.c,9 :: 		i++;
	INCF        interrupt_i_L1+0, 1 
;questao2.c,10 :: 		}
	GOTO        L_interrupt1
L_interrupt2:
;questao2.c,11 :: 		TrisD = 0x00;
	CLRF        TRISD+0 
;questao2.c,12 :: 		PortD = 0xFF;
	MOVLW       255
	MOVWF       PORTD+0 
;questao2.c,13 :: 		}
L_interrupt0:
;questao2.c,14 :: 		}
L_end_interrupt:
L__interrupt12:
	RETFIE      1
; end of _interrupt

_interrupt_low:
	MOVWF       ___Low_saveWREG+0 
	MOVF        STATUS+0, 0 
	MOVWF       ___Low_saveSTATUS+0 
	MOVF        BSR+0, 0 
	MOVWF       ___Low_saveBSR+0 

;questao2.c,15 :: 		void interrupt_low(){
;questao2.c,16 :: 		if(INT2IF_bit){
	BTFSS       INT2IF_bit+0, BitPos(INT2IF_bit+0) 
	GOTO        L_interrupt_low4
;questao2.c,17 :: 		unsigned short i = 0;
	CLRF        interrupt_low_i_L1+0 
;questao2.c,18 :: 		INT2IF_bit = 0;
	BCF         INT2IF_bit+0, BitPos(INT2IF_bit+0) 
;questao2.c,19 :: 		TrisD = 0x0F;
	MOVLW       15
	MOVWF       TRISD+0 
;questao2.c,20 :: 		while(i < 20){
L_interrupt_low5:
	MOVLW       20
	SUBWF       interrupt_low_i_L1+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_interrupt_low6
;questao2.c,21 :: 		PortD = ~PortD;
	COMF        PORTD+0, 1 
;questao2.c,22 :: 		delay_ms(250);
	MOVLW       7
	MOVWF       R11, 0
	MOVLW       88
	MOVWF       R12, 0
	MOVLW       89
	MOVWF       R13, 0
L_interrupt_low7:
	DECFSZ      R13, 1, 1
	BRA         L_interrupt_low7
	DECFSZ      R12, 1, 1
	BRA         L_interrupt_low7
	DECFSZ      R11, 1, 1
	BRA         L_interrupt_low7
	NOP
	NOP
;questao2.c,23 :: 		i++;
	INCF        interrupt_low_i_L1+0, 1 
;questao2.c,24 :: 		}
	GOTO        L_interrupt_low5
L_interrupt_low6:
;questao2.c,25 :: 		TrisD = 0x00;
	CLRF        TRISD+0 
;questao2.c,26 :: 		PortD = 0xFF;
	MOVLW       255
	MOVWF       PORTD+0 
;questao2.c,27 :: 		}
L_interrupt_low4:
;questao2.c,28 :: 		}
L_end_interrupt_low:
L__interrupt_low14:
	MOVF        ___Low_saveBSR+0, 0 
	MOVWF       BSR+0 
	MOVF        ___Low_saveSTATUS+0, 0 
	MOVWF       STATUS+0 
	SWAPF       ___Low_saveWREG+0, 1 
	SWAPF       ___Low_saveWREG+0, 0 
	RETFIE      0
; end of _interrupt_low

_main:

;questao2.c,31 :: 		void main() {
;questao2.c,32 :: 		unsigned short x = 0, y = 0;
;questao2.c,33 :: 		TrisB = 0xFF;
	MOVLW       255
	MOVWF       TRISB+0 
;questao2.c,34 :: 		TrisD = 0x00;
	CLRF        TRISD+0 
;questao2.c,35 :: 		PortB = 0xFF;
	MOVLW       255
	MOVWF       PORTB+0 
;questao2.c,36 :: 		PortD = 0xFF;
	MOVLW       255
	MOVWF       PORTD+0 
;questao2.c,37 :: 		CMCON = 7;
	MOVLW       7
	MOVWF       CMCON+0 
;questao2.c,39 :: 		GIE_bit = 1;
	BSF         GIE_bit+0, BitPos(GIE_bit+0) 
;questao2.c,40 :: 		PEIE_bit = 1;
	BSF         PEIE_bit+0, BitPos(PEIE_bit+0) 
;questao2.c,41 :: 		ADCON1 = 0x0F;
	MOVLW       15
	MOVWF       ADCON1+0 
;questao2.c,42 :: 		IPEN_bit = 1;
	BSF         IPEN_bit+0, BitPos(IPEN_bit+0) 
;questao2.c,44 :: 		INT1IE_bit = 1;
	BSF         INT1IE_bit+0, BitPos(INT1IE_bit+0) 
;questao2.c,45 :: 		INT2IE_bit = 1;
	BSF         INT2IE_bit+0, BitPos(INT2IE_bit+0) 
;questao2.c,46 :: 		INT1IP_bit = 1;
	BSF         INT1IP_bit+0, BitPos(INT1IP_bit+0) 
;questao2.c,47 :: 		INT2IP_bit = 0;
	BCF         INT2IP_bit+0, BitPos(INT2IP_bit+0) 
;questao2.c,48 :: 		INTEDG1_bit = 1;
	BSF         INTEDG1_bit+0, BitPos(INTEDG1_bit+0) 
;questao2.c,49 :: 		INTEDG2_bit = 1;
	BSF         INTEDG2_bit+0, BitPos(INTEDG2_bit+0) 
;questao2.c,51 :: 		while(1){
L_main8:
;questao2.c,52 :: 		PortD = ~PortD;
	COMF        PORTD+0, 1 
;questao2.c,53 :: 		delay_ms(250);
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
;questao2.c,54 :: 		}
	GOTO        L_main8
;questao2.c,57 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
