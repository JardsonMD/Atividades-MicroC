
_main:

;Questao4.c,8 :: 		void main() {
;Questao4.c,9 :: 		unsigned short x = 0, i = 0, j = 0, y = 0, cont1 = 0;
	CLRF        main_i_L0+0 
	CLRF        main_j_L0+0 
	CLRF        main_y_L0+0 
	CLRF        main_cont1_L0+0 
;Questao4.c,10 :: 		TrisB = 0xFF;
	MOVLW       255
	MOVWF       TRISB+0 
;Questao4.c,11 :: 		TrisE = 0x00;
	CLRF        TRISE+0 
;Questao4.c,12 :: 		TrisD = 0x00;
	CLRF        TRISD+0 
;Questao4.c,13 :: 		PortB = 0xFF;
	MOVLW       255
	MOVWF       PORTB+0 
;Questao4.c,14 :: 		PortD = 0x00;
	CLRF        PORTD+0 
;Questao4.c,15 :: 		CMCON = 7;
	MOVLW       7
	MOVWF       CMCON+0 
;Questao4.c,16 :: 		ADCON1 = 0x0F;
	MOVLW       15
	MOVWF       ADCON1+0 
;Questao4.c,17 :: 		RBPU_bit = 0;
	BCF         RBPU_bit+0, BitPos(RBPU_bit+0) 
;Questao4.c,18 :: 		RE0_bit = 1;
	BSF         RE0_bit+0, BitPos(RE0_bit+0) 
;Questao4.c,19 :: 		RE2_bit = 1;
	BSF         RE2_bit+0, BitPos(RE2_bit+0) 
;Questao4.c,21 :: 		while(1){
L_main0:
;Questao4.c,22 :: 		mostrar(i, j);
	MOVF        main_i_L0+0, 0 
	MOVWF       FARG_mostrar_i+0 
	MOVF        main_j_L0+0, 0 
	MOVWF       FARG_mostrar_j+0 
	CALL        _mostrar+0, 0
;Questao4.c,23 :: 		cont1++;
	INCF        main_cont1_L0+0, 1 
;Questao4.c,24 :: 		if(BOT1 == 0){
	BTFSC       INT0_bit+0, BitPos(INT0_bit+0) 
	GOTO        L_main2
;Questao4.c,25 :: 		y = 1;
	MOVLW       1
	MOVWF       main_y_L0+0 
;Questao4.c,26 :: 		}
L_main2:
;Questao4.c,27 :: 		if(BOT2 == 0){
	BTFSC       INT1_bit+0, BitPos(INT1_bit+0) 
	GOTO        L_main3
;Questao4.c,28 :: 		y = 2;
	MOVLW       2
	MOVWF       main_y_L0+0 
;Questao4.c,29 :: 		}
L_main3:
;Questao4.c,30 :: 		if(BOT3 == 0){
	BTFSC       INT2_bit+0, BitPos(INT2_bit+0) 
	GOTO        L_main4
;Questao4.c,31 :: 		y = 3;
	MOVLW       3
	MOVWF       main_y_L0+0 
;Questao4.c,32 :: 		}
L_main4:
;Questao4.c,33 :: 		if(i == 10){
	MOVF        main_i_L0+0, 0 
	XORLW       10
	BTFSS       STATUS+0, 2 
	GOTO        L_main5
;Questao4.c,34 :: 		j++;
	INCF        main_j_L0+0, 1 
;Questao4.c,35 :: 		i = 0;
	CLRF        main_i_L0+0 
;Questao4.c,36 :: 		}
L_main5:
;Questao4.c,37 :: 		if(j == 10){
	MOVF        main_j_L0+0, 0 
	XORLW       10
	BTFSS       STATUS+0, 2 
	GOTO        L_main6
;Questao4.c,38 :: 		j = 0;
	CLRF        main_j_L0+0 
;Questao4.c,39 :: 		}
L_main6:
;Questao4.c,40 :: 		if(y == 1){
	MOVF        main_y_L0+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main7
;Questao4.c,41 :: 		if(cont1 == 50){
	MOVF        main_cont1_L0+0, 0 
	XORLW       50
	BTFSS       STATUS+0, 2 
	GOTO        L_main8
;Questao4.c,42 :: 		i++;
	INCF        main_i_L0+0, 1 
;Questao4.c,43 :: 		cont1 = 0;
	CLRF        main_cont1_L0+0 
;Questao4.c,44 :: 		}
L_main8:
;Questao4.c,45 :: 		}else if(y == 2){
	GOTO        L_main9
L_main7:
	MOVF        main_y_L0+0, 0 
	XORLW       2
	BTFSS       STATUS+0, 2 
	GOTO        L_main10
;Questao4.c,46 :: 		if(cont1 == 25){
	MOVF        main_cont1_L0+0, 0 
	XORLW       25
	BTFSS       STATUS+0, 2 
	GOTO        L_main11
;Questao4.c,47 :: 		i++;
	INCF        main_i_L0+0, 1 
;Questao4.c,48 :: 		cont1 = 0;
	CLRF        main_cont1_L0+0 
;Questao4.c,49 :: 		}
L_main11:
;Questao4.c,50 :: 		}else if(y == 3){
	GOTO        L_main12
L_main10:
	MOVF        main_y_L0+0, 0 
	XORLW       3
	BTFSS       STATUS+0, 2 
	GOTO        L_main13
;Questao4.c,51 :: 		if(cont1 == 12){
	MOVF        main_cont1_L0+0, 0 
	XORLW       12
	BTFSS       STATUS+0, 2 
	GOTO        L_main14
;Questao4.c,52 :: 		i++;
	INCF        main_i_L0+0, 1 
;Questao4.c,53 :: 		cont1 = 0;
	CLRF        main_cont1_L0+0 
;Questao4.c,54 :: 		}
L_main14:
;Questao4.c,55 :: 		}
L_main13:
L_main12:
L_main9:
;Questao4.c,56 :: 		}
	GOTO        L_main0
;Questao4.c,58 :: 		}
L_end_main:
	GOTO        $+0
