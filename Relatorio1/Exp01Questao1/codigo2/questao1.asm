
_main:

;questao1.c,4 :: 		void main(){
;questao1.c,5 :: 		unsigned short x = 0, y = 0;
	CLRF        main_x_L0+0 
	CLRF        main_y_L0+0 
;questao1.c,7 :: 		z = 0;
	BCF         main_z_L0+0, BitPos(main_z_L0+0) 
;questao1.c,8 :: 		TrisB = 0xFF;
	MOVLW       255
	MOVWF       TRISB+0 
;questao1.c,9 :: 		TrisD = 0x00;
	CLRF        TRISD+0 
;questao1.c,10 :: 		PortD = 0xFF;
	MOVLW       255
	MOVWF       PORTD+0 
;questao1.c,11 :: 		PortB = 0xFF;
	MOVLW       255
	MOVWF       PORTB+0 
;questao1.c,12 :: 		ADCON1 = 0x0F;
	MOVLW       15
	MOVWF       ADCON1+0 
;questao1.c,13 :: 		CMCON = 7;
	MOVLW       7
	MOVWF       CMCON+0 
;questao1.c,14 :: 		RBPU_bit = 0;
	BCF         RBPU_bit+0, BitPos(RBPU_bit+0) 
;questao1.c,15 :: 		while(1){
L_main0:
;questao1.c,16 :: 		if(button1 == 0){
	BTFSC       RB0_bit+0, BitPos(RB0_bit+0) 
	GOTO        L_main2
;questao1.c,17 :: 		if(z == 1){
	BTFSS       main_z_L0+0, BitPos(main_z_L0+0) 
	GOTO        L_main3
;questao1.c,18 :: 		PortD = 0xFF;
	MOVLW       255
	MOVWF       PORTD+0 
;questao1.c,19 :: 		z = 0;
	BCF         main_z_L0+0, BitPos(main_z_L0+0) 
;questao1.c,20 :: 		}
L_main3:
;questao1.c,21 :: 		x = 1;
	MOVLW       1
	MOVWF       main_x_L0+0 
;questao1.c,22 :: 		y = 0;
	CLRF        main_y_L0+0 
;questao1.c,23 :: 		}
L_main2:
;questao1.c,24 :: 		if(button2 == 0){
	BTFSC       RB1_bit+0, BitPos(RB1_bit+0) 
	GOTO        L_main4
;questao1.c,25 :: 		if(z == 1){
	BTFSS       main_z_L0+0, BitPos(main_z_L0+0) 
	GOTO        L_main5
;questao1.c,26 :: 		PortD = 0x0F;
	MOVLW       15
	MOVWF       PORTD+0 
;questao1.c,27 :: 		z = 0;
	BCF         main_z_L0+0, BitPos(main_z_L0+0) 
;questao1.c,28 :: 		}
L_main5:
;questao1.c,29 :: 		y = 1;
	MOVLW       1
	MOVWF       main_y_L0+0 
;questao1.c,30 :: 		x = 0;
	CLRF        main_x_L0+0 
;questao1.c,31 :: 		}
L_main4:
;questao1.c,32 :: 		if(RB2_bit == 0){
	BTFSC       RB2_bit+0, BitPos(RB2_bit+0) 
	GOTO        L_main6
;questao1.c,33 :: 		delay_ms(250);
	MOVLW       7
	MOVWF       R11, 0
	MOVLW       88
	MOVWF       R12, 0
	MOVLW       89
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
;questao1.c,34 :: 		z = !z;
	BTG         main_z_L0+0, BitPos(main_z_L0+0) 
;questao1.c,35 :: 		}
L_main6:
;questao1.c,36 :: 		if(x == 1 & z == 0){
	MOVF        main_x_L0+0, 0 
	XORLW       1
	MOVLW       1
	BTFSS       STATUS+0, 2 
	MOVLW       0
	MOVWF       R1 
	BTFSC       main_z_L0+0, BitPos(main_z_L0+0) 
	GOTO        L__main21
	BSF         STATUS+0, 0 
	GOTO        L__main22
L__main21:
	BCF         STATUS+0, 0 
L__main22:
	CLRF        R0 
	BTFSC       STATUS+0, 0 
	INCF        R0, 1 
	MOVF        R1, 0 
	ANDWF       R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main8
;questao1.c,37 :: 		delay_ms(500);
	MOVLW       13
	MOVWF       R11, 0
	MOVLW       175
	MOVWF       R12, 0
	MOVLW       182
	MOVWF       R13, 0
L_main9:
	DECFSZ      R13, 1, 1
	BRA         L_main9
	DECFSZ      R12, 1, 1
	BRA         L_main9
	DECFSZ      R11, 1, 1
	BRA         L_main9
	NOP
;questao1.c,38 :: 		if(PortD == 0xF0 || PortD < 0xF0){
	MOVF        PORTD+0, 0 
	XORLW       240
	BTFSC       STATUS+0, 2 
	GOTO        L__main19
	MOVLW       240
	SUBWF       PORTD+0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L__main19
	GOTO        L_main12
L__main19:
;questao1.c,39 :: 		PortD = 0xFF;
	MOVLW       255
	MOVWF       PORTD+0 
;questao1.c,40 :: 		}
L_main12:
;questao1.c,41 :: 		PortD = PortD - 1;
	DECF        PORTD+0, 1 
;questao1.c,42 :: 		}
L_main8:
;questao1.c,43 :: 		if(y == 1 & z == 0){
	MOVF        main_y_L0+0, 0 
	XORLW       1
	MOVLW       1
	BTFSS       STATUS+0, 2 
	MOVLW       0
	MOVWF       R1 
	BTFSC       main_z_L0+0, BitPos(main_z_L0+0) 
	GOTO        L__main23
	BSF         STATUS+0, 0 
	GOTO        L__main24
L__main23:
	BCF         STATUS+0, 0 
L__main24:
	CLRF        R0 
	BTFSC       STATUS+0, 0 
	INCF        R0, 1 
	MOVF        R1, 0 
	ANDWF       R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main13
;questao1.c,44 :: 		delay_ms(500);
	MOVLW       13
	MOVWF       R11, 0
	MOVLW       175
	MOVWF       R12, 0
	MOVLW       182
	MOVWF       R13, 0
L_main14:
	DECFSZ      R13, 1, 1
	BRA         L_main14
	DECFSZ      R12, 1, 1
	BRA         L_main14
	DECFSZ      R11, 1, 1
	BRA         L_main14
	NOP
;questao1.c,45 :: 		if(PortD == 0xFF || PortD < 0x0F){
	MOVF        PORTD+0, 0 
	XORLW       255
	BTFSC       STATUS+0, 2 
	GOTO        L__main18
	MOVLW       15
	SUBWF       PORTD+0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L__main18
	GOTO        L_main17
L__main18:
;questao1.c,46 :: 		PortD = 0x0F;
	MOVLW       15
	MOVWF       PORTD+0 
;questao1.c,47 :: 		}
L_main17:
;questao1.c,48 :: 		PortD = PortD + 0x10;
	MOVLW       16
	ADDWF       PORTD+0, 1 
;questao1.c,49 :: 		}
L_main13:
;questao1.c,50 :: 		}
	GOTO        L_main0
;questao1.c,51 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
