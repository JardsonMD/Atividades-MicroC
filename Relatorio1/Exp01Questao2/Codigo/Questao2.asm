
_main:

;Questao2.c,1 :: 		void main() {
;Questao2.c,4 :: 		TrisD = 0x00;
	CLRF        TRISD+0 
;Questao2.c,5 :: 		TrisB = 0x0F;
	MOVLW       15
	MOVWF       TRISB+0 
;Questao2.c,6 :: 		PortD = 0xFF;
	MOVLW       255
	MOVWF       PORTD+0 
;Questao2.c,7 :: 		PortB = 0xFF;
	MOVLW       255
	MOVWF       PORTB+0 
;Questao2.c,8 :: 		ADCON1 = 0x0F;
	MOVLW       15
	MOVWF       ADCON1+0 
;Questao2.c,9 :: 		CMCON = 7;
	MOVLW       7
	MOVWF       CMCON+0 
;Questao2.c,10 :: 		RBPU_bit = 0;
	BCF         RBPU_bit+0, BitPos(RBPU_bit+0) 
;Questao2.c,11 :: 		while(1){
L_main0:
;Questao2.c,12 :: 		x = ~PortB;
	COMF        PORTB+0, 0 
	MOVWF       R0 
;Questao2.c,13 :: 		y = -4.2 * x + 31;
	CALL        _byte2double+0, 0
	MOVLW       102
	MOVWF       R4 
	MOVLW       102
	MOVWF       R5 
	MOVLW       134
	MOVWF       R6 
	MOVLW       129
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       120
	MOVWF       R6 
	MOVLW       131
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
;Questao2.c,14 :: 		PortD = ~(int)y;
	CALL        _double2int+0, 0
	COMF        R0, 0 
	MOVWF       PORTD+0 
;Questao2.c,15 :: 		}
	GOTO        L_main0
;Questao2.c,17 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
