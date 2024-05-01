
_main:

;Questao3.c,9 :: 		void main() {
;Questao3.c,10 :: 		unsigned short x = 0;
	CLRF        main_x_L0+0 
;Questao3.c,11 :: 		TrisB = 0xFF;
	MOVLW       255
	MOVWF       TRISB+0 
;Questao3.c,12 :: 		TrisA = 0x00;
	CLRF        TRISA+0 
;Questao3.c,13 :: 		TrisE = 0x00;
	CLRF        TRISE+0 
;Questao3.c,14 :: 		TrisD = 0x00;
	CLRF        TRISD+0 
;Questao3.c,15 :: 		PortB = 0xFF;
	MOVLW       255
	MOVWF       PORTB+0 
;Questao3.c,16 :: 		PortD = 0x40;
	MOVLW       64
	MOVWF       PORTD+0 
;Questao3.c,17 :: 		PortA = 0xFF;
	MOVLW       255
	MOVWF       PORTA+0 
;Questao3.c,18 :: 		PortE = 0xFF;
	MOVLW       255
	MOVWF       PORTE+0 
;Questao3.c,19 :: 		CMCON = 7;
	MOVLW       7
	MOVWF       CMCON+0 
;Questao3.c,20 :: 		ADCON1 = 0x0F;
	MOVLW       15
	MOVWF       ADCON1+0 
;Questao3.c,21 :: 		RBPU_bit = 0;
	BCF         RBPU_bit+0, BitPos(RBPU_bit+0) 
;Questao3.c,23 :: 		while(1){
L_main0:
;Questao3.c,24 :: 		if(BOT1 == 0){
	BTFSC       INT0_bit+0, BitPos(INT0_bit+0) 
	GOTO        L_main2
;Questao3.c,25 :: 		x = 1;
	MOVLW       1
	MOVWF       main_x_L0+0 
;Questao3.c,26 :: 		}
L_main2:
;Questao3.c,27 :: 		if(BOT2 == 0){
	BTFSC       INT1_bit+0, BitPos(INT1_bit+0) 
	GOTO        L_main3
;Questao3.c,28 :: 		x = 2;
	MOVLW       2
	MOVWF       main_x_L0+0 
;Questao3.c,29 :: 		}
L_main3:
;Questao3.c,30 :: 		if(x == 1){
	MOVF        main_x_L0+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main4
;Questao3.c,31 :: 		rot1();
	CALL        _rot1+0, 0
;Questao3.c,32 :: 		}
L_main4:
;Questao3.c,33 :: 		if(x == 2){
	MOVF        main_x_L0+0, 0 
	XORLW       2
	BTFSS       STATUS+0, 2 
	GOTO        L_main5
;Questao3.c,34 :: 		rot2();
	CALL        _rot2+0, 0
;Questao3.c,35 :: 		}
L_main5:
;Questao3.c,36 :: 		}
	GOTO        L_main0
;Questao3.c,37 :: 		}
L_end_main:
	GOTO        $+0
; end of _main

_rot1:

;Questao3.c,39 :: 		void rot1(){
;Questao3.c,40 :: 		PortD = faca[0];
	MOVF        _faca+0, 0 
	MOVWF       PORTD+0 
;Questao3.c,41 :: 		RA5_bit = 1;
	BSF         RA5_bit+0, BitPos(RA5_bit+0) 
;Questao3.c,42 :: 		RA2_bit = 0;
	BCF         RA2_bit+0, BitPos(RA2_bit+0) 
;Questao3.c,43 :: 		RE0_bit = 0;
	BCF         RE0_bit+0, BitPos(RE0_bit+0) 
;Questao3.c,44 :: 		RE2_bit = 0;
	BCF         RE2_bit+0, BitPos(RE2_bit+0) 
;Questao3.c,45 :: 		delay_ms(10);
	MOVLW       65
	MOVWF       R12, 0
	MOVLW       238
	MOVWF       R13, 0
L_rot16:
	DECFSZ      R13, 1, 1
	BRA         L_rot16
	DECFSZ      R12, 1, 1
	BRA         L_rot16
	NOP
;Questao3.c,46 :: 		PortD = faca[1];
	MOVF        _faca+1, 0 
	MOVWF       PORTD+0 
;Questao3.c,47 :: 		RA5_bit = 0;
	BCF         RA5_bit+0, BitPos(RA5_bit+0) 
;Questao3.c,48 :: 		RA2_bit = 1;
	BSF         RA2_bit+0, BitPos(RA2_bit+0) 
;Questao3.c,49 :: 		RE0_bit = 0;
	BCF         RE0_bit+0, BitPos(RE0_bit+0) 
;Questao3.c,50 :: 		RE2_bit = 0;
	BCF         RE2_bit+0, BitPos(RE2_bit+0) 
;Questao3.c,51 :: 		delay_ms(10);
	MOVLW       65
	MOVWF       R12, 0
	MOVLW       238
	MOVWF       R13, 0
L_rot17:
	DECFSZ      R13, 1, 1
	BRA         L_rot17
	DECFSZ      R12, 1, 1
	BRA         L_rot17
	NOP
;Questao3.c,52 :: 		PortD = faca[2];
	MOVF        _faca+2, 0 
	MOVWF       PORTD+0 
;Questao3.c,53 :: 		RA5_bit = 0;
	BCF         RA5_bit+0, BitPos(RA5_bit+0) 
;Questao3.c,54 :: 		RA2_bit = 0;
	BCF         RA2_bit+0, BitPos(RA2_bit+0) 
;Questao3.c,55 :: 		RE0_bit = 1;
	BSF         RE0_bit+0, BitPos(RE0_bit+0) 
;Questao3.c,56 :: 		RE2_bit = 0;
	BCF         RE2_bit+0, BitPos(RE2_bit+0) 
;Questao3.c,57 :: 		delay_ms(10);
	MOVLW       65
	MOVWF       R12, 0
	MOVLW       238
	MOVWF       R13, 0
L_rot18:
	DECFSZ      R13, 1, 1
	BRA         L_rot18
	DECFSZ      R12, 1, 1
	BRA         L_rot18
	NOP
;Questao3.c,58 :: 		PortD = faca[3];
	MOVF        _faca+3, 0 
	MOVWF       PORTD+0 
;Questao3.c,59 :: 		RA5_bit = 0;
	BCF         RA5_bit+0, BitPos(RA5_bit+0) 
;Questao3.c,60 :: 		RA2_bit = 0;
	BCF         RA2_bit+0, BitPos(RA2_bit+0) 
;Questao3.c,61 :: 		RE0_bit = 0;
	BCF         RE0_bit+0, BitPos(RE0_bit+0) 
;Questao3.c,62 :: 		RE2_bit = 1;
	BSF         RE2_bit+0, BitPos(RE2_bit+0) 
;Questao3.c,63 :: 		delay_ms(10);
	MOVLW       65
	MOVWF       R12, 0
	MOVLW       238
	MOVWF       R13, 0
L_rot19:
	DECFSZ      R13, 1, 1
	BRA         L_rot19
	DECFSZ      R12, 1, 1
	BRA         L_rot19
	NOP
;Questao3.c,64 :: 		}
L_end_rot1:
	RETURN      0
