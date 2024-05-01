
_main:

;problema2.c,6 :: 		void main() {
;problema2.c,7 :: 		unsigned short x = 0, i = 4, cont = 0;
	CLRF        main_x_L0+0 
	MOVLW       4
	MOVWF       main_i_L0+0 
	CLRF        main_cont_L0+0 
;problema2.c,8 :: 		TrisB = 0xFF;
	MOVLW       255
	MOVWF       TRISB+0 
;problema2.c,9 :: 		TrisA = 0x00;
	CLRF        TRISA+0 
;problema2.c,10 :: 		TrisE = 0x00;
	CLRF        TRISE+0 
;problema2.c,11 :: 		TrisD = 0x00;
	CLRF        TRISD+0 
;problema2.c,12 :: 		PortB = 0xFF;
	MOVLW       255
	MOVWF       PORTB+0 
;problema2.c,13 :: 		PortD = 0x00;
	CLRF        PORTD+0 
;problema2.c,14 :: 		CMCON = 7;
	MOVLW       7
	MOVWF       CMCON+0 
;problema2.c,15 :: 		ADCON1 = 0x0F;
	MOVLW       15
	MOVWF       ADCON1+0 
;problema2.c,16 :: 		RBPU_bit = 0;
	BCF         RBPU_bit+0, BitPos(RBPU_bit+0) 
;problema2.c,18 :: 		while(1){
L_main0:
;problema2.c,19 :: 		mostrar(i);
	MOVF        main_i_L0+0, 0 
	MOVWF       FARG_mostrar_i+0 
	CALL        _mostrar+0, 0
;problema2.c,20 :: 		cont++;
	INCF        main_cont_L0+0, 1 
;problema2.c,21 :: 		if(BOT1 == 0){
	BTFSC       INT0_bit+0, BitPos(INT0_bit+0) 
	GOTO        L_main2
;problema2.c,22 :: 		x = !x;
	MOVF        main_x_L0+0, 1 
	MOVLW       1
	BTFSS       STATUS+0, 2 
	MOVLW       0
	MOVWF       main_x_L0+0 
;problema2.c,23 :: 		}
L_main2:
;problema2.c,24 :: 		if(x == 1){
	MOVF        main_x_L0+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main3
;problema2.c,25 :: 		if(cont >= 13){
	MOVLW       13
	SUBWF       main_cont_L0+0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L_main4
;problema2.c,26 :: 		i++;
	INCF        main_i_L0+0, 1 
;problema2.c,27 :: 		cont = 0;
	CLRF        main_cont_L0+0 
;problema2.c,28 :: 		}
L_main4:
;problema2.c,29 :: 		}
L_main3:
;problema2.c,30 :: 		if(i == 25){
	MOVF        main_i_L0+0, 0 
	XORLW       25
	BTFSS       STATUS+0, 2 
	GOTO        L_main5
;problema2.c,31 :: 		RA5_bit = 0;
	BCF         RA5_bit+0, BitPos(RA5_bit+0) 
;problema2.c,32 :: 		RA2_bit = 0;
	BCF         RA2_bit+0, BitPos(RA2_bit+0) 
;problema2.c,33 :: 		RE0_bit = 0;
	BCF         RE0_bit+0, BitPos(RE0_bit+0) 
;problema2.c,34 :: 		RE2_bit = 0;
	BCF         RE2_bit+0, BitPos(RE2_bit+0) 
;problema2.c,35 :: 		delay_ms(1000);
	MOVLW       26
	MOVWF       R11, 0
	MOVLW       94
	MOVWF       R12, 0
	MOVLW       110
	MOVWF       R13, 0
L_main6:
	DECFSZ      R13, 1, 1
	BRA         L_main6
	DECFSZ      R12, 1, 1
	BRA         L_main6
	DECFSZ      R11, 1, 1
	BRA         L_main6
	NOP
;problema2.c,36 :: 		i = 0;
	CLRF        main_i_L0+0 
;problema2.c,37 :: 		}
L_main5:
;problema2.c,38 :: 		}
	GOTO        L_main0
;problema2.c,39 :: 		}
L_end_main:
	GOTO        $+0
