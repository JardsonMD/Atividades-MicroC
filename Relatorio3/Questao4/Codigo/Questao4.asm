
_interrupt:

;Questao4.c,3 :: 		void interrupt(){
;Questao4.c,4 :: 		if(TMR0IF_bit == 1){
	BTFSS       TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
	GOTO        L_interrupt0
;Questao4.c,5 :: 		TMR0IF_bit = 0;
	BCF         TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
;Questao4.c,6 :: 		cont2Hz++;
	INCF        _cont2Hz+0, 1 
;Questao4.c,7 :: 		cont10Hz++;
	INCF        _cont10Hz+0, 1 
;Questao4.c,8 :: 		if(cont2Hz == 250){
	MOVF        _cont2Hz+0, 0 
	XORLW       250
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt1
;Questao4.c,9 :: 		cont2Hz = 0;
	CLRF        _cont2Hz+0 
;Questao4.c,10 :: 		RD0_bit = !RD0_bit;
	BTG         RD0_bit+0, BitPos(RD0_bit+0) 
;Questao4.c,11 :: 		}
L_interrupt1:
;Questao4.c,12 :: 		if(cont10Hz == 50){
	MOVF        _cont10Hz+0, 0 
	XORLW       50
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt2
;Questao4.c,13 :: 		cont10Hz = 0;
	CLRF        _cont10Hz+0 
;Questao4.c,14 :: 		RD1_bit = !RD1_bit;
	BTG         RD1_bit+0, BitPos(RD1_bit+0) 
;Questao4.c,15 :: 		}
L_interrupt2:
;Questao4.c,16 :: 		TMR0H = 0xF6;
	MOVLW       246
	MOVWF       TMR0H+0 
;Questao4.c,17 :: 		TMR0L = 0x3C;
	MOVLW       60
	MOVWF       TMR0L+0 
;Questao4.c,18 :: 		}
L_interrupt0:
;Questao4.c,19 :: 		}
L_end_interrupt:
L__interrupt6:
	RETFIE      1
; end of _interrupt

_main:

;Questao4.c,21 :: 		void main() {
;Questao4.c,22 :: 		TrisB = 0xFF;
	MOVLW       255
	MOVWF       TRISB+0 
;Questao4.c,23 :: 		TrisD = 0x00;
	CLRF        TRISD+0 
;Questao4.c,24 :: 		PortB = 0xFF;
	MOVLW       255
	MOVWF       PORTB+0 
;Questao4.c,25 :: 		PortD = 0xFF;
	MOVLW       255
	MOVWF       PORTD+0 
;Questao4.c,26 :: 		ADCON1 = 0x0F;
	MOVLW       15
	MOVWF       ADCON1+0 
;Questao4.c,27 :: 		CMCON = 7;
	MOVLW       7
	MOVWF       CMCON+0 
;Questao4.c,28 :: 		RBPU_bit = 0;
	BCF         RBPU_bit+0, BitPos(RBPU_bit+0) 
;Questao4.c,29 :: 		GIE_bit = 1;
	BSF         GIE_bit+0, BitPos(GIE_bit+0) 
;Questao4.c,30 :: 		PEIE_bit = 1;
	BSF         PEIE_bit+0, BitPos(PEIE_bit+0) 
;Questao4.c,31 :: 		TMR0IE_bit = 1;
	BSF         TMR0IE_bit+0, BitPos(TMR0IE_bit+0) 
;Questao4.c,32 :: 		T0CON = 0x80;
	MOVLW       128
	MOVWF       T0CON+0 
;Questao4.c,33 :: 		TMR0H = 0xF6;
	MOVLW       246
	MOVWF       TMR0H+0 
;Questao4.c,34 :: 		TMR0L = 0x3C;
	MOVLW       60
	MOVWF       TMR0L+0 
;Questao4.c,35 :: 		while(1);
L_main3:
	GOTO        L_main3
;Questao4.c,37 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
