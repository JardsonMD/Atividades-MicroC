#line 1 "C:/Users/jards/OneDrive/Documents/Faculdade/Arquitetura/Relatorio1/Exp01Questao1/codigo2/questao1.c"



void main(){
unsigned short x = 0, y = 0;
 bit z;
 z = 0;
 TrisB = 0xFF;
 TrisD = 0x00;
 PortD = 0xFF;
 PortB = 0xFF;
 ADCON1 = 0x0F;
 CMCON = 7;
 RBPU_bit = 0;
 while(1){
 if( RB0_bit  == 0){
 if(z == 1){
 PortD = 0xFF;
 z = 0;
 }
 x = 1;
 y = 0;
 }
 if( RB1_bit  == 0){
 if(z == 1){
 PortD = 0x0F;
 z = 0;
 }
 y = 1;
 x = 0;
 }
 if(RB2_bit == 0){
 delay_ms(250);
 z = !z;
 }
 if(x == 1 & z == 0){
 delay_ms(500);
 if(PortD == 0xF0 || PortD < 0xF0){
 PortD = 0xFF;
 }
 PortD = PortD - 1;
 }
 if(y == 1 & z == 0){
 delay_ms(500);
 if(PortD == 0xFF || PortD < 0x0F){
 PortD = 0x0F;
 }
 PortD = PortD + 0x10;
 }
 }
}
