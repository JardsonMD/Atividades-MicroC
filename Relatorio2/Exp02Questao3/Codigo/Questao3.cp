#line 1 "C:/Users/jards/OneDrive/Documents/Faculdade/Arquitetura/Relatorio2/Exp02Questao3/Codigo/Questao3.c"


unsigned short faca[] = {0x71, 0x77, 0x39, 0x77};
unsigned short comp[] = {0x39, 0x3F, 0x15, 0x73};

void rot1();
void rot2();

void main() {
 unsigned short x = 0;
 TrisB = 0xFF;
 TrisA = 0x00;
 TrisE = 0x00;
 TrisD = 0x00;
 PortB = 0xFF;
 PortD = 0x40;
 PortA = 0xFF;
 PortE = 0xFF;
 CMCON = 7;
 ADCON1 = 0x0F;
 RBPU_bit = 0;

 while(1){
 if( INT0_bit  == 0){
 x = 1;
 }
 if( INT1_bit  == 0){
 x = 2;
 }
 if(x == 1){
 rot1();
 }
 if(x == 2){
 rot2();
 }
 }
}

void rot1(){
 PortD = faca[0];
 RA5_bit = 1;
 RA2_bit = 0;
 RE0_bit = 0;
 RE2_bit = 0;
 delay_ms(10);
 PortD = faca[1];
 RA5_bit = 0;
 RA2_bit = 1;
 RE0_bit = 0;
 RE2_bit = 0;
 delay_ms(10);
 PortD = faca[2];
 RA5_bit = 0;
 RA2_bit = 0;
 RE0_bit = 1;
 RE2_bit = 0;
 delay_ms(10);
 PortD = faca[3];
 RA5_bit = 0;
 RA2_bit = 0;
 RE0_bit = 0;
 RE2_bit = 1;
 delay_ms(10);
}

void rot2(){
 PortD = comp[0];
 RA5_bit = 1;
 RA2_bit = 0;
 RE0_bit = 0;
 RE2_bit = 0;
 delay_ms(10);
 PortD = comp[1];
 RA5_bit = 0;
 RA2_bit = 1;
 RE0_bit = 0;
 RE2_bit = 0;
 delay_ms(10);
 PortD = comp[2];
 RA5_bit = 0;
 RA2_bit = 0;
 RE0_bit = 1;
 RE2_bit = 0;
 delay_ms(10);
 PortD = comp[3];
 RA5_bit = 0;
 RA2_bit = 0;
 RE0_bit = 0;
 RE2_bit = 1;
 delay_ms(10);
}