; end of _main

_mostrar:

;problema2.c,40 :: 		void mostrar(short i){
;problema2.c,41 :: 		PortD = palavra[i];
	MOVLW       _palavra+0
	MOVWF       FSR0L+0 
	MOVLW       hi_addr(_palavra+0)
	MOVWF       FSR0L+1 
	MOVF        FARG_mostrar_i+0, 0 
	ADDWF       FSR0L+0, 1 
	MOVLW       0
	BTFSC       FARG_mostrar_i+0, 7 
	MOVLW       255
	ADDWFC      FSR0L+1, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       PORTD+0 
;problema2.c,42 :: 		RA5_bit = 1;
	BSF         RA5_bit+0, BitPos(RA5_bit+0) 
;problema2.c,43 :: 		RA2_bit = 0;
	BCF         RA2_bit+0, BitPos(RA2_bit+0) 
;problema2.c,44 :: 		RE0_bit = 0;
	BCF         RE0_bit+0, BitPos(RE0_bit+0) 
;problema2.c,45 :: 		RE2_bit = 0;
	BCF         RE2_bit+0, BitPos(RE2_bit+0) 
;problema2.c,46 :: 		delay_ms(5);
	MOVLW       33
	MOVWF       R12, 0
	MOVLW       118
	MOVWF       R13, 0
L_mostrar7:
	DECFSZ      R13, 1, 1
	BRA         L_mostrar7
	DECFSZ      R12, 1, 1
	BRA         L_mostrar7
	NOP
;problema2.c,47 :: 		PortD = palavra[i + 1];
	MOVF        FARG_mostrar_i+0, 0 
	ADDLW       1
	MOVWF       R0 
	CLRF        R1 
	MOVLW       0
	BTFSC       FARG_mostrar_i+0, 7 
	MOVLW       255
	ADDWFC      R1, 1 
	MOVLW       _palavra+0
	ADDWF       R0, 0 
	MOVWF       FSR0L+0 
	MOVLW       hi_addr(_palavra+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0L+1 
	MOVF        POSTINC0+0, 0 
	MOVWF       PORTD+0 
;problema2.c,48 :: 		RA5_bit = 0;
	BCF         RA5_bit+0, BitPos(RA5_bit+0) 
;problema2.c,49 :: 		RA2_bit = 1;
	BSF         RA2_bit+0, BitPos(RA2_bit+0) 
;problema2.c,50 :: 		RE0_bit = 0;
	BCF         RE0_bit+0, BitPos(RE0_bit+0) 
;problema2.c,51 :: 		RE2_bit = 0;
	BCF         RE2_bit+0, BitPos(RE2_bit+0) 
;problema2.c,52 :: 		delay_ms(5);
	MOVLW       33
	MOVWF       R12, 0
	MOVLW       118
	MOVWF       R13, 0
L_mostrar8:
	DECFSZ      R13, 1, 1
	BRA         L_mostrar8
	DECFSZ      R12, 1, 1
	BRA         L_mostrar8
	NOP
;problema2.c,53 :: 		PortD = palavra[i + 2];
	MOVLW       2
	ADDWF       FARG_mostrar_i+0, 0 
	MOVWF       R0 
	MOVLW       0
	BTFSC       FARG_mostrar_i+0, 7 
	MOVLW       255
	MOVWF       R1 
	MOVLW       0
	ADDWFC      R1, 1 
	MOVLW       _palavra+0
	ADDWF       R0, 0 
	MOVWF       FSR0L+0 
	MOVLW       hi_addr(_palavra+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0L+1 
	MOVF        POSTINC0+0, 0 
	MOVWF       PORTD+0 
;problema2.c,54 :: 		RA5_bit = 0;
	BCF         RA5_bit+0, BitPos(RA5_bit+0) 
;problema2.c,55 :: 		RA2_bit = 0;
	BCF         RA2_bit+0, BitPos(RA2_bit+0) 
;problema2.c,56 :: 		RE0_bit = 1;
	BSF         RE0_bit+0, BitPos(RE0_bit+0) 
;problema2.c,57 :: 		RE2_bit = 0;
	BCF         RE2_bit+0, BitPos(RE2_bit+0) 
;problema2.c,58 :: 		delay_ms(5);
	MOVLW       33
	MOVWF       R12, 0
	MOVLW       118
	MOVWF       R13, 0
L_mostrar9:
	DECFSZ      R13, 1, 1
	BRA         L_mostrar9
	DECFSZ      R12, 1, 1
	BRA         L_mostrar9
	NOP
;problema2.c,59 :: 		PortD = palavra[i + 3];
	MOVLW       3
	ADDWF       FARG_mostrar_i+0, 0 
	MOVWF       R0 
	MOVLW       0
	BTFSC       FARG_mostrar_i+0, 7 
	MOVLW       255
	MOVWF       R1 
	MOVLW       0
	ADDWFC      R1, 1 
	MOVLW       _palavra+0
	ADDWF       R0, 0 
	MOVWF       FSR0L+0 
	MOVLW       hi_addr(_palavra+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0L+1 
	MOVF        POSTINC0+0, 0 
	MOVWF       PORTD+0 
;problema2.c,60 :: 		RA5_bit = 0;
	BCF         RA5_bit+0, BitPos(RA5_bit+0) 
;problema2.c,61 :: 		RA2_bit = 0;
	BCF         RA2_bit+0, BitPos(RA2_bit+0) 
;problema2.c,62 :: 		RE0_bit = 0;
	BCF         RE0_bit+0, BitPos(RE0_bit+0) 
;problema2.c,63 :: 		RE2_bit = 1;
	BSF         RE2_bit+0, BitPos(RE2_bit+0) 
;problema2.c,64 :: 		delay_ms(5);
	MOVLW       33
	MOVWF       R12, 0
	MOVLW       118
	MOVWF       R13, 0
L_mostrar10:
	DECFSZ      R13, 1, 1
	BRA         L_mostrar10
	DECFSZ      R12, 1, 1
	BRA         L_mostrar10
	NOP
;problema2.c,65 :: 		}
L_end_mostrar:
	RETURN      0
; end of _mostrar

_volta:

;problema2.c,67 :: 		void volta(short i){
;problema2.c,68 :: 		PortD = palavra[i];
	MOVLW       _palavra+0
	MOVWF       FSR0L+0 
	MOVLW       hi_addr(_palavra+0)
	MOVWF       FSR0L+1 
	MOVF        FARG_volta_i+0, 0 
	ADDWF       FSR0L+0, 1 
	MOVLW       0
	BTFSC       FARG_volta_i+0, 7 
	MOVLW       255
	ADDWFC      FSR0L+1, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       PORTD+0 
;problema2.c,69 :: 		RA5_bit = 1;
	BSF         RA5_bit+0, BitPos(RA5_bit+0) 
;problema2.c,70 :: 		RA2_bit = 0;
	BCF         RA2_bit+0, BitPos(RA2_bit+0) 
;problema2.c,71 :: 		RE0_bit = 0;
	BCF         RE0_bit+0, BitPos(RE0_bit+0) 
;problema2.c,72 :: 		RE2_bit = 0;
	BCF         RE2_bit+0, BitPos(RE2_bit+0) 
;problema2.c,73 :: 		delay_ms(10);
	MOVLW       65
	MOVWF       R12, 0
	MOVLW       238
	MOVWF       R13, 0
L_volta11:
	DECFSZ      R13, 1, 1
	BRA         L_volta11
	DECFSZ      R12, 1, 1
	BRA         L_volta11
	NOP
;problema2.c,74 :: 		PortD = palavra[i + 1];
	MOVF        FARG_volta_i+0, 0 
	ADDLW       1
	MOVWF       R0 
	CLRF        R1 
	MOVLW       0
	BTFSC       FARG_volta_i+0, 7 
	MOVLW       255
	ADDWFC      R1, 1 
	MOVLW       _palavra+0
	ADDWF       R0, 0 
	MOVWF       FSR0L+0 
	MOVLW       hi_addr(_palavra+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0L+1 
	MOVF        POSTINC0+0, 0 
	MOVWF       PORTD+0 
;problema2.c,75 :: 		RA5_bit = 0;
	BCF         RA5_bit+0, BitPos(RA5_bit+0) 
;problema2.c,76 :: 		RA2_bit = 1;
	BSF         RA2_bit+0, BitPos(RA2_bit+0) 
;problema2.c,77 :: 		RE0_bit = 0;
	BCF         RE0_bit+0, BitPos(RE0_bit+0) 
;problema2.c,78 :: 		RE2_bit = 0;
	BCF         RE2_bit+0, BitPos(RE2_bit+0) 
;problema2.c,79 :: 		delay_ms(10);
	MOVLW       65
	MOVWF       R12, 0
	MOVLW       238
	MOVWF       R13, 0
L_volta12:
	DECFSZ      R13, 1, 1
	BRA         L_volta12
	DECFSZ      R12, 1, 1
	BRA         L_volta12
	NOP
;problema2.c,80 :: 		PortD = palavra[i + 2];
	MOVLW       2
	ADDWF       FARG_volta_i+0, 0 
	MOVWF       R0 
	MOVLW       0
	BTFSC       FARG_volta_i+0, 7 
	MOVLW       255
	MOVWF       R1 
	MOVLW       0
	ADDWFC      R1, 1 
	MOVLW       _palavra+0
	ADDWF       R0, 0 
	MOVWF       FSR0L+0 
	MOVLW       hi_addr(_palavra+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0L+1 
	MOVF        POSTINC0+0, 0 
	MOVWF       PORTD+0 
;problema2.c,81 :: 		RA5_bit = 0;
	BCF         RA5_bit+0, BitPos(RA5_bit+0) 
;problema2.c,82 :: 		RA2_bit = 0;
	BCF         RA2_bit+0, BitPos(RA2_bit+0) 
;problema2.c,83 :: 		RE0_bit = 1;
	BSF         RE0_bit+0, BitPos(RE0_bit+0) 
;problema2.c,84 :: 		RE2_bit = 0;
	BCF         RE2_bit+0, BitPos(RE2_bit+0) 
;problema2.c,85 :: 		delay_ms(10);
	MOVLW       65
	MOVWF       R12, 0
	MOVLW       238
	MOVWF       R13, 0
L_volta13:
	DECFSZ      R13, 1, 1
	BRA         L_volta13
	DECFSZ      R12, 1, 1
	BRA         L_volta13
	NOP
;problema2.c,86 :: 		PortD = palavra[i + 3];
	MOVLW       3
	ADDWF       FARG_volta_i+0, 0 
	MOVWF       R0 
	MOVLW       0
	BTFSC       FARG_volta_i+0, 7 
	MOVLW       255
	MOVWF       R1 
	MOVLW       0
	ADDWFC      R1, 1 
	MOVLW       _palavra+0
	ADDWF       R0, 0 
	MOVWF       FSR0L+0 
	MOVLW       hi_addr(_palavra+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0L+1 
	MOVF        POSTINC0+0, 0 
	MOVWF       PORTD+0 
;problema2.c,87 :: 		RA5_bit = 0;
	BCF         RA5_bit+0, BitPos(RA5_bit+0) 
;problema2.c,88 :: 		RA2_bit = 0;
	BCF         RA2_bit+0, BitPos(RA2_bit+0) 
;problema2.c,89 :: 		RE0_bit = 0;
	BCF         RE0_bit+0, BitPos(RE0_bit+0) 
;problema2.c,90 :: 		RE2_bit = 1;
	BSF         RE2_bit+0, BitPos(RE2_bit+0) 
;problema2.c,91 :: 		delay_ms(10);
	MOVLW       65
	MOVWF       R12, 0
	MOVLW       238
	MOVWF       R13, 0
L_volta14:
	DECFSZ      R13, 1, 1
	BRA         L_volta14
	DECFSZ      R12, 1, 1
	BRA         L_volta14
	NOP
;problema2.c,92 :: 		}
L_end_volta:
	RETURN      0
; end of _volta