; end of _main

_mostrar:

;Questao4.c,60 :: 		void mostrar(short i, short j){
;Questao4.c,61 :: 		PortD = cont[j];
	MOVLW       _cont+0
	MOVWF       FSR0L+0 
	MOVLW       hi_addr(_cont+0)
	MOVWF       FSR0L+1 
	MOVF        FARG_mostrar_j+0, 0 
	ADDWF       FSR0L+0, 1 
	MOVLW       0
	BTFSC       FARG_mostrar_j+0, 7 
	MOVLW       255
	ADDWFC      FSR0L+1, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       PORTD+0 
;Questao4.c,62 :: 		RE0_bit = 1;
	BSF         RE0_bit+0, BitPos(RE0_bit+0) 
;Questao4.c,63 :: 		RE2_bit = 0;
	BCF         RE2_bit+0, BitPos(RE2_bit+0) 
;Questao4.c,64 :: 		delay_ms(10);
	MOVLW       65
	MOVWF       R12, 0
	MOVLW       238
	MOVWF       R13, 0
L_mostrar15:
	DECFSZ      R13, 1, 1
	BRA         L_mostrar15
	DECFSZ      R12, 1, 1
	BRA         L_mostrar15
	NOP
;Questao4.c,65 :: 		PortD = cont[i];
	MOVLW       _cont+0
	MOVWF       FSR0L+0 
	MOVLW       hi_addr(_cont+0)
	MOVWF       FSR0L+1 
	MOVF        FARG_mostrar_i+0, 0 
	ADDWF       FSR0L+0, 1 
	MOVLW       0
	BTFSC       FARG_mostrar_i+0, 7 
	MOVLW       255
	ADDWFC      FSR0L+1, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       PORTD+0 
;Questao4.c,66 :: 		RE0_bit = 0;
	BCF         RE0_bit+0, BitPos(RE0_bit+0) 
;Questao4.c,67 :: 		RE2_bit = 1;
	BSF         RE2_bit+0, BitPos(RE2_bit+0) 
;Questao4.c,68 :: 		delay_ms(10);
	MOVLW       65
	MOVWF       R12, 0
	MOVLW       238
	MOVWF       R13, 0
L_mostrar16:
	DECFSZ      R13, 1, 1
	BRA         L_mostrar16
	DECFSZ      R12, 1, 1
	BRA         L_mostrar16
	NOP
;Questao4.c,69 :: 		}
L_end_mostrar:
	RETURN      0
; end of _mostrar