; end of _rot1

_rot2:

;Questao3.c,66 :: 		void rot2(){
;Questao3.c,67 :: 		PortD = comp[0];
	MOVF        _comp+0, 0 
	MOVWF       PORTD+0 
;Questao3.c,68 :: 		RA5_bit = 1;
	BSF         RA5_bit+0, BitPos(RA5_bit+0) 
;Questao3.c,69 :: 		RA2_bit = 0;
	BCF         RA2_bit+0, BitPos(RA2_bit+0) 
;Questao3.c,70 :: 		RE0_bit = 0;
	BCF         RE0_bit+0, BitPos(RE0_bit+0) 
;Questao3.c,71 :: 		RE2_bit = 0;
	BCF         RE2_bit+0, BitPos(RE2_bit+0) 
;Questao3.c,72 :: 		delay_ms(10);
	MOVLW       65
	MOVWF       R12, 0
	MOVLW       238
	MOVWF       R13, 0
L_rot210:
	DECFSZ      R13, 1, 1
	BRA         L_rot210
	DECFSZ      R12, 1, 1
	BRA         L_rot210
	NOP
;Questao3.c,73 :: 		PortD = comp[1];
	MOVF        _comp+1, 0 
	MOVWF       PORTD+0 
;Questao3.c,74 :: 		RA5_bit = 0;
	BCF         RA5_bit+0, BitPos(RA5_bit+0) 
;Questao3.c,75 :: 		RA2_bit = 1;
	BSF         RA2_bit+0, BitPos(RA2_bit+0) 
;Questao3.c,76 :: 		RE0_bit = 0;
	BCF         RE0_bit+0, BitPos(RE0_bit+0) 
;Questao3.c,77 :: 		RE2_bit = 0;
	BCF         RE2_bit+0, BitPos(RE2_bit+0) 
;Questao3.c,78 :: 		delay_ms(10);
	MOVLW       65
	MOVWF       R12, 0
	MOVLW       238
	MOVWF       R13, 0
L_rot211:
	DECFSZ      R13, 1, 1
	BRA         L_rot211
	DECFSZ      R12, 1, 1
	BRA         L_rot211
	NOP
;Questao3.c,79 :: 		PortD = comp[2];
	MOVF        _comp+2, 0 
	MOVWF       PORTD+0 
;Questao3.c,80 :: 		RA5_bit = 0;
	BCF         RA5_bit+0, BitPos(RA5_bit+0) 
;Questao3.c,81 :: 		RA2_bit = 0;
	BCF         RA2_bit+0, BitPos(RA2_bit+0) 
;Questao3.c,82 :: 		RE0_bit = 1;
	BSF         RE0_bit+0, BitPos(RE0_bit+0) 
;Questao3.c,83 :: 		RE2_bit = 0;
	BCF         RE2_bit+0, BitPos(RE2_bit+0) 
;Questao3.c,84 :: 		delay_ms(10);
	MOVLW       65
	MOVWF       R12, 0
	MOVLW       238
	MOVWF       R13, 0
L_rot212:
	DECFSZ      R13, 1, 1
	BRA         L_rot212
	DECFSZ      R12, 1, 1
	BRA         L_rot212
	NOP
;Questao3.c,85 :: 		PortD = comp[3];
	MOVF        _comp+3, 0 
	MOVWF       PORTD+0 
;Questao3.c,86 :: 		RA5_bit = 0;
	BCF         RA5_bit+0, BitPos(RA5_bit+0) 
;Questao3.c,87 :: 		RA2_bit = 0;
	BCF         RA2_bit+0, BitPos(RA2_bit+0) 
;Questao3.c,88 :: 		RE0_bit = 0;
	BCF         RE0_bit+0, BitPos(RE0_bit+0) 
;Questao3.c,89 :: 		RE2_bit = 1;
	BSF         RE2_bit+0, BitPos(RE2_bit+0) 
;Questao3.c,90 :: 		delay_ms(10);
	MOVLW       65
	MOVWF       R12, 0
	MOVLW       238
	MOVWF       R13, 0
L_rot213:
	DECFSZ      R13, 1, 1
	BRA         L_rot213
	DECFSZ      R12, 1, 1
	BRA         L_rot213
	NOP
;Questao3.c,91 :: 		}
L_end_rot2:
	RETURN      0
; end of _rot2
